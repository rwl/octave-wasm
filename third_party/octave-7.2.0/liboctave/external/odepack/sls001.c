#include "f2c.h"
struct {
    real conit, crate, el[13], elco[156]        /* was [13][12] */, hold,
            rmax, tesco[36]     /* was [3][12] */, ccmax, el0, h__, hmin,
            hmxi, hu, rc, tn, uround;
    integer init, mxstep, mxhnil, nhnil, nslast, nyh, ialth, ipup, lmax, meo,
            nqnyh, nslp, icf, ierpj, iersl, jcur, jstart, kflag, l, lyh, lewt,
             lacor, lsavf, lwm, liwm, meth, miter, maxord, maxcor, msbp,
            mxncf, n, nq, nst, nfe, nje, nqu;
} sls001_;
