
#include <oct.h>
#include <octave.h>
#include <parse.h>
#include <interpreter.h>
#include <builtin-defun-decls.h>

#include <emscripten.h>
#include <emscripten/bind.h>


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

    octave_value_list matpower_paths;
    matpower_paths(0) = octave_value("/usr/src/matpower7.0", '\'');
    Faddpath(interpreter, matpower_paths);
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
}
