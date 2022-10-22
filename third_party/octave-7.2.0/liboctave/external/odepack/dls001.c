#include "f2c.h"
struct {
    doublereal conit, crate, el[13], elco[156]  /* was [13][12] */, hold,
            rmax, tesco[36]     /* was [3][12] */, ccmax, el0, h__, hmin,
            hmxi, hu, rc, tn, uround;
    integer illin, init, lyh, lewt, lacor, lsavf, lwm, liwm, mxstep, mxhnil,
            nhnil, ntrep, nslast, nyh, ialth, ipup, lmax, meo, nqnyh, nslp,
            icf, ierpj, iersl, jcur, jstart, kflag, l, meth, miter, maxord,
            maxcor, msbp, mxncf, n, nq, nst, nfe, nje, nqu;
} dls001_;
