// Copyright 2022 Richard Lincoln. All rights reserved.

#include <string>

#include <oct.h>
#include <octave.h>
#include <parse.h>
#include <interpreter.h>
#include <builtin-defun-decls.h>

#include <emscripten.h>
#include <emscripten/bind.h>

int em_val_to_value_list(emscripten::val em_val, octave_value_list &val_list) {
  if (!em_val.isArray()) {
    std::cerr << "error: val argument must be an array" << std::endl;
    return 1;
  }

  const int l = em_val["length"].as<int>();

  for (int i = 0; i < l; i++) {
    emscripten::val val_i = em_val[i];

    if (val_i.instanceof(emscripten::val::global("Boolean"))) {
      val_list(i) = val_i.as<bool>();
    } else if (val_i.isString()) {
      val_list(i) = val_i.as<std::string>();
    } else if (val_i.isNumber()) {
      val_list(i) = val_i.as<double>();
    } else {
      std::cerr << "error: val[" << i << "] invalid type " << val_i.typeOf().as<std::string>() << std::endl;
      return 2;
    }
  }

  return 0;
}

int value_list_to_em_val(octave_value_list val_list, emscripten::val &em_val) {
  if (!em_val.isArray()) {
    std::cerr << "error: val reference must be an array" << std::endl;
    return 1;
  }

  for (int i = 0; i < val_list.length(); i++) {
    octave_value val_i = val_list(i);

    if (val_i.islogical()) {
      em_val.call<void>("push", val_i.bool_value());
    } else if (val_i.is_string()) {
      em_val.call<void>("push", val_i.string_value());
    } else if (val_i.is_scalar_type()) {
      em_val.call<void>("push", val_i.scalar_value());
    } else {
      std::cerr << "error: value_list[" << i << "] invalid type: " << val_i.type_name() << std::endl;
      return 2;
    }
  }

  return 0;
}

emscripten::val EMSCRIPTEN_KEEPALIVE fn_eval(std::string fn_name, emscripten::val args_val, int nargout) {
  octave_value_list in;
  if (em_val_to_value_list(args_val, in)) {
    return emscripten::val::undefined();
  }


//  std::cout << "feval: " << fn_name << " " << in.length() << " " << nargout << std::endl;

  octave_value_list out;
  try {
    out = octave::feval(fn_name, in, nargout);
  } catch (const octave::execution_exception& ex) {
    std::cerr << "error: " << last_error_message() << std::endl;
    return emscripten::val::undefined();
  }

  emscripten::val rv = emscripten::val::array();
  if (value_list_to_em_val(out, rv)) {
    return emscripten::val::undefined();
  }

//  std::cout << "rv: " << fn_name << " " << rv["length"].as<int>() << std::endl;

  return rv;
}

int main(int argc, char **argv) {
  std::cout << "Starting GNU Octave interpreter..." << std::endl;

  static octave::interpreter interpreter;

  interpreter.initialize_load_path(true);
  interpreter.read_init_files(true);
  int status = interpreter.execute();
  if (status != 0) {
      std::cerr << "creating interpreter failed: " << status << std::endl;
      return status;
  }

  try {
    octave_value_list octave_paths;
    octave_paths(0) = octave_value("/usr/src/octave/m/help:"
        "/usr/src/octave/m/general:"
        "/usr/src/octave/m/set:"
        "/usr/src/octave/m/miscellaneous:"
        "/usr/src/octave/m/strings:"
        "/usr/src/octave/m/sparse:"
        "/usr/src/octave/m/path:"
        "/usr/src/octave/m/io:"
        "/usr/src/octave/m/polynomial:"
        "/usr/src/octave/m/pkg:"
        "/usr/src/octave/m/time", '\'');
    Faddpath(interpreter, octave_paths);
  } catch (const octave::exit_exception& ex) {
    return ex.exit_status();
  } catch (const octave::execution_exception& ex) {
    std::cerr << "error adding paths: " << last_error_message() << std::endl;
    return 1;
  }

  if (argc > 1) {
    std::cerr << "invalid command: " << argv[1] << std::endl;
    return 2;
  }

  return 0;
}

EMSCRIPTEN_BINDINGS(my_module) {
  emscripten::function("last_error_message", &last_error_message);
  emscripten::function("feval", &fn_eval);
}
