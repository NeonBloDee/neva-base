(function () {
  const t = document.createElement("link").relList;
  if (t && t.supports && t.supports("modulepreload")) return;
  for (const i of document.querySelectorAll('link[rel="modulepreload"]')) r(i);
  new MutationObserver((i) => {
    for (const s of i)
      if (s.type === "childList")
        for (const o of s.addedNodes)
          o.tagName === "LINK" && o.rel === "modulepreload" && r(o);
  }).observe(document, { childList: !0, subtree: !0 });
  function n(i) {
    const s = {};
    return (
      i.integrity && (s.integrity = i.integrity),
      i.referrerPolicy && (s.referrerPolicy = i.referrerPolicy),
      i.crossOrigin === "use-credentials"
        ? (s.credentials = "include")
        : i.crossOrigin === "anonymous"
        ? (s.credentials = "omit")
        : (s.credentials = "same-origin"),
      s
    );
  }
  function r(i) {
    if (i.ep) return;
    i.ep = !0;
    const s = n(i);
    fetch(i.href, s);
  }
})();
var ki =
  typeof globalThis < "u"
    ? globalThis
    : typeof window < "u"
    ? window
    : typeof global < "u"
    ? global
    : typeof self < "u"
    ? self
    : {};
function Mh(e) {
  return e && e.__esModule && Object.prototype.hasOwnProperty.call(e, "default")
    ? e.default
    : e;
}
var bh = { exports: {} },
  ml = {},
  Lh = { exports: {} },
  U = {};
/**
 * @license React
 * react.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var bs = Symbol.for("react.element"),
  Yg = Symbol.for("react.portal"),
  Xg = Symbol.for("react.fragment"),
  Zg = Symbol.for("react.strict_mode"),
  Qg = Symbol.for("react.profiler"),
  qg = Symbol.for("react.provider"),
  Jg = Symbol.for("react.context"),
  ev = Symbol.for("react.forward_ref"),
  tv = Symbol.for("react.suspense"),
  nv = Symbol.for("react.memo"),
  rv = Symbol.for("react.lazy"),
  Nd = Symbol.iterator;
function iv(e) {
  return e === null || typeof e != "object"
    ? null
    : ((e = (Nd && e[Nd]) || e["@@iterator"]),
      typeof e == "function" ? e : null);
}
var Oh = {
    isMounted: function () {
      return !1;
    },
    enqueueForceUpdate: function () {},
    enqueueReplaceState: function () {},
    enqueueSetState: function () {},
  },
  Dh = Object.assign,
  Rh = {};
function ci(e, t, n) {
  (this.props = e),
    (this.context = t),
    (this.refs = Rh),
    (this.updater = n || Oh);
}
ci.prototype.isReactComponent = {};
ci.prototype.setState = function (e, t) {
  if (typeof e != "object" && typeof e != "function" && e != null)
    throw Error(
      "setState(...): takes an object of state variables to update or a function which returns an object of state variables."
    );
  this.updater.enqueueSetState(this, e, t, "setState");
};
ci.prototype.forceUpdate = function (e) {
  this.updater.enqueueForceUpdate(this, e, "forceUpdate");
};
function Vh() {}
Vh.prototype = ci.prototype;
function rc(e, t, n) {
  (this.props = e),
    (this.context = t),
    (this.refs = Rh),
    (this.updater = n || Oh);
}
var ic = (rc.prototype = new Vh());
ic.constructor = rc;
Dh(ic, ci.prototype);
ic.isPureReactComponent = !0;
var jd = Array.isArray,
  Ih = Object.prototype.hasOwnProperty,
  sc = { current: null },
  Nh = { key: !0, ref: !0, __self: !0, __source: !0 };
function jh(e, t, n) {
  var r,
    i = {},
    s = null,
    o = null;
  if (t != null)
    for (r in (t.ref !== void 0 && (o = t.ref),
    t.key !== void 0 && (s = "" + t.key),
    t))
      Ih.call(t, r) && !Nh.hasOwnProperty(r) && (i[r] = t[r]);
  var u = arguments.length - 2;
  if (u === 1) i.children = n;
  else if (1 < u) {
    for (var a = Array(u), d = 0; d < u; d++) a[d] = arguments[d + 2];
    i.children = a;
  }
  if (e && e.defaultProps)
    for (r in ((u = e.defaultProps), u)) i[r] === void 0 && (i[r] = u[r]);
  return {
    $$typeof: bs,
    type: e,
    key: s,
    ref: o,
    props: i,
    _owner: sc.current,
  };
}
function sv(e, t) {
  return {
    $$typeof: bs,
    type: e.type,
    key: t,
    ref: e.ref,
    props: e.props,
    _owner: e._owner,
  };
}
function oc(e) {
  return typeof e == "object" && e !== null && e.$$typeof === bs;
}
function ov(e) {
  var t = { "=": "=0", ":": "=2" };
  return (
    "$" +
    e.replace(/[=:]/g, function (n) {
      return t[n];
    })
  );
}
var Fd = /\/+/g;
function Ul(e, t) {
  return typeof e == "object" && e !== null && e.key != null
    ? ov("" + e.key)
    : t.toString(36);
}
function vo(e, t, n, r, i) {
  var s = typeof e;
  (s === "undefined" || s === "boolean") && (e = null);
  var o = !1;
  if (e === null) o = !0;
  else
    switch (s) {
      case "string":
      case "number":
        o = !0;
        break;
      case "object":
        switch (e.$$typeof) {
          case bs:
          case Yg:
            o = !0;
        }
    }
  if (o)
    return (
      (o = e),
      (i = i(o)),
      (e = r === "" ? "." + Ul(o, 0) : r),
      jd(i)
        ? ((n = ""),
          e != null && (n = e.replace(Fd, "$&/") + "/"),
          vo(i, t, n, "", function (d) {
            return d;
          }))
        : i != null &&
          (oc(i) &&
            (i = sv(
              i,
              n +
                (!i.key || (o && o.key === i.key)
                  ? ""
                  : ("" + i.key).replace(Fd, "$&/") + "/") +
                e
            )),
          t.push(i)),
      1
    );
  if (((o = 0), (r = r === "" ? "." : r + ":"), jd(e)))
    for (var u = 0; u < e.length; u++) {
      s = e[u];
      var a = r + Ul(s, u);
      o += vo(s, t, n, a, i);
    }
  else if (((a = iv(e)), typeof a == "function"))
    for (e = a.call(e), u = 0; !(s = e.next()).done; )
      (s = s.value), (a = r + Ul(s, u++)), (o += vo(s, t, n, a, i));
  else if (s === "object")
    throw (
      ((t = String(e)),
      Error(
        "Objects are not valid as a React child (found: " +
          (t === "[object Object]"
            ? "object with keys {" + Object.keys(e).join(", ") + "}"
            : t) +
          "). If you meant to render a collection of children, use an array instead."
      ))
    );
  return o;
}
function Us(e, t, n) {
  if (e == null) return e;
  var r = [],
    i = 0;
  return (
    vo(e, r, "", "", function (s) {
      return t.call(n, s, i++);
    }),
    r
  );
}
function lv(e) {
  if (e._status === -1) {
    var t = e._result;
    (t = t()),
      t.then(
        function (n) {
          (e._status === 0 || e._status === -1) &&
            ((e._status = 1), (e._result = n));
        },
        function (n) {
          (e._status === 0 || e._status === -1) &&
            ((e._status = 2), (e._result = n));
        }
      ),
      e._status === -1 && ((e._status = 0), (e._result = t));
  }
  if (e._status === 1) return e._result.default;
  throw e._result;
}
var Fe = { current: null },
  yo = { transition: null },
  av = {
    ReactCurrentDispatcher: Fe,
    ReactCurrentBatchConfig: yo,
    ReactCurrentOwner: sc,
  };
U.Children = {
  map: Us,
  forEach: function (e, t, n) {
    Us(
      e,
      function () {
        t.apply(this, arguments);
      },
      n
    );
  },
  count: function (e) {
    var t = 0;
    return (
      Us(e, function () {
        t++;
      }),
      t
    );
  },
  toArray: function (e) {
    return (
      Us(e, function (t) {
        return t;
      }) || []
    );
  },
  only: function (e) {
    if (!oc(e))
      throw Error(
        "React.Children.only expected to receive a single React element child."
      );
    return e;
  },
};
U.Component = ci;
U.Fragment = Xg;
U.Profiler = Qg;
U.PureComponent = rc;
U.StrictMode = Zg;
U.Suspense = tv;
U.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = av;
U.cloneElement = function (e, t, n) {
  if (e == null)
    throw Error(
      "React.cloneElement(...): The argument must be a React element, but you passed " +
        e +
        "."
    );
  var r = Dh({}, e.props),
    i = e.key,
    s = e.ref,
    o = e._owner;
  if (t != null) {
    if (
      (t.ref !== void 0 && ((s = t.ref), (o = sc.current)),
      t.key !== void 0 && (i = "" + t.key),
      e.type && e.type.defaultProps)
    )
      var u = e.type.defaultProps;
    for (a in t)
      Ih.call(t, a) &&
        !Nh.hasOwnProperty(a) &&
        (r[a] = t[a] === void 0 && u !== void 0 ? u[a] : t[a]);
  }
  var a = arguments.length - 2;
  if (a === 1) r.children = n;
  else if (1 < a) {
    u = Array(a);
    for (var d = 0; d < a; d++) u[d] = arguments[d + 2];
    r.children = u;
  }
  return { $$typeof: bs, type: e.type, key: i, ref: s, props: r, _owner: o };
};
U.createContext = function (e) {
  return (
    (e = {
      $$typeof: Jg,
      _currentValue: e,
      _currentValue2: e,
      _threadCount: 0,
      Provider: null,
      Consumer: null,
      _defaultValue: null,
      _globalName: null,
    }),
    (e.Provider = { $$typeof: qg, _context: e }),
    (e.Consumer = e)
  );
};
U.createElement = jh;
U.createFactory = function (e) {
  var t = jh.bind(null, e);
  return (t.type = e), t;
};
U.createRef = function () {
  return { current: null };
};
U.forwardRef = function (e) {
  return { $$typeof: ev, render: e };
};
U.isValidElement = oc;
U.lazy = function (e) {
  return { $$typeof: rv, _payload: { _status: -1, _result: e }, _init: lv };
};
U.memo = function (e, t) {
  return { $$typeof: nv, type: e, compare: t === void 0 ? null : t };
};
U.startTransition = function (e) {
  var t = yo.transition;
  yo.transition = {};
  try {
    e();
  } finally {
    yo.transition = t;
  }
};
U.unstable_act = function () {
  throw Error("act(...) is not supported in production builds of React.");
};
U.useCallback = function (e, t) {
  return Fe.current.useCallback(e, t);
};
U.useContext = function (e) {
  return Fe.current.useContext(e);
};
U.useDebugValue = function () {};
U.useDeferredValue = function (e) {
  return Fe.current.useDeferredValue(e);
};
U.useEffect = function (e, t) {
  return Fe.current.useEffect(e, t);
};
U.useId = function () {
  return Fe.current.useId();
};
U.useImperativeHandle = function (e, t, n) {
  return Fe.current.useImperativeHandle(e, t, n);
};
U.useInsertionEffect = function (e, t) {
  return Fe.current.useInsertionEffect(e, t);
};
U.useLayoutEffect = function (e, t) {
  return Fe.current.useLayoutEffect(e, t);
};
U.useMemo = function (e, t) {
  return Fe.current.useMemo(e, t);
};
U.useReducer = function (e, t, n) {
  return Fe.current.useReducer(e, t, n);
};
U.useRef = function (e) {
  return Fe.current.useRef(e);
};
U.useState = function (e) {
  return Fe.current.useState(e);
};
U.useSyncExternalStore = function (e, t, n) {
  return Fe.current.useSyncExternalStore(e, t, n);
};
U.useTransition = function () {
  return Fe.current.useTransition();
};
U.version = "18.2.0";
Lh.exports = U;
var C = Lh.exports;
const ee = Mh(C);
/**
 * @license React
 * react-jsx-runtime.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var uv = C,
  cv = Symbol.for("react.element"),
  dv = Symbol.for("react.fragment"),
  fv = Object.prototype.hasOwnProperty,
  pv = uv.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.ReactCurrentOwner,
  hv = { key: !0, ref: !0, __self: !0, __source: !0 };
function Fh(e, t, n) {
  var r,
    i = {},
    s = null,
    o = null;
  n !== void 0 && (s = "" + n),
    t.key !== void 0 && (s = "" + t.key),
    t.ref !== void 0 && (o = t.ref);
  for (r in t) fv.call(t, r) && !hv.hasOwnProperty(r) && (i[r] = t[r]);
  if (e && e.defaultProps)
    for (r in ((t = e.defaultProps), t)) i[r] === void 0 && (i[r] = t[r]);
  return {
    $$typeof: cv,
    type: e,
    key: s,
    ref: o,
    props: i,
    _owner: pv.current,
  };
}
ml.Fragment = dv;
ml.jsx = Fh;
ml.jsxs = Fh;
bh.exports = ml;
var _ = bh.exports,
  Ba = {},
  zh = { exports: {} },
  tt = {},
  Bh = { exports: {} },
  Hh = {};
/**
 * @license React
 * scheduler.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ (function (e) {
  function t(A, L) {
    var D = A.length;
    A.push(L);
    e: for (; 0 < D; ) {
      var z = (D - 1) >>> 1,
        Z = A[z];
      if (0 < i(Z, L)) (A[z] = L), (A[D] = Z), (D = z);
      else break e;
    }
  }
  function n(A) {
    return A.length === 0 ? null : A[0];
  }
  function r(A) {
    if (A.length === 0) return null;
    var L = A[0],
      D = A.pop();
    if (D !== L) {
      A[0] = D;
      e: for (var z = 0, Z = A.length, zt = Z >>> 1; z < zt; ) {
        var it = 2 * (z + 1) - 1,
          an = A[it],
          gt = it + 1,
          kt = A[gt];
        if (0 > i(an, D))
          gt < Z && 0 > i(kt, an)
            ? ((A[z] = kt), (A[gt] = D), (z = gt))
            : ((A[z] = an), (A[it] = D), (z = it));
        else if (gt < Z && 0 > i(kt, D)) (A[z] = kt), (A[gt] = D), (z = gt);
        else break e;
      }
    }
    return L;
  }
  function i(A, L) {
    var D = A.sortIndex - L.sortIndex;
    return D !== 0 ? D : A.id - L.id;
  }
  if (typeof performance == "object" && typeof performance.now == "function") {
    var s = performance;
    e.unstable_now = function () {
      return s.now();
    };
  } else {
    var o = Date,
      u = o.now();
    e.unstable_now = function () {
      return o.now() - u;
    };
  }
  var a = [],
    d = [],
    p = 1,
    l = null,
    c = 3,
    f = !1,
    m = !1,
    v = !1,
    w = typeof setTimeout == "function" ? setTimeout : null,
    h = typeof clearTimeout == "function" ? clearTimeout : null,
    g = typeof setImmediate < "u" ? setImmediate : null;
  typeof navigator < "u" &&
    navigator.scheduling !== void 0 &&
    navigator.scheduling.isInputPending !== void 0 &&
    navigator.scheduling.isInputPending.bind(navigator.scheduling);
  function y(A) {
    for (var L = n(d); L !== null; ) {
      if (L.callback === null) r(d);
      else if (L.startTime <= A)
        r(d), (L.sortIndex = L.expirationTime), t(a, L);
      else break;
      L = n(d);
    }
  }
  function x(A) {
    if (((v = !1), y(A), !m))
      if (n(a) !== null) (m = !0), Y(S);
      else {
        var L = n(d);
        L !== null && $(x, L.startTime - A);
      }
  }
  function S(A, L) {
    (m = !1), v && ((v = !1), h(E), (E = -1)), (f = !0);
    var D = c;
    try {
      for (
        y(L), l = n(a);
        l !== null && (!(l.expirationTime > L) || (A && !O()));

      ) {
        var z = l.callback;
        if (typeof z == "function") {
          (l.callback = null), (c = l.priorityLevel);
          var Z = z(l.expirationTime <= L);
          (L = e.unstable_now()),
            typeof Z == "function" ? (l.callback = Z) : l === n(a) && r(a),
            y(L);
        } else r(a);
        l = n(a);
      }
      if (l !== null) var zt = !0;
      else {
        var it = n(d);
        it !== null && $(x, it.startTime - L), (zt = !1);
      }
      return zt;
    } finally {
      (l = null), (c = D), (f = !1);
    }
  }
  var T = !1,
    M = null,
    E = -1,
    k = 5,
    P = -1;
  function O() {
    return !(e.unstable_now() - P < k);
  }
  function V() {
    if (M !== null) {
      var A = e.unstable_now();
      P = A;
      var L = !0;
      try {
        L = M(!0, A);
      } finally {
        L ? R() : ((T = !1), (M = null));
      }
    } else T = !1;
  }
  var R;
  if (typeof g == "function")
    R = function () {
      g(V);
    };
  else if (typeof MessageChannel < "u") {
    var N = new MessageChannel(),
      W = N.port2;
    (N.port1.onmessage = V),
      (R = function () {
        W.postMessage(null);
      });
  } else
    R = function () {
      w(V, 0);
    };
  function Y(A) {
    (M = A), T || ((T = !0), R());
  }
  function $(A, L) {
    E = w(function () {
      A(e.unstable_now());
    }, L);
  }
  (e.unstable_IdlePriority = 5),
    (e.unstable_ImmediatePriority = 1),
    (e.unstable_LowPriority = 4),
    (e.unstable_NormalPriority = 3),
    (e.unstable_Profiling = null),
    (e.unstable_UserBlockingPriority = 2),
    (e.unstable_cancelCallback = function (A) {
      A.callback = null;
    }),
    (e.unstable_continueExecution = function () {
      m || f || ((m = !0), Y(S));
    }),
    (e.unstable_forceFrameRate = function (A) {
      0 > A || 125 < A
        ? console.error(
            "forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported"
          )
        : (k = 0 < A ? Math.floor(1e3 / A) : 5);
    }),
    (e.unstable_getCurrentPriorityLevel = function () {
      return c;
    }),
    (e.unstable_getFirstCallbackNode = function () {
      return n(a);
    }),
    (e.unstable_next = function (A) {
      switch (c) {
        case 1:
        case 2:
        case 3:
          var L = 3;
          break;
        default:
          L = c;
      }
      var D = c;
      c = L;
      try {
        return A();
      } finally {
        c = D;
      }
    }),
    (e.unstable_pauseExecution = function () {}),
    (e.unstable_requestPaint = function () {}),
    (e.unstable_runWithPriority = function (A, L) {
      switch (A) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
          break;
        default:
          A = 3;
      }
      var D = c;
      c = A;
      try {
        return L();
      } finally {
        c = D;
      }
    }),
    (e.unstable_scheduleCallback = function (A, L, D) {
      var z = e.unstable_now();
      switch (
        (typeof D == "object" && D !== null
          ? ((D = D.delay), (D = typeof D == "number" && 0 < D ? z + D : z))
          : (D = z),
        A)
      ) {
        case 1:
          var Z = -1;
          break;
        case 2:
          Z = 250;
          break;
        case 5:
          Z = 1073741823;
          break;
        case 4:
          Z = 1e4;
          break;
        default:
          Z = 5e3;
      }
      return (
        (Z = D + Z),
        (A = {
          id: p++,
          callback: L,
          priorityLevel: A,
          startTime: D,
          expirationTime: Z,
          sortIndex: -1,
        }),
        D > z
          ? ((A.sortIndex = D),
            t(d, A),
            n(a) === null &&
              A === n(d) &&
              (v ? (h(E), (E = -1)) : (v = !0), $(x, D - z)))
          : ((A.sortIndex = Z), t(a, A), m || f || ((m = !0), Y(S))),
        A
      );
    }),
    (e.unstable_shouldYield = O),
    (e.unstable_wrapCallback = function (A) {
      var L = c;
      return function () {
        var D = c;
        c = L;
        try {
          return A.apply(this, arguments);
        } finally {
          c = D;
        }
      };
    });
})(Hh);
Bh.exports = Hh;
var mv = Bh.exports;
/**
 * @license React
 * react-dom.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var $h = C,
  Je = mv;
function b(e) {
  for (
    var t = "https://reactjs.org/docs/error-decoder.html?invariant=" + e, n = 1;
    n < arguments.length;
    n++
  )
    t += "&args[]=" + encodeURIComponent(arguments[n]);
  return (
    "Minified React error #" +
    e +
    "; visit " +
    t +
    " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
  );
}
var Gh = new Set(),
  os = {};
function hr(e, t) {
  Qr(e, t), Qr(e + "Capture", t);
}
function Qr(e, t) {
  for (os[e] = t, e = 0; e < t.length; e++) Gh.add(t[e]);
}
var tn = !(
    typeof window > "u" ||
    typeof window.document > "u" ||
    typeof window.document.createElement > "u"
  ),
  Ha = Object.prototype.hasOwnProperty,
  gv =
    /^[:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD][:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD\-.0-9\u00B7\u0300-\u036F\u203F-\u2040]*$/,
  zd = {},
  Bd = {};
function vv(e) {
  return Ha.call(Bd, e)
    ? !0
    : Ha.call(zd, e)
    ? !1
    : gv.test(e)
    ? (Bd[e] = !0)
    : ((zd[e] = !0), !1);
}
function yv(e, t, n, r) {
  if (n !== null && n.type === 0) return !1;
  switch (typeof t) {
    case "function":
    case "symbol":
      return !0;
    case "boolean":
      return r
        ? !1
        : n !== null
        ? !n.acceptsBooleans
        : ((e = e.toLowerCase().slice(0, 5)), e !== "data-" && e !== "aria-");
    default:
      return !1;
  }
}
function wv(e, t, n, r) {
  if (t === null || typeof t > "u" || yv(e, t, n, r)) return !0;
  if (r) return !1;
  if (n !== null)
    switch (n.type) {
      case 3:
        return !t;
      case 4:
        return t === !1;
      case 5:
        return isNaN(t);
      case 6:
        return isNaN(t) || 1 > t;
    }
  return !1;
}
function ze(e, t, n, r, i, s, o) {
  (this.acceptsBooleans = t === 2 || t === 3 || t === 4),
    (this.attributeName = r),
    (this.attributeNamespace = i),
    (this.mustUseProperty = n),
    (this.propertyName = e),
    (this.type = t),
    (this.sanitizeURL = s),
    (this.removeEmptyString = o);
}
var Pe = {};
"children dangerouslySetInnerHTML defaultValue defaultChecked innerHTML suppressContentEditableWarning suppressHydrationWarning style"
  .split(" ")
  .forEach(function (e) {
    Pe[e] = new ze(e, 0, !1, e, null, !1, !1);
  });
[
  ["acceptCharset", "accept-charset"],
  ["className", "class"],
  ["htmlFor", "for"],
  ["httpEquiv", "http-equiv"],
].forEach(function (e) {
  var t = e[0];
  Pe[t] = new ze(t, 1, !1, e[1], null, !1, !1);
});
["contentEditable", "draggable", "spellCheck", "value"].forEach(function (e) {
  Pe[e] = new ze(e, 2, !1, e.toLowerCase(), null, !1, !1);
});
[
  "autoReverse",
  "externalResourcesRequired",
  "focusable",
  "preserveAlpha",
].forEach(function (e) {
  Pe[e] = new ze(e, 2, !1, e, null, !1, !1);
});
"allowFullScreen async autoFocus autoPlay controls default defer disabled disablePictureInPicture disableRemotePlayback formNoValidate hidden loop noModule noValidate open playsInline readOnly required reversed scoped seamless itemScope"
  .split(" ")
  .forEach(function (e) {
    Pe[e] = new ze(e, 3, !1, e.toLowerCase(), null, !1, !1);
  });
["checked", "multiple", "muted", "selected"].forEach(function (e) {
  Pe[e] = new ze(e, 3, !0, e, null, !1, !1);
});
["capture", "download"].forEach(function (e) {
  Pe[e] = new ze(e, 4, !1, e, null, !1, !1);
});
["cols", "rows", "size", "span"].forEach(function (e) {
  Pe[e] = new ze(e, 6, !1, e, null, !1, !1);
});
["rowSpan", "start"].forEach(function (e) {
  Pe[e] = new ze(e, 5, !1, e.toLowerCase(), null, !1, !1);
});
var lc = /[\-:]([a-z])/g;
function ac(e) {
  return e[1].toUpperCase();
}
"accent-height alignment-baseline arabic-form baseline-shift cap-height clip-path clip-rule color-interpolation color-interpolation-filters color-profile color-rendering dominant-baseline enable-background fill-opacity fill-rule flood-color flood-opacity font-family font-size font-size-adjust font-stretch font-style font-variant font-weight glyph-name glyph-orientation-horizontal glyph-orientation-vertical horiz-adv-x horiz-origin-x image-rendering letter-spacing lighting-color marker-end marker-mid marker-start overline-position overline-thickness paint-order panose-1 pointer-events rendering-intent shape-rendering stop-color stop-opacity strikethrough-position strikethrough-thickness stroke-dasharray stroke-dashoffset stroke-linecap stroke-linejoin stroke-miterlimit stroke-opacity stroke-width text-anchor text-decoration text-rendering underline-position underline-thickness unicode-bidi unicode-range units-per-em v-alphabetic v-hanging v-ideographic v-mathematical vector-effect vert-adv-y vert-origin-x vert-origin-y word-spacing writing-mode xmlns:xlink x-height"
  .split(" ")
  .forEach(function (e) {
    var t = e.replace(lc, ac);
    Pe[t] = new ze(t, 1, !1, e, null, !1, !1);
  });
"xlink:actuate xlink:arcrole xlink:role xlink:show xlink:title xlink:type"
  .split(" ")
  .forEach(function (e) {
    var t = e.replace(lc, ac);
    Pe[t] = new ze(t, 1, !1, e, "http://www.w3.org/1999/xlink", !1, !1);
  });
["xml:base", "xml:lang", "xml:space"].forEach(function (e) {
  var t = e.replace(lc, ac);
  Pe[t] = new ze(t, 1, !1, e, "http://www.w3.org/XML/1998/namespace", !1, !1);
});
["tabIndex", "crossOrigin"].forEach(function (e) {
  Pe[e] = new ze(e, 1, !1, e.toLowerCase(), null, !1, !1);
});
Pe.xlinkHref = new ze(
  "xlinkHref",
  1,
  !1,
  "xlink:href",
  "http://www.w3.org/1999/xlink",
  !0,
  !1
);
["src", "href", "action", "formAction"].forEach(function (e) {
  Pe[e] = new ze(e, 1, !1, e.toLowerCase(), null, !0, !0);
});
function uc(e, t, n, r) {
  var i = Pe.hasOwnProperty(t) ? Pe[t] : null;
  (i !== null
    ? i.type !== 0
    : r ||
      !(2 < t.length) ||
      (t[0] !== "o" && t[0] !== "O") ||
      (t[1] !== "n" && t[1] !== "N")) &&
    (wv(t, n, i, r) && (n = null),
    r || i === null
      ? vv(t) && (n === null ? e.removeAttribute(t) : e.setAttribute(t, "" + n))
      : i.mustUseProperty
      ? (e[i.propertyName] = n === null ? (i.type === 3 ? !1 : "") : n)
      : ((t = i.attributeName),
        (r = i.attributeNamespace),
        n === null
          ? e.removeAttribute(t)
          : ((i = i.type),
            (n = i === 3 || (i === 4 && n === !0) ? "" : "" + n),
            r ? e.setAttributeNS(r, t, n) : e.setAttribute(t, n))));
}
var ln = $h.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED,
  Ks = Symbol.for("react.element"),
  Pr = Symbol.for("react.portal"),
  Ar = Symbol.for("react.fragment"),
  cc = Symbol.for("react.strict_mode"),
  $a = Symbol.for("react.profiler"),
  Wh = Symbol.for("react.provider"),
  Uh = Symbol.for("react.context"),
  dc = Symbol.for("react.forward_ref"),
  Ga = Symbol.for("react.suspense"),
  Wa = Symbol.for("react.suspense_list"),
  fc = Symbol.for("react.memo"),
  mn = Symbol.for("react.lazy"),
  Kh = Symbol.for("react.offscreen"),
  Hd = Symbol.iterator;
function Mi(e) {
  return e === null || typeof e != "object"
    ? null
    : ((e = (Hd && e[Hd]) || e["@@iterator"]),
      typeof e == "function" ? e : null);
}
var ce = Object.assign,
  Kl;
function zi(e) {
  if (Kl === void 0)
    try {
      throw Error();
    } catch (n) {
      var t = n.stack.trim().match(/\n( *(at )?)/);
      Kl = (t && t[1]) || "";
    }
  return (
    `
` +
    Kl +
    e
  );
}
var Yl = !1;
function Xl(e, t) {
  if (!e || Yl) return "";
  Yl = !0;
  var n = Error.prepareStackTrace;
  Error.prepareStackTrace = void 0;
  try {
    if (t)
      if (
        ((t = function () {
          throw Error();
        }),
        Object.defineProperty(t.prototype, "props", {
          set: function () {
            throw Error();
          },
        }),
        typeof Reflect == "object" && Reflect.construct)
      ) {
        try {
          Reflect.construct(t, []);
        } catch (d) {
          var r = d;
        }
        Reflect.construct(e, [], t);
      } else {
        try {
          t.call();
        } catch (d) {
          r = d;
        }
        e.call(t.prototype);
      }
    else {
      try {
        throw Error();
      } catch (d) {
        r = d;
      }
      e();
    }
  } catch (d) {
    if (d && r && typeof d.stack == "string") {
      for (
        var i = d.stack.split(`
`),
          s = r.stack.split(`
`),
          o = i.length - 1,
          u = s.length - 1;
        1 <= o && 0 <= u && i[o] !== s[u];

      )
        u--;
      for (; 1 <= o && 0 <= u; o--, u--)
        if (i[o] !== s[u]) {
          if (o !== 1 || u !== 1)
            do
              if ((o--, u--, 0 > u || i[o] !== s[u])) {
                var a =
                  `
` + i[o].replace(" at new ", " at ");
                return (
                  e.displayName &&
                    a.includes("<anonymous>") &&
                    (a = a.replace("<anonymous>", e.displayName)),
                  a
                );
              }
            while (1 <= o && 0 <= u);
          break;
        }
    }
  } finally {
    (Yl = !1), (Error.prepareStackTrace = n);
  }
  return (e = e ? e.displayName || e.name : "") ? zi(e) : "";
}
function xv(e) {
  switch (e.tag) {
    case 5:
      return zi(e.type);
    case 16:
      return zi("Lazy");
    case 13:
      return zi("Suspense");
    case 19:
      return zi("SuspenseList");
    case 0:
    case 2:
    case 15:
      return (e = Xl(e.type, !1)), e;
    case 11:
      return (e = Xl(e.type.render, !1)), e;
    case 1:
      return (e = Xl(e.type, !0)), e;
    default:
      return "";
  }
}
function Ua(e) {
  if (e == null) return null;
  if (typeof e == "function") return e.displayName || e.name || null;
  if (typeof e == "string") return e;
  switch (e) {
    case Ar:
      return "Fragment";
    case Pr:
      return "Portal";
    case $a:
      return "Profiler";
    case cc:
      return "StrictMode";
    case Ga:
      return "Suspense";
    case Wa:
      return "SuspenseList";
  }
  if (typeof e == "object")
    switch (e.$$typeof) {
      case Uh:
        return (e.displayName || "Context") + ".Consumer";
      case Wh:
        return (e._context.displayName || "Context") + ".Provider";
      case dc:
        var t = e.render;
        return (
          (e = e.displayName),
          e ||
            ((e = t.displayName || t.name || ""),
            (e = e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef")),
          e
        );
      case fc:
        return (
          (t = e.displayName || null), t !== null ? t : Ua(e.type) || "Memo"
        );
      case mn:
        (t = e._payload), (e = e._init);
        try {
          return Ua(e(t));
        } catch {}
    }
  return null;
}
function Sv(e) {
  var t = e.type;
  switch (e.tag) {
    case 24:
      return "Cache";
    case 9:
      return (t.displayName || "Context") + ".Consumer";
    case 10:
      return (t._context.displayName || "Context") + ".Provider";
    case 18:
      return "DehydratedFragment";
    case 11:
      return (
        (e = t.render),
        (e = e.displayName || e.name || ""),
        t.displayName || (e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef")
      );
    case 7:
      return "Fragment";
    case 5:
      return t;
    case 4:
      return "Portal";
    case 3:
      return "Root";
    case 6:
      return "Text";
    case 16:
      return Ua(t);
    case 8:
      return t === cc ? "StrictMode" : "Mode";
    case 22:
      return "Offscreen";
    case 12:
      return "Profiler";
    case 21:
      return "Scope";
    case 13:
      return "Suspense";
    case 19:
      return "SuspenseList";
    case 25:
      return "TracingMarker";
    case 1:
    case 0:
    case 17:
    case 2:
    case 14:
    case 15:
      if (typeof t == "function") return t.displayName || t.name || null;
      if (typeof t == "string") return t;
  }
  return null;
}
function bn(e) {
  switch (typeof e) {
    case "boolean":
    case "number":
    case "string":
    case "undefined":
      return e;
    case "object":
      return e;
    default:
      return "";
  }
}
function Yh(e) {
  var t = e.type;
  return (
    (e = e.nodeName) &&
    e.toLowerCase() === "input" &&
    (t === "checkbox" || t === "radio")
  );
}
function _v(e) {
  var t = Yh(e) ? "checked" : "value",
    n = Object.getOwnPropertyDescriptor(e.constructor.prototype, t),
    r = "" + e[t];
  if (
    !e.hasOwnProperty(t) &&
    typeof n < "u" &&
    typeof n.get == "function" &&
    typeof n.set == "function"
  ) {
    var i = n.get,
      s = n.set;
    return (
      Object.defineProperty(e, t, {
        configurable: !0,
        get: function () {
          return i.call(this);
        },
        set: function (o) {
          (r = "" + o), s.call(this, o);
        },
      }),
      Object.defineProperty(e, t, { enumerable: n.enumerable }),
      {
        getValue: function () {
          return r;
        },
        setValue: function (o) {
          r = "" + o;
        },
        stopTracking: function () {
          (e._valueTracker = null), delete e[t];
        },
      }
    );
  }
}
function Ys(e) {
  e._valueTracker || (e._valueTracker = _v(e));
}
function Xh(e) {
  if (!e) return !1;
  var t = e._valueTracker;
  if (!t) return !0;
  var n = t.getValue(),
    r = "";
  return (
    e && (r = Yh(e) ? (e.checked ? "true" : "false") : e.value),
    (e = r),
    e !== n ? (t.setValue(e), !0) : !1
  );
}
function Do(e) {
  if (((e = e || (typeof document < "u" ? document : void 0)), typeof e > "u"))
    return null;
  try {
    return e.activeElement || e.body;
  } catch {
    return e.body;
  }
}
function Ka(e, t) {
  var n = t.checked;
  return ce({}, t, {
    defaultChecked: void 0,
    defaultValue: void 0,
    value: void 0,
    checked: n ?? e._wrapperState.initialChecked,
  });
}
function $d(e, t) {
  var n = t.defaultValue == null ? "" : t.defaultValue,
    r = t.checked != null ? t.checked : t.defaultChecked;
  (n = bn(t.value != null ? t.value : n)),
    (e._wrapperState = {
      initialChecked: r,
      initialValue: n,
      controlled:
        t.type === "checkbox" || t.type === "radio"
          ? t.checked != null
          : t.value != null,
    });
}
function Zh(e, t) {
  (t = t.checked), t != null && uc(e, "checked", t, !1);
}
function Ya(e, t) {
  Zh(e, t);
  var n = bn(t.value),
    r = t.type;
  if (n != null)
    r === "number"
      ? ((n === 0 && e.value === "") || e.value != n) && (e.value = "" + n)
      : e.value !== "" + n && (e.value = "" + n);
  else if (r === "submit" || r === "reset") {
    e.removeAttribute("value");
    return;
  }
  t.hasOwnProperty("value")
    ? Xa(e, t.type, n)
    : t.hasOwnProperty("defaultValue") && Xa(e, t.type, bn(t.defaultValue)),
    t.checked == null &&
      t.defaultChecked != null &&
      (e.defaultChecked = !!t.defaultChecked);
}
function Gd(e, t, n) {
  if (t.hasOwnProperty("value") || t.hasOwnProperty("defaultValue")) {
    var r = t.type;
    if (
      !(
        (r !== "submit" && r !== "reset") ||
        (t.value !== void 0 && t.value !== null)
      )
    )
      return;
    (t = "" + e._wrapperState.initialValue),
      n || t === e.value || (e.value = t),
      (e.defaultValue = t);
  }
  (n = e.name),
    n !== "" && (e.name = ""),
    (e.defaultChecked = !!e._wrapperState.initialChecked),
    n !== "" && (e.name = n);
}
function Xa(e, t, n) {
  (t !== "number" || Do(e.ownerDocument) !== e) &&
    (n == null
      ? (e.defaultValue = "" + e._wrapperState.initialValue)
      : e.defaultValue !== "" + n && (e.defaultValue = "" + n));
}
var Bi = Array.isArray;
function $r(e, t, n, r) {
  if (((e = e.options), t)) {
    t = {};
    for (var i = 0; i < n.length; i++) t["$" + n[i]] = !0;
    for (n = 0; n < e.length; n++)
      (i = t.hasOwnProperty("$" + e[n].value)),
        e[n].selected !== i && (e[n].selected = i),
        i && r && (e[n].defaultSelected = !0);
  } else {
    for (n = "" + bn(n), t = null, i = 0; i < e.length; i++) {
      if (e[i].value === n) {
        (e[i].selected = !0), r && (e[i].defaultSelected = !0);
        return;
      }
      t !== null || e[i].disabled || (t = e[i]);
    }
    t !== null && (t.selected = !0);
  }
}
function Za(e, t) {
  if (t.dangerouslySetInnerHTML != null) throw Error(b(91));
  return ce({}, t, {
    value: void 0,
    defaultValue: void 0,
    children: "" + e._wrapperState.initialValue,
  });
}
function Wd(e, t) {
  var n = t.value;
  if (n == null) {
    if (((n = t.children), (t = t.defaultValue), n != null)) {
      if (t != null) throw Error(b(92));
      if (Bi(n)) {
        if (1 < n.length) throw Error(b(93));
        n = n[0];
      }
      t = n;
    }
    t == null && (t = ""), (n = t);
  }
  e._wrapperState = { initialValue: bn(n) };
}
function Qh(e, t) {
  var n = bn(t.value),
    r = bn(t.defaultValue);
  n != null &&
    ((n = "" + n),
    n !== e.value && (e.value = n),
    t.defaultValue == null && e.defaultValue !== n && (e.defaultValue = n)),
    r != null && (e.defaultValue = "" + r);
}
function Ud(e) {
  var t = e.textContent;
  t === e._wrapperState.initialValue && t !== "" && t !== null && (e.value = t);
}
function qh(e) {
  switch (e) {
    case "svg":
      return "http://www.w3.org/2000/svg";
    case "math":
      return "http://www.w3.org/1998/Math/MathML";
    default:
      return "http://www.w3.org/1999/xhtml";
  }
}
function Qa(e, t) {
  return e == null || e === "http://www.w3.org/1999/xhtml"
    ? qh(t)
    : e === "http://www.w3.org/2000/svg" && t === "foreignObject"
    ? "http://www.w3.org/1999/xhtml"
    : e;
}
var Xs,
  Jh = (function (e) {
    return typeof MSApp < "u" && MSApp.execUnsafeLocalFunction
      ? function (t, n, r, i) {
          MSApp.execUnsafeLocalFunction(function () {
            return e(t, n, r, i);
          });
        }
      : e;
  })(function (e, t) {
    if (e.namespaceURI !== "http://www.w3.org/2000/svg" || "innerHTML" in e)
      e.innerHTML = t;
    else {
      for (
        Xs = Xs || document.createElement("div"),
          Xs.innerHTML = "<svg>" + t.valueOf().toString() + "</svg>",
          t = Xs.firstChild;
        e.firstChild;

      )
        e.removeChild(e.firstChild);
      for (; t.firstChild; ) e.appendChild(t.firstChild);
    }
  });
function ls(e, t) {
  if (t) {
    var n = e.firstChild;
    if (n && n === e.lastChild && n.nodeType === 3) {
      n.nodeValue = t;
      return;
    }
  }
  e.textContent = t;
}
var Ui = {
    animationIterationCount: !0,
    aspectRatio: !0,
    borderImageOutset: !0,
    borderImageSlice: !0,
    borderImageWidth: !0,
    boxFlex: !0,
    boxFlexGroup: !0,
    boxOrdinalGroup: !0,
    columnCount: !0,
    columns: !0,
    flex: !0,
    flexGrow: !0,
    flexPositive: !0,
    flexShrink: !0,
    flexNegative: !0,
    flexOrder: !0,
    gridArea: !0,
    gridRow: !0,
    gridRowEnd: !0,
    gridRowSpan: !0,
    gridRowStart: !0,
    gridColumn: !0,
    gridColumnEnd: !0,
    gridColumnSpan: !0,
    gridColumnStart: !0,
    fontWeight: !0,
    lineClamp: !0,
    lineHeight: !0,
    opacity: !0,
    order: !0,
    orphans: !0,
    tabSize: !0,
    widows: !0,
    zIndex: !0,
    zoom: !0,
    fillOpacity: !0,
    floodOpacity: !0,
    stopOpacity: !0,
    strokeDasharray: !0,
    strokeDashoffset: !0,
    strokeMiterlimit: !0,
    strokeOpacity: !0,
    strokeWidth: !0,
  },
  Cv = ["Webkit", "ms", "Moz", "O"];
Object.keys(Ui).forEach(function (e) {
  Cv.forEach(function (t) {
    (t = t + e.charAt(0).toUpperCase() + e.substring(1)), (Ui[t] = Ui[e]);
  });
});
function em(e, t, n) {
  return t == null || typeof t == "boolean" || t === ""
    ? ""
    : n || typeof t != "number" || t === 0 || (Ui.hasOwnProperty(e) && Ui[e])
    ? ("" + t).trim()
    : t + "px";
}
function tm(e, t) {
  e = e.style;
  for (var n in t)
    if (t.hasOwnProperty(n)) {
      var r = n.indexOf("--") === 0,
        i = em(n, t[n], r);
      n === "float" && (n = "cssFloat"), r ? e.setProperty(n, i) : (e[n] = i);
    }
}
var Tv = ce(
  { menuitem: !0 },
  {
    area: !0,
    base: !0,
    br: !0,
    col: !0,
    embed: !0,
    hr: !0,
    img: !0,
    input: !0,
    keygen: !0,
    link: !0,
    meta: !0,
    param: !0,
    source: !0,
    track: !0,
    wbr: !0,
  }
);
function qa(e, t) {
  if (t) {
    if (Tv[e] && (t.children != null || t.dangerouslySetInnerHTML != null))
      throw Error(b(137, e));
    if (t.dangerouslySetInnerHTML != null) {
      if (t.children != null) throw Error(b(60));
      if (
        typeof t.dangerouslySetInnerHTML != "object" ||
        !("__html" in t.dangerouslySetInnerHTML)
      )
        throw Error(b(61));
    }
    if (t.style != null && typeof t.style != "object") throw Error(b(62));
  }
}
function Ja(e, t) {
  if (e.indexOf("-") === -1) return typeof t.is == "string";
  switch (e) {
    case "annotation-xml":
    case "color-profile":
    case "font-face":
    case "font-face-src":
    case "font-face-uri":
    case "font-face-format":
    case "font-face-name":
    case "missing-glyph":
      return !1;
    default:
      return !0;
  }
}
var eu = null;
function pc(e) {
  return (
    (e = e.target || e.srcElement || window),
    e.correspondingUseElement && (e = e.correspondingUseElement),
    e.nodeType === 3 ? e.parentNode : e
  );
}
var tu = null,
  Gr = null,
  Wr = null;
function Kd(e) {
  if ((e = Ds(e))) {
    if (typeof tu != "function") throw Error(b(280));
    var t = e.stateNode;
    t && ((t = xl(t)), tu(e.stateNode, e.type, t));
  }
}
function nm(e) {
  Gr ? (Wr ? Wr.push(e) : (Wr = [e])) : (Gr = e);
}
function rm() {
  if (Gr) {
    var e = Gr,
      t = Wr;
    if (((Wr = Gr = null), Kd(e), t)) for (e = 0; e < t.length; e++) Kd(t[e]);
  }
}
function im(e, t) {
  return e(t);
}
function sm() {}
var Zl = !1;
function om(e, t, n) {
  if (Zl) return e(t, n);
  Zl = !0;
  try {
    return im(e, t, n);
  } finally {
    (Zl = !1), (Gr !== null || Wr !== null) && (sm(), rm());
  }
}
function as(e, t) {
  var n = e.stateNode;
  if (n === null) return null;
  var r = xl(n);
  if (r === null) return null;
  n = r[t];
  e: switch (t) {
    case "onClick":
    case "onClickCapture":
    case "onDoubleClick":
    case "onDoubleClickCapture":
    case "onMouseDown":
    case "onMouseDownCapture":
    case "onMouseMove":
    case "onMouseMoveCapture":
    case "onMouseUp":
    case "onMouseUpCapture":
    case "onMouseEnter":
      (r = !r.disabled) ||
        ((e = e.type),
        (r = !(
          e === "button" ||
          e === "input" ||
          e === "select" ||
          e === "textarea"
        ))),
        (e = !r);
      break e;
    default:
      e = !1;
  }
  if (e) return null;
  if (n && typeof n != "function") throw Error(b(231, t, typeof n));
  return n;
}
var nu = !1;
if (tn)
  try {
    var bi = {};
    Object.defineProperty(bi, "passive", {
      get: function () {
        nu = !0;
      },
    }),
      window.addEventListener("test", bi, bi),
      window.removeEventListener("test", bi, bi);
  } catch {
    nu = !1;
  }
function Ev(e, t, n, r, i, s, o, u, a) {
  var d = Array.prototype.slice.call(arguments, 3);
  try {
    t.apply(n, d);
  } catch (p) {
    this.onError(p);
  }
}
var Ki = !1,
  Ro = null,
  Vo = !1,
  ru = null,
  Pv = {
    onError: function (e) {
      (Ki = !0), (Ro = e);
    },
  };
function Av(e, t, n, r, i, s, o, u, a) {
  (Ki = !1), (Ro = null), Ev.apply(Pv, arguments);
}
function kv(e, t, n, r, i, s, o, u, a) {
  if ((Av.apply(this, arguments), Ki)) {
    if (Ki) {
      var d = Ro;
      (Ki = !1), (Ro = null);
    } else throw Error(b(198));
    Vo || ((Vo = !0), (ru = d));
  }
}
function mr(e) {
  var t = e,
    n = e;
  if (e.alternate) for (; t.return; ) t = t.return;
  else {
    e = t;
    do (t = e), t.flags & 4098 && (n = t.return), (e = t.return);
    while (e);
  }
  return t.tag === 3 ? n : null;
}
function lm(e) {
  if (e.tag === 13) {
    var t = e.memoizedState;
    if (
      (t === null && ((e = e.alternate), e !== null && (t = e.memoizedState)),
      t !== null)
    )
      return t.dehydrated;
  }
  return null;
}
function Yd(e) {
  if (mr(e) !== e) throw Error(b(188));
}
function Mv(e) {
  var t = e.alternate;
  if (!t) {
    if (((t = mr(e)), t === null)) throw Error(b(188));
    return t !== e ? null : e;
  }
  for (var n = e, r = t; ; ) {
    var i = n.return;
    if (i === null) break;
    var s = i.alternate;
    if (s === null) {
      if (((r = i.return), r !== null)) {
        n = r;
        continue;
      }
      break;
    }
    if (i.child === s.child) {
      for (s = i.child; s; ) {
        if (s === n) return Yd(i), e;
        if (s === r) return Yd(i), t;
        s = s.sibling;
      }
      throw Error(b(188));
    }
    if (n.return !== r.return) (n = i), (r = s);
    else {
      for (var o = !1, u = i.child; u; ) {
        if (u === n) {
          (o = !0), (n = i), (r = s);
          break;
        }
        if (u === r) {
          (o = !0), (r = i), (n = s);
          break;
        }
        u = u.sibling;
      }
      if (!o) {
        for (u = s.child; u; ) {
          if (u === n) {
            (o = !0), (n = s), (r = i);
            break;
          }
          if (u === r) {
            (o = !0), (r = s), (n = i);
            break;
          }
          u = u.sibling;
        }
        if (!o) throw Error(b(189));
      }
    }
    if (n.alternate !== r) throw Error(b(190));
  }
  if (n.tag !== 3) throw Error(b(188));
  return n.stateNode.current === n ? e : t;
}
function am(e) {
  return (e = Mv(e)), e !== null ? um(e) : null;
}
function um(e) {
  if (e.tag === 5 || e.tag === 6) return e;
  for (e = e.child; e !== null; ) {
    var t = um(e);
    if (t !== null) return t;
    e = e.sibling;
  }
  return null;
}
var cm = Je.unstable_scheduleCallback,
  Xd = Je.unstable_cancelCallback,
  bv = Je.unstable_shouldYield,
  Lv = Je.unstable_requestPaint,
  pe = Je.unstable_now,
  Ov = Je.unstable_getCurrentPriorityLevel,
  hc = Je.unstable_ImmediatePriority,
  dm = Je.unstable_UserBlockingPriority,
  Io = Je.unstable_NormalPriority,
  Dv = Je.unstable_LowPriority,
  fm = Je.unstable_IdlePriority,
  gl = null,
  Rt = null;
function Rv(e) {
  if (Rt && typeof Rt.onCommitFiberRoot == "function")
    try {
      Rt.onCommitFiberRoot(gl, e, void 0, (e.current.flags & 128) === 128);
    } catch {}
}
var Ct = Math.clz32 ? Math.clz32 : Nv,
  Vv = Math.log,
  Iv = Math.LN2;
function Nv(e) {
  return (e >>>= 0), e === 0 ? 32 : (31 - ((Vv(e) / Iv) | 0)) | 0;
}
var Zs = 64,
  Qs = 4194304;
function Hi(e) {
  switch (e & -e) {
    case 1:
      return 1;
    case 2:
      return 2;
    case 4:
      return 4;
    case 8:
      return 8;
    case 16:
      return 16;
    case 32:
      return 32;
    case 64:
    case 128:
    case 256:
    case 512:
    case 1024:
    case 2048:
    case 4096:
    case 8192:
    case 16384:
    case 32768:
    case 65536:
    case 131072:
    case 262144:
    case 524288:
    case 1048576:
    case 2097152:
      return e & 4194240;
    case 4194304:
    case 8388608:
    case 16777216:
    case 33554432:
    case 67108864:
      return e & 130023424;
    case 134217728:
      return 134217728;
    case 268435456:
      return 268435456;
    case 536870912:
      return 536870912;
    case 1073741824:
      return 1073741824;
    default:
      return e;
  }
}
function No(e, t) {
  var n = e.pendingLanes;
  if (n === 0) return 0;
  var r = 0,
    i = e.suspendedLanes,
    s = e.pingedLanes,
    o = n & 268435455;
  if (o !== 0) {
    var u = o & ~i;
    u !== 0 ? (r = Hi(u)) : ((s &= o), s !== 0 && (r = Hi(s)));
  } else (o = n & ~i), o !== 0 ? (r = Hi(o)) : s !== 0 && (r = Hi(s));
  if (r === 0) return 0;
  if (
    t !== 0 &&
    t !== r &&
    !(t & i) &&
    ((i = r & -r), (s = t & -t), i >= s || (i === 16 && (s & 4194240) !== 0))
  )
    return t;
  if ((r & 4 && (r |= n & 16), (t = e.entangledLanes), t !== 0))
    for (e = e.entanglements, t &= r; 0 < t; )
      (n = 31 - Ct(t)), (i = 1 << n), (r |= e[n]), (t &= ~i);
  return r;
}
function jv(e, t) {
  switch (e) {
    case 1:
    case 2:
    case 4:
      return t + 250;
    case 8:
    case 16:
    case 32:
    case 64:
    case 128:
    case 256:
    case 512:
    case 1024:
    case 2048:
    case 4096:
    case 8192:
    case 16384:
    case 32768:
    case 65536:
    case 131072:
    case 262144:
    case 524288:
    case 1048576:
    case 2097152:
      return t + 5e3;
    case 4194304:
    case 8388608:
    case 16777216:
    case 33554432:
    case 67108864:
      return -1;
    case 134217728:
    case 268435456:
    case 536870912:
    case 1073741824:
      return -1;
    default:
      return -1;
  }
}
function Fv(e, t) {
  for (
    var n = e.suspendedLanes,
      r = e.pingedLanes,
      i = e.expirationTimes,
      s = e.pendingLanes;
    0 < s;

  ) {
    var o = 31 - Ct(s),
      u = 1 << o,
      a = i[o];
    a === -1
      ? (!(u & n) || u & r) && (i[o] = jv(u, t))
      : a <= t && (e.expiredLanes |= u),
      (s &= ~u);
  }
}
function iu(e) {
  return (
    (e = e.pendingLanes & -1073741825),
    e !== 0 ? e : e & 1073741824 ? 1073741824 : 0
  );
}
function pm() {
  var e = Zs;
  return (Zs <<= 1), !(Zs & 4194240) && (Zs = 64), e;
}
function Ql(e) {
  for (var t = [], n = 0; 31 > n; n++) t.push(e);
  return t;
}
function Ls(e, t, n) {
  (e.pendingLanes |= t),
    t !== 536870912 && ((e.suspendedLanes = 0), (e.pingedLanes = 0)),
    (e = e.eventTimes),
    (t = 31 - Ct(t)),
    (e[t] = n);
}
function zv(e, t) {
  var n = e.pendingLanes & ~t;
  (e.pendingLanes = t),
    (e.suspendedLanes = 0),
    (e.pingedLanes = 0),
    (e.expiredLanes &= t),
    (e.mutableReadLanes &= t),
    (e.entangledLanes &= t),
    (t = e.entanglements);
  var r = e.eventTimes;
  for (e = e.expirationTimes; 0 < n; ) {
    var i = 31 - Ct(n),
      s = 1 << i;
    (t[i] = 0), (r[i] = -1), (e[i] = -1), (n &= ~s);
  }
}
function mc(e, t) {
  var n = (e.entangledLanes |= t);
  for (e = e.entanglements; n; ) {
    var r = 31 - Ct(n),
      i = 1 << r;
    (i & t) | (e[r] & t) && (e[r] |= t), (n &= ~i);
  }
}
var q = 0;
function hm(e) {
  return (e &= -e), 1 < e ? (4 < e ? (e & 268435455 ? 16 : 536870912) : 4) : 1;
}
var mm,
  gc,
  gm,
  vm,
  ym,
  su = !1,
  qs = [],
  _n = null,
  Cn = null,
  Tn = null,
  us = new Map(),
  cs = new Map(),
  vn = [],
  Bv =
    "mousedown mouseup touchcancel touchend touchstart auxclick dblclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset submit".split(
      " "
    );
function Zd(e, t) {
  switch (e) {
    case "focusin":
    case "focusout":
      _n = null;
      break;
    case "dragenter":
    case "dragleave":
      Cn = null;
      break;
    case "mouseover":
    case "mouseout":
      Tn = null;
      break;
    case "pointerover":
    case "pointerout":
      us.delete(t.pointerId);
      break;
    case "gotpointercapture":
    case "lostpointercapture":
      cs.delete(t.pointerId);
  }
}
function Li(e, t, n, r, i, s) {
  return e === null || e.nativeEvent !== s
    ? ((e = {
        blockedOn: t,
        domEventName: n,
        eventSystemFlags: r,
        nativeEvent: s,
        targetContainers: [i],
      }),
      t !== null && ((t = Ds(t)), t !== null && gc(t)),
      e)
    : ((e.eventSystemFlags |= r),
      (t = e.targetContainers),
      i !== null && t.indexOf(i) === -1 && t.push(i),
      e);
}
function Hv(e, t, n, r, i) {
  switch (t) {
    case "focusin":
      return (_n = Li(_n, e, t, n, r, i)), !0;
    case "dragenter":
      return (Cn = Li(Cn, e, t, n, r, i)), !0;
    case "mouseover":
      return (Tn = Li(Tn, e, t, n, r, i)), !0;
    case "pointerover":
      var s = i.pointerId;
      return us.set(s, Li(us.get(s) || null, e, t, n, r, i)), !0;
    case "gotpointercapture":
      return (
        (s = i.pointerId), cs.set(s, Li(cs.get(s) || null, e, t, n, r, i)), !0
      );
  }
  return !1;
}
function wm(e) {
  var t = Qn(e.target);
  if (t !== null) {
    var n = mr(t);
    if (n !== null) {
      if (((t = n.tag), t === 13)) {
        if (((t = lm(n)), t !== null)) {
          (e.blockedOn = t),
            ym(e.priority, function () {
              gm(n);
            });
          return;
        }
      } else if (t === 3 && n.stateNode.current.memoizedState.isDehydrated) {
        e.blockedOn = n.tag === 3 ? n.stateNode.containerInfo : null;
        return;
      }
    }
  }
  e.blockedOn = null;
}
function wo(e) {
  if (e.blockedOn !== null) return !1;
  for (var t = e.targetContainers; 0 < t.length; ) {
    var n = ou(e.domEventName, e.eventSystemFlags, t[0], e.nativeEvent);
    if (n === null) {
      n = e.nativeEvent;
      var r = new n.constructor(n.type, n);
      (eu = r), n.target.dispatchEvent(r), (eu = null);
    } else return (t = Ds(n)), t !== null && gc(t), (e.blockedOn = n), !1;
    t.shift();
  }
  return !0;
}
function Qd(e, t, n) {
  wo(e) && n.delete(t);
}
function $v() {
  (su = !1),
    _n !== null && wo(_n) && (_n = null),
    Cn !== null && wo(Cn) && (Cn = null),
    Tn !== null && wo(Tn) && (Tn = null),
    us.forEach(Qd),
    cs.forEach(Qd);
}
function Oi(e, t) {
  e.blockedOn === t &&
    ((e.blockedOn = null),
    su ||
      ((su = !0),
      Je.unstable_scheduleCallback(Je.unstable_NormalPriority, $v)));
}
function ds(e) {
  function t(i) {
    return Oi(i, e);
  }
  if (0 < qs.length) {
    Oi(qs[0], e);
    for (var n = 1; n < qs.length; n++) {
      var r = qs[n];
      r.blockedOn === e && (r.blockedOn = null);
    }
  }
  for (
    _n !== null && Oi(_n, e),
      Cn !== null && Oi(Cn, e),
      Tn !== null && Oi(Tn, e),
      us.forEach(t),
      cs.forEach(t),
      n = 0;
    n < vn.length;
    n++
  )
    (r = vn[n]), r.blockedOn === e && (r.blockedOn = null);
  for (; 0 < vn.length && ((n = vn[0]), n.blockedOn === null); )
    wm(n), n.blockedOn === null && vn.shift();
}
var Ur = ln.ReactCurrentBatchConfig,
  jo = !0;
function Gv(e, t, n, r) {
  var i = q,
    s = Ur.transition;
  Ur.transition = null;
  try {
    (q = 1), vc(e, t, n, r);
  } finally {
    (q = i), (Ur.transition = s);
  }
}
function Wv(e, t, n, r) {
  var i = q,
    s = Ur.transition;
  Ur.transition = null;
  try {
    (q = 4), vc(e, t, n, r);
  } finally {
    (q = i), (Ur.transition = s);
  }
}
function vc(e, t, n, r) {
  if (jo) {
    var i = ou(e, t, n, r);
    if (i === null) la(e, t, r, Fo, n), Zd(e, r);
    else if (Hv(i, e, t, n, r)) r.stopPropagation();
    else if ((Zd(e, r), t & 4 && -1 < Bv.indexOf(e))) {
      for (; i !== null; ) {
        var s = Ds(i);
        if (
          (s !== null && mm(s),
          (s = ou(e, t, n, r)),
          s === null && la(e, t, r, Fo, n),
          s === i)
        )
          break;
        i = s;
      }
      i !== null && r.stopPropagation();
    } else la(e, t, r, null, n);
  }
}
var Fo = null;
function ou(e, t, n, r) {
  if (((Fo = null), (e = pc(r)), (e = Qn(e)), e !== null))
    if (((t = mr(e)), t === null)) e = null;
    else if (((n = t.tag), n === 13)) {
      if (((e = lm(t)), e !== null)) return e;
      e = null;
    } else if (n === 3) {
      if (t.stateNode.current.memoizedState.isDehydrated)
        return t.tag === 3 ? t.stateNode.containerInfo : null;
      e = null;
    } else t !== e && (e = null);
  return (Fo = e), null;
}
function xm(e) {
  switch (e) {
    case "cancel":
    case "click":
    case "close":
    case "contextmenu":
    case "copy":
    case "cut":
    case "auxclick":
    case "dblclick":
    case "dragend":
    case "dragstart":
    case "drop":
    case "focusin":
    case "focusout":
    case "input":
    case "invalid":
    case "keydown":
    case "keypress":
    case "keyup":
    case "mousedown":
    case "mouseup":
    case "paste":
    case "pause":
    case "play":
    case "pointercancel":
    case "pointerdown":
    case "pointerup":
    case "ratechange":
    case "reset":
    case "resize":
    case "seeked":
    case "submit":
    case "touchcancel":
    case "touchend":
    case "touchstart":
    case "volumechange":
    case "change":
    case "selectionchange":
    case "textInput":
    case "compositionstart":
    case "compositionend":
    case "compositionupdate":
    case "beforeblur":
    case "afterblur":
    case "beforeinput":
    case "blur":
    case "fullscreenchange":
    case "focus":
    case "hashchange":
    case "popstate":
    case "select":
    case "selectstart":
      return 1;
    case "drag":
    case "dragenter":
    case "dragexit":
    case "dragleave":
    case "dragover":
    case "mousemove":
    case "mouseout":
    case "mouseover":
    case "pointermove":
    case "pointerout":
    case "pointerover":
    case "scroll":
    case "toggle":
    case "touchmove":
    case "wheel":
    case "mouseenter":
    case "mouseleave":
    case "pointerenter":
    case "pointerleave":
      return 4;
    case "message":
      switch (Ov()) {
        case hc:
          return 1;
        case dm:
          return 4;
        case Io:
        case Dv:
          return 16;
        case fm:
          return 536870912;
        default:
          return 16;
      }
    default:
      return 16;
  }
}
var wn = null,
  yc = null,
  xo = null;
function Sm() {
  if (xo) return xo;
  var e,
    t = yc,
    n = t.length,
    r,
    i = "value" in wn ? wn.value : wn.textContent,
    s = i.length;
  for (e = 0; e < n && t[e] === i[e]; e++);
  var o = n - e;
  for (r = 1; r <= o && t[n - r] === i[s - r]; r++);
  return (xo = i.slice(e, 1 < r ? 1 - r : void 0));
}
function So(e) {
  var t = e.keyCode;
  return (
    "charCode" in e
      ? ((e = e.charCode), e === 0 && t === 13 && (e = 13))
      : (e = t),
    e === 10 && (e = 13),
    32 <= e || e === 13 ? e : 0
  );
}
function Js() {
  return !0;
}
function qd() {
  return !1;
}
function nt(e) {
  function t(n, r, i, s, o) {
    (this._reactName = n),
      (this._targetInst = i),
      (this.type = r),
      (this.nativeEvent = s),
      (this.target = o),
      (this.currentTarget = null);
    for (var u in e)
      e.hasOwnProperty(u) && ((n = e[u]), (this[u] = n ? n(s) : s[u]));
    return (
      (this.isDefaultPrevented = (
        s.defaultPrevented != null ? s.defaultPrevented : s.returnValue === !1
      )
        ? Js
        : qd),
      (this.isPropagationStopped = qd),
      this
    );
  }
  return (
    ce(t.prototype, {
      preventDefault: function () {
        this.defaultPrevented = !0;
        var n = this.nativeEvent;
        n &&
          (n.preventDefault
            ? n.preventDefault()
            : typeof n.returnValue != "unknown" && (n.returnValue = !1),
          (this.isDefaultPrevented = Js));
      },
      stopPropagation: function () {
        var n = this.nativeEvent;
        n &&
          (n.stopPropagation
            ? n.stopPropagation()
            : typeof n.cancelBubble != "unknown" && (n.cancelBubble = !0),
          (this.isPropagationStopped = Js));
      },
      persist: function () {},
      isPersistent: Js,
    }),
    t
  );
}
var di = {
    eventPhase: 0,
    bubbles: 0,
    cancelable: 0,
    timeStamp: function (e) {
      return e.timeStamp || Date.now();
    },
    defaultPrevented: 0,
    isTrusted: 0,
  },
  wc = nt(di),
  Os = ce({}, di, { view: 0, detail: 0 }),
  Uv = nt(Os),
  ql,
  Jl,
  Di,
  vl = ce({}, Os, {
    screenX: 0,
    screenY: 0,
    clientX: 0,
    clientY: 0,
    pageX: 0,
    pageY: 0,
    ctrlKey: 0,
    shiftKey: 0,
    altKey: 0,
    metaKey: 0,
    getModifierState: xc,
    button: 0,
    buttons: 0,
    relatedTarget: function (e) {
      return e.relatedTarget === void 0
        ? e.fromElement === e.srcElement
          ? e.toElement
          : e.fromElement
        : e.relatedTarget;
    },
    movementX: function (e) {
      return "movementX" in e
        ? e.movementX
        : (e !== Di &&
            (Di && e.type === "mousemove"
              ? ((ql = e.screenX - Di.screenX), (Jl = e.screenY - Di.screenY))
              : (Jl = ql = 0),
            (Di = e)),
          ql);
    },
    movementY: function (e) {
      return "movementY" in e ? e.movementY : Jl;
    },
  }),
  Jd = nt(vl),
  Kv = ce({}, vl, { dataTransfer: 0 }),
  Yv = nt(Kv),
  Xv = ce({}, Os, { relatedTarget: 0 }),
  ea = nt(Xv),
  Zv = ce({}, di, { animationName: 0, elapsedTime: 0, pseudoElement: 0 }),
  Qv = nt(Zv),
  qv = ce({}, di, {
    clipboardData: function (e) {
      return "clipboardData" in e ? e.clipboardData : window.clipboardData;
    },
  }),
  Jv = nt(qv),
  ey = ce({}, di, { data: 0 }),
  ef = nt(ey),
  ty = {
    Esc: "Escape",
    Spacebar: " ",
    Left: "ArrowLeft",
    Up: "ArrowUp",
    Right: "ArrowRight",
    Down: "ArrowDown",
    Del: "Delete",
    Win: "OS",
    Menu: "ContextMenu",
    Apps: "ContextMenu",
    Scroll: "ScrollLock",
    MozPrintableKey: "Unidentified",
  },
  ny = {
    8: "Backspace",
    9: "Tab",
    12: "Clear",
    13: "Enter",
    16: "Shift",
    17: "Control",
    18: "Alt",
    19: "Pause",
    20: "CapsLock",
    27: "Escape",
    32: " ",
    33: "PageUp",
    34: "PageDown",
    35: "End",
    36: "Home",
    37: "ArrowLeft",
    38: "ArrowUp",
    39: "ArrowRight",
    40: "ArrowDown",
    45: "Insert",
    46: "Delete",
    112: "F1",
    113: "F2",
    114: "F3",
    115: "F4",
    116: "F5",
    117: "F6",
    118: "F7",
    119: "F8",
    120: "F9",
    121: "F10",
    122: "F11",
    123: "F12",
    144: "NumLock",
    145: "ScrollLock",
    224: "Meta",
  },
  ry = {
    Alt: "altKey",
    Control: "ctrlKey",
    Meta: "metaKey",
    Shift: "shiftKey",
  };
function iy(e) {
  var t = this.nativeEvent;
  return t.getModifierState ? t.getModifierState(e) : (e = ry[e]) ? !!t[e] : !1;
}
function xc() {
  return iy;
}
var sy = ce({}, Os, {
    key: function (e) {
      if (e.key) {
        var t = ty[e.key] || e.key;
        if (t !== "Unidentified") return t;
      }
      return e.type === "keypress"
        ? ((e = So(e)), e === 13 ? "Enter" : String.fromCharCode(e))
        : e.type === "keydown" || e.type === "keyup"
        ? ny[e.keyCode] || "Unidentified"
        : "";
    },
    code: 0,
    location: 0,
    ctrlKey: 0,
    shiftKey: 0,
    altKey: 0,
    metaKey: 0,
    repeat: 0,
    locale: 0,
    getModifierState: xc,
    charCode: function (e) {
      return e.type === "keypress" ? So(e) : 0;
    },
    keyCode: function (e) {
      return e.type === "keydown" || e.type === "keyup" ? e.keyCode : 0;
    },
    which: function (e) {
      return e.type === "keypress"
        ? So(e)
        : e.type === "keydown" || e.type === "keyup"
        ? e.keyCode
        : 0;
    },
  }),
  oy = nt(sy),
  ly = ce({}, vl, {
    pointerId: 0,
    width: 0,
    height: 0,
    pressure: 0,
    tangentialPressure: 0,
    tiltX: 0,
    tiltY: 0,
    twist: 0,
    pointerType: 0,
    isPrimary: 0,
  }),
  tf = nt(ly),
  ay = ce({}, Os, {
    touches: 0,
    targetTouches: 0,
    changedTouches: 0,
    altKey: 0,
    metaKey: 0,
    ctrlKey: 0,
    shiftKey: 0,
    getModifierState: xc,
  }),
  uy = nt(ay),
  cy = ce({}, di, { propertyName: 0, elapsedTime: 0, pseudoElement: 0 }),
  dy = nt(cy),
  fy = ce({}, vl, {
    deltaX: function (e) {
      return "deltaX" in e ? e.deltaX : "wheelDeltaX" in e ? -e.wheelDeltaX : 0;
    },
    deltaY: function (e) {
      return "deltaY" in e
        ? e.deltaY
        : "wheelDeltaY" in e
        ? -e.wheelDeltaY
        : "wheelDelta" in e
        ? -e.wheelDelta
        : 0;
    },
    deltaZ: 0,
    deltaMode: 0,
  }),
  py = nt(fy),
  hy = [9, 13, 27, 32],
  Sc = tn && "CompositionEvent" in window,
  Yi = null;
tn && "documentMode" in document && (Yi = document.documentMode);
var my = tn && "TextEvent" in window && !Yi,
  _m = tn && (!Sc || (Yi && 8 < Yi && 11 >= Yi)),
  nf = String.fromCharCode(32),
  rf = !1;
function Cm(e, t) {
  switch (e) {
    case "keyup":
      return hy.indexOf(t.keyCode) !== -1;
    case "keydown":
      return t.keyCode !== 229;
    case "keypress":
    case "mousedown":
    case "focusout":
      return !0;
    default:
      return !1;
  }
}
function Tm(e) {
  return (e = e.detail), typeof e == "object" && "data" in e ? e.data : null;
}
var kr = !1;
function gy(e, t) {
  switch (e) {
    case "compositionend":
      return Tm(t);
    case "keypress":
      return t.which !== 32 ? null : ((rf = !0), nf);
    case "textInput":
      return (e = t.data), e === nf && rf ? null : e;
    default:
      return null;
  }
}
function vy(e, t) {
  if (kr)
    return e === "compositionend" || (!Sc && Cm(e, t))
      ? ((e = Sm()), (xo = yc = wn = null), (kr = !1), e)
      : null;
  switch (e) {
    case "paste":
      return null;
    case "keypress":
      if (!(t.ctrlKey || t.altKey || t.metaKey) || (t.ctrlKey && t.altKey)) {
        if (t.char && 1 < t.char.length) return t.char;
        if (t.which) return String.fromCharCode(t.which);
      }
      return null;
    case "compositionend":
      return _m && t.locale !== "ko" ? null : t.data;
    default:
      return null;
  }
}
var yy = {
  color: !0,
  date: !0,
  datetime: !0,
  "datetime-local": !0,
  email: !0,
  month: !0,
  number: !0,
  password: !0,
  range: !0,
  search: !0,
  tel: !0,
  text: !0,
  time: !0,
  url: !0,
  week: !0,
};
function sf(e) {
  var t = e && e.nodeName && e.nodeName.toLowerCase();
  return t === "input" ? !!yy[e.type] : t === "textarea";
}
function Em(e, t, n, r) {
  nm(r),
    (t = zo(t, "onChange")),
    0 < t.length &&
      ((n = new wc("onChange", "change", null, n, r)),
      e.push({ event: n, listeners: t }));
}
var Xi = null,
  fs = null;
function wy(e) {
  Im(e, 0);
}
function yl(e) {
  var t = Lr(e);
  if (Xh(t)) return e;
}
function xy(e, t) {
  if (e === "change") return t;
}
var Pm = !1;
if (tn) {
  var ta;
  if (tn) {
    var na = "oninput" in document;
    if (!na) {
      var of = document.createElement("div");
      of.setAttribute("oninput", "return;"),
        (na = typeof of.oninput == "function");
    }
    ta = na;
  } else ta = !1;
  Pm = ta && (!document.documentMode || 9 < document.documentMode);
}
function lf() {
  Xi && (Xi.detachEvent("onpropertychange", Am), (fs = Xi = null));
}
function Am(e) {
  if (e.propertyName === "value" && yl(fs)) {
    var t = [];
    Em(t, fs, e, pc(e)), om(wy, t);
  }
}
function Sy(e, t, n) {
  e === "focusin"
    ? (lf(), (Xi = t), (fs = n), Xi.attachEvent("onpropertychange", Am))
    : e === "focusout" && lf();
}
function _y(e) {
  if (e === "selectionchange" || e === "keyup" || e === "keydown")
    return yl(fs);
}
function Cy(e, t) {
  if (e === "click") return yl(t);
}
function Ty(e, t) {
  if (e === "input" || e === "change") return yl(t);
}
function Ey(e, t) {
  return (e === t && (e !== 0 || 1 / e === 1 / t)) || (e !== e && t !== t);
}
var Et = typeof Object.is == "function" ? Object.is : Ey;
function ps(e, t) {
  if (Et(e, t)) return !0;
  if (typeof e != "object" || e === null || typeof t != "object" || t === null)
    return !1;
  var n = Object.keys(e),
    r = Object.keys(t);
  if (n.length !== r.length) return !1;
  for (r = 0; r < n.length; r++) {
    var i = n[r];
    if (!Ha.call(t, i) || !Et(e[i], t[i])) return !1;
  }
  return !0;
}
function af(e) {
  for (; e && e.firstChild; ) e = e.firstChild;
  return e;
}
function uf(e, t) {
  var n = af(e);
  e = 0;
  for (var r; n; ) {
    if (n.nodeType === 3) {
      if (((r = e + n.textContent.length), e <= t && r >= t))
        return { node: n, offset: t - e };
      e = r;
    }
    e: {
      for (; n; ) {
        if (n.nextSibling) {
          n = n.nextSibling;
          break e;
        }
        n = n.parentNode;
      }
      n = void 0;
    }
    n = af(n);
  }
}
function km(e, t) {
  return e && t
    ? e === t
      ? !0
      : e && e.nodeType === 3
      ? !1
      : t && t.nodeType === 3
      ? km(e, t.parentNode)
      : "contains" in e
      ? e.contains(t)
      : e.compareDocumentPosition
      ? !!(e.compareDocumentPosition(t) & 16)
      : !1
    : !1;
}
function Mm() {
  for (var e = window, t = Do(); t instanceof e.HTMLIFrameElement; ) {
    try {
      var n = typeof t.contentWindow.location.href == "string";
    } catch {
      n = !1;
    }
    if (n) e = t.contentWindow;
    else break;
    t = Do(e.document);
  }
  return t;
}
function _c(e) {
  var t = e && e.nodeName && e.nodeName.toLowerCase();
  return (
    t &&
    ((t === "input" &&
      (e.type === "text" ||
        e.type === "search" ||
        e.type === "tel" ||
        e.type === "url" ||
        e.type === "password")) ||
      t === "textarea" ||
      e.contentEditable === "true")
  );
}
function Py(e) {
  var t = Mm(),
    n = e.focusedElem,
    r = e.selectionRange;
  if (
    t !== n &&
    n &&
    n.ownerDocument &&
    km(n.ownerDocument.documentElement, n)
  ) {
    if (r !== null && _c(n)) {
      if (
        ((t = r.start),
        (e = r.end),
        e === void 0 && (e = t),
        "selectionStart" in n)
      )
        (n.selectionStart = t), (n.selectionEnd = Math.min(e, n.value.length));
      else if (
        ((e = ((t = n.ownerDocument || document) && t.defaultView) || window),
        e.getSelection)
      ) {
        e = e.getSelection();
        var i = n.textContent.length,
          s = Math.min(r.start, i);
        (r = r.end === void 0 ? s : Math.min(r.end, i)),
          !e.extend && s > r && ((i = r), (r = s), (s = i)),
          (i = uf(n, s));
        var o = uf(n, r);
        i &&
          o &&
          (e.rangeCount !== 1 ||
            e.anchorNode !== i.node ||
            e.anchorOffset !== i.offset ||
            e.focusNode !== o.node ||
            e.focusOffset !== o.offset) &&
          ((t = t.createRange()),
          t.setStart(i.node, i.offset),
          e.removeAllRanges(),
          s > r
            ? (e.addRange(t), e.extend(o.node, o.offset))
            : (t.setEnd(o.node, o.offset), e.addRange(t)));
      }
    }
    for (t = [], e = n; (e = e.parentNode); )
      e.nodeType === 1 &&
        t.push({ element: e, left: e.scrollLeft, top: e.scrollTop });
    for (typeof n.focus == "function" && n.focus(), n = 0; n < t.length; n++)
      (e = t[n]),
        (e.element.scrollLeft = e.left),
        (e.element.scrollTop = e.top);
  }
}
var Ay = tn && "documentMode" in document && 11 >= document.documentMode,
  Mr = null,
  lu = null,
  Zi = null,
  au = !1;
function cf(e, t, n) {
  var r = n.window === n ? n.document : n.nodeType === 9 ? n : n.ownerDocument;
  au ||
    Mr == null ||
    Mr !== Do(r) ||
    ((r = Mr),
    "selectionStart" in r && _c(r)
      ? (r = { start: r.selectionStart, end: r.selectionEnd })
      : ((r = (
          (r.ownerDocument && r.ownerDocument.defaultView) ||
          window
        ).getSelection()),
        (r = {
          anchorNode: r.anchorNode,
          anchorOffset: r.anchorOffset,
          focusNode: r.focusNode,
          focusOffset: r.focusOffset,
        })),
    (Zi && ps(Zi, r)) ||
      ((Zi = r),
      (r = zo(lu, "onSelect")),
      0 < r.length &&
        ((t = new wc("onSelect", "select", null, t, n)),
        e.push({ event: t, listeners: r }),
        (t.target = Mr))));
}
function eo(e, t) {
  var n = {};
  return (
    (n[e.toLowerCase()] = t.toLowerCase()),
    (n["Webkit" + e] = "webkit" + t),
    (n["Moz" + e] = "moz" + t),
    n
  );
}
var br = {
    animationend: eo("Animation", "AnimationEnd"),
    animationiteration: eo("Animation", "AnimationIteration"),
    animationstart: eo("Animation", "AnimationStart"),
    transitionend: eo("Transition", "TransitionEnd"),
  },
  ra = {},
  bm = {};
tn &&
  ((bm = document.createElement("div").style),
  "AnimationEvent" in window ||
    (delete br.animationend.animation,
    delete br.animationiteration.animation,
    delete br.animationstart.animation),
  "TransitionEvent" in window || delete br.transitionend.transition);
function wl(e) {
  if (ra[e]) return ra[e];
  if (!br[e]) return e;
  var t = br[e],
    n;
  for (n in t) if (t.hasOwnProperty(n) && n in bm) return (ra[e] = t[n]);
  return e;
}
var Lm = wl("animationend"),
  Om = wl("animationiteration"),
  Dm = wl("animationstart"),
  Rm = wl("transitionend"),
  Vm = new Map(),
  df =
    "abort auxClick cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(
      " "
    );
function In(e, t) {
  Vm.set(e, t), hr(t, [e]);
}
for (var ia = 0; ia < df.length; ia++) {
  var sa = df[ia],
    ky = sa.toLowerCase(),
    My = sa[0].toUpperCase() + sa.slice(1);
  In(ky, "on" + My);
}
In(Lm, "onAnimationEnd");
In(Om, "onAnimationIteration");
In(Dm, "onAnimationStart");
In("dblclick", "onDoubleClick");
In("focusin", "onFocus");
In("focusout", "onBlur");
In(Rm, "onTransitionEnd");
Qr("onMouseEnter", ["mouseout", "mouseover"]);
Qr("onMouseLeave", ["mouseout", "mouseover"]);
Qr("onPointerEnter", ["pointerout", "pointerover"]);
Qr("onPointerLeave", ["pointerout", "pointerover"]);
hr(
  "onChange",
  "change click focusin focusout input keydown keyup selectionchange".split(" ")
);
hr(
  "onSelect",
  "focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(
    " "
  )
);
hr("onBeforeInput", ["compositionend", "keypress", "textInput", "paste"]);
hr(
  "onCompositionEnd",
  "compositionend focusout keydown keypress keyup mousedown".split(" ")
);
hr(
  "onCompositionStart",
  "compositionstart focusout keydown keypress keyup mousedown".split(" ")
);
hr(
  "onCompositionUpdate",
  "compositionupdate focusout keydown keypress keyup mousedown".split(" ")
);
var $i =
    "abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(
      " "
    ),
  by = new Set("cancel close invalid load scroll toggle".split(" ").concat($i));
function ff(e, t, n) {
  var r = e.type || "unknown-event";
  (e.currentTarget = n), kv(r, t, void 0, e), (e.currentTarget = null);
}
function Im(e, t) {
  t = (t & 4) !== 0;
  for (var n = 0; n < e.length; n++) {
    var r = e[n],
      i = r.event;
    r = r.listeners;
    e: {
      var s = void 0;
      if (t)
        for (var o = r.length - 1; 0 <= o; o--) {
          var u = r[o],
            a = u.instance,
            d = u.currentTarget;
          if (((u = u.listener), a !== s && i.isPropagationStopped())) break e;
          ff(i, u, d), (s = a);
        }
      else
        for (o = 0; o < r.length; o++) {
          if (
            ((u = r[o]),
            (a = u.instance),
            (d = u.currentTarget),
            (u = u.listener),
            a !== s && i.isPropagationStopped())
          )
            break e;
          ff(i, u, d), (s = a);
        }
    }
  }
  if (Vo) throw ((e = ru), (Vo = !1), (ru = null), e);
}
function ne(e, t) {
  var n = t[pu];
  n === void 0 && (n = t[pu] = new Set());
  var r = e + "__bubble";
  n.has(r) || (Nm(t, e, 2, !1), n.add(r));
}
function oa(e, t, n) {
  var r = 0;
  t && (r |= 4), Nm(n, e, r, t);
}
var to = "_reactListening" + Math.random().toString(36).slice(2);
function hs(e) {
  if (!e[to]) {
    (e[to] = !0),
      Gh.forEach(function (n) {
        n !== "selectionchange" && (by.has(n) || oa(n, !1, e), oa(n, !0, e));
      });
    var t = e.nodeType === 9 ? e : e.ownerDocument;
    t === null || t[to] || ((t[to] = !0), oa("selectionchange", !1, t));
  }
}
function Nm(e, t, n, r) {
  switch (xm(t)) {
    case 1:
      var i = Gv;
      break;
    case 4:
      i = Wv;
      break;
    default:
      i = vc;
  }
  (n = i.bind(null, t, n, e)),
    (i = void 0),
    !nu ||
      (t !== "touchstart" && t !== "touchmove" && t !== "wheel") ||
      (i = !0),
    r
      ? i !== void 0
        ? e.addEventListener(t, n, { capture: !0, passive: i })
        : e.addEventListener(t, n, !0)
      : i !== void 0
      ? e.addEventListener(t, n, { passive: i })
      : e.addEventListener(t, n, !1);
}
function la(e, t, n, r, i) {
  var s = r;
  if (!(t & 1) && !(t & 2) && r !== null)
    e: for (;;) {
      if (r === null) return;
      var o = r.tag;
      if (o === 3 || o === 4) {
        var u = r.stateNode.containerInfo;
        if (u === i || (u.nodeType === 8 && u.parentNode === i)) break;
        if (o === 4)
          for (o = r.return; o !== null; ) {
            var a = o.tag;
            if (
              (a === 3 || a === 4) &&
              ((a = o.stateNode.containerInfo),
              a === i || (a.nodeType === 8 && a.parentNode === i))
            )
              return;
            o = o.return;
          }
        for (; u !== null; ) {
          if (((o = Qn(u)), o === null)) return;
          if (((a = o.tag), a === 5 || a === 6)) {
            r = s = o;
            continue e;
          }
          u = u.parentNode;
        }
      }
      r = r.return;
    }
  om(function () {
    var d = s,
      p = pc(n),
      l = [];
    e: {
      var c = Vm.get(e);
      if (c !== void 0) {
        var f = wc,
          m = e;
        switch (e) {
          case "keypress":
            if (So(n) === 0) break e;
          case "keydown":
          case "keyup":
            f = oy;
            break;
          case "focusin":
            (m = "focus"), (f = ea);
            break;
          case "focusout":
            (m = "blur"), (f = ea);
            break;
          case "beforeblur":
          case "afterblur":
            f = ea;
            break;
          case "click":
            if (n.button === 2) break e;
          case "auxclick":
          case "dblclick":
          case "mousedown":
          case "mousemove":
          case "mouseup":
          case "mouseout":
          case "mouseover":
          case "contextmenu":
            f = Jd;
            break;
          case "drag":
          case "dragend":
          case "dragenter":
          case "dragexit":
          case "dragleave":
          case "dragover":
          case "dragstart":
          case "drop":
            f = Yv;
            break;
          case "touchcancel":
          case "touchend":
          case "touchmove":
          case "touchstart":
            f = uy;
            break;
          case Lm:
          case Om:
          case Dm:
            f = Qv;
            break;
          case Rm:
            f = dy;
            break;
          case "scroll":
            f = Uv;
            break;
          case "wheel":
            f = py;
            break;
          case "copy":
          case "cut":
          case "paste":
            f = Jv;
            break;
          case "gotpointercapture":
          case "lostpointercapture":
          case "pointercancel":
          case "pointerdown":
          case "pointermove":
          case "pointerout":
          case "pointerover":
          case "pointerup":
            f = tf;
        }
        var v = (t & 4) !== 0,
          w = !v && e === "scroll",
          h = v ? (c !== null ? c + "Capture" : null) : c;
        v = [];
        for (var g = d, y; g !== null; ) {
          y = g;
          var x = y.stateNode;
          if (
            (y.tag === 5 &&
              x !== null &&
              ((y = x),
              h !== null && ((x = as(g, h)), x != null && v.push(ms(g, x, y)))),
            w)
          )
            break;
          g = g.return;
        }
        0 < v.length &&
          ((c = new f(c, m, null, n, p)), l.push({ event: c, listeners: v }));
      }
    }
    if (!(t & 7)) {
      e: {
        if (
          ((c = e === "mouseover" || e === "pointerover"),
          (f = e === "mouseout" || e === "pointerout"),
          c &&
            n !== eu &&
            (m = n.relatedTarget || n.fromElement) &&
            (Qn(m) || m[nn]))
        )
          break e;
        if (
          (f || c) &&
          ((c =
            p.window === p
              ? p
              : (c = p.ownerDocument)
              ? c.defaultView || c.parentWindow
              : window),
          f
            ? ((m = n.relatedTarget || n.toElement),
              (f = d),
              (m = m ? Qn(m) : null),
              m !== null &&
                ((w = mr(m)), m !== w || (m.tag !== 5 && m.tag !== 6)) &&
                (m = null))
            : ((f = null), (m = d)),
          f !== m)
        ) {
          if (
            ((v = Jd),
            (x = "onMouseLeave"),
            (h = "onMouseEnter"),
            (g = "mouse"),
            (e === "pointerout" || e === "pointerover") &&
              ((v = tf),
              (x = "onPointerLeave"),
              (h = "onPointerEnter"),
              (g = "pointer")),
            (w = f == null ? c : Lr(f)),
            (y = m == null ? c : Lr(m)),
            (c = new v(x, g + "leave", f, n, p)),
            (c.target = w),
            (c.relatedTarget = y),
            (x = null),
            Qn(p) === d &&
              ((v = new v(h, g + "enter", m, n, p)),
              (v.target = y),
              (v.relatedTarget = w),
              (x = v)),
            (w = x),
            f && m)
          )
            t: {
              for (v = f, h = m, g = 0, y = v; y; y = Tr(y)) g++;
              for (y = 0, x = h; x; x = Tr(x)) y++;
              for (; 0 < g - y; ) (v = Tr(v)), g--;
              for (; 0 < y - g; ) (h = Tr(h)), y--;
              for (; g--; ) {
                if (v === h || (h !== null && v === h.alternate)) break t;
                (v = Tr(v)), (h = Tr(h));
              }
              v = null;
            }
          else v = null;
          f !== null && pf(l, c, f, v, !1),
            m !== null && w !== null && pf(l, w, m, v, !0);
        }
      }
      e: {
        if (
          ((c = d ? Lr(d) : window),
          (f = c.nodeName && c.nodeName.toLowerCase()),
          f === "select" || (f === "input" && c.type === "file"))
        )
          var S = xy;
        else if (sf(c))
          if (Pm) S = Ty;
          else {
            S = _y;
            var T = Sy;
          }
        else
          (f = c.nodeName) &&
            f.toLowerCase() === "input" &&
            (c.type === "checkbox" || c.type === "radio") &&
            (S = Cy);
        if (S && (S = S(e, d))) {
          Em(l, S, n, p);
          break e;
        }
        T && T(e, c, d),
          e === "focusout" &&
            (T = c._wrapperState) &&
            T.controlled &&
            c.type === "number" &&
            Xa(c, "number", c.value);
      }
      switch (((T = d ? Lr(d) : window), e)) {
        case "focusin":
          (sf(T) || T.contentEditable === "true") &&
            ((Mr = T), (lu = d), (Zi = null));
          break;
        case "focusout":
          Zi = lu = Mr = null;
          break;
        case "mousedown":
          au = !0;
          break;
        case "contextmenu":
        case "mouseup":
        case "dragend":
          (au = !1), cf(l, n, p);
          break;
        case "selectionchange":
          if (Ay) break;
        case "keydown":
        case "keyup":
          cf(l, n, p);
      }
      var M;
      if (Sc)
        e: {
          switch (e) {
            case "compositionstart":
              var E = "onCompositionStart";
              break e;
            case "compositionend":
              E = "onCompositionEnd";
              break e;
            case "compositionupdate":
              E = "onCompositionUpdate";
              break e;
          }
          E = void 0;
        }
      else
        kr
          ? Cm(e, n) && (E = "onCompositionEnd")
          : e === "keydown" && n.keyCode === 229 && (E = "onCompositionStart");
      E &&
        (_m &&
          n.locale !== "ko" &&
          (kr || E !== "onCompositionStart"
            ? E === "onCompositionEnd" && kr && (M = Sm())
            : ((wn = p),
              (yc = "value" in wn ? wn.value : wn.textContent),
              (kr = !0))),
        (T = zo(d, E)),
        0 < T.length &&
          ((E = new ef(E, e, null, n, p)),
          l.push({ event: E, listeners: T }),
          M ? (E.data = M) : ((M = Tm(n)), M !== null && (E.data = M)))),
        (M = my ? gy(e, n) : vy(e, n)) &&
          ((d = zo(d, "onBeforeInput")),
          0 < d.length &&
            ((p = new ef("onBeforeInput", "beforeinput", null, n, p)),
            l.push({ event: p, listeners: d }),
            (p.data = M)));
    }
    Im(l, t);
  });
}
function ms(e, t, n) {
  return { instance: e, listener: t, currentTarget: n };
}
function zo(e, t) {
  for (var n = t + "Capture", r = []; e !== null; ) {
    var i = e,
      s = i.stateNode;
    i.tag === 5 &&
      s !== null &&
      ((i = s),
      (s = as(e, n)),
      s != null && r.unshift(ms(e, s, i)),
      (s = as(e, t)),
      s != null && r.push(ms(e, s, i))),
      (e = e.return);
  }
  return r;
}
function Tr(e) {
  if (e === null) return null;
  do e = e.return;
  while (e && e.tag !== 5);
  return e || null;
}
function pf(e, t, n, r, i) {
  for (var s = t._reactName, o = []; n !== null && n !== r; ) {
    var u = n,
      a = u.alternate,
      d = u.stateNode;
    if (a !== null && a === r) break;
    u.tag === 5 &&
      d !== null &&
      ((u = d),
      i
        ? ((a = as(n, s)), a != null && o.unshift(ms(n, a, u)))
        : i || ((a = as(n, s)), a != null && o.push(ms(n, a, u)))),
      (n = n.return);
  }
  o.length !== 0 && e.push({ event: t, listeners: o });
}
var Ly = /\r\n?/g,
  Oy = /\u0000|\uFFFD/g;
function hf(e) {
  return (typeof e == "string" ? e : "" + e)
    .replace(
      Ly,
      `
`
    )
    .replace(Oy, "");
}
function no(e, t, n) {
  if (((t = hf(t)), hf(e) !== t && n)) throw Error(b(425));
}
function Bo() {}
var uu = null,
  cu = null;
function du(e, t) {
  return (
    e === "textarea" ||
    e === "noscript" ||
    typeof t.children == "string" ||
    typeof t.children == "number" ||
    (typeof t.dangerouslySetInnerHTML == "object" &&
      t.dangerouslySetInnerHTML !== null &&
      t.dangerouslySetInnerHTML.__html != null)
  );
}
var fu = typeof setTimeout == "function" ? setTimeout : void 0,
  Dy = typeof clearTimeout == "function" ? clearTimeout : void 0,
  mf = typeof Promise == "function" ? Promise : void 0,
  Ry =
    typeof queueMicrotask == "function"
      ? queueMicrotask
      : typeof mf < "u"
      ? function (e) {
          return mf.resolve(null).then(e).catch(Vy);
        }
      : fu;
function Vy(e) {
  setTimeout(function () {
    throw e;
  });
}
function aa(e, t) {
  var n = t,
    r = 0;
  do {
    var i = n.nextSibling;
    if ((e.removeChild(n), i && i.nodeType === 8))
      if (((n = i.data), n === "/$")) {
        if (r === 0) {
          e.removeChild(i), ds(t);
          return;
        }
        r--;
      } else (n !== "$" && n !== "$?" && n !== "$!") || r++;
    n = i;
  } while (n);
  ds(t);
}
function En(e) {
  for (; e != null; e = e.nextSibling) {
    var t = e.nodeType;
    if (t === 1 || t === 3) break;
    if (t === 8) {
      if (((t = e.data), t === "$" || t === "$!" || t === "$?")) break;
      if (t === "/$") return null;
    }
  }
  return e;
}
function gf(e) {
  e = e.previousSibling;
  for (var t = 0; e; ) {
    if (e.nodeType === 8) {
      var n = e.data;
      if (n === "$" || n === "$!" || n === "$?") {
        if (t === 0) return e;
        t--;
      } else n === "/$" && t++;
    }
    e = e.previousSibling;
  }
  return null;
}
var fi = Math.random().toString(36).slice(2),
  Dt = "__reactFiber$" + fi,
  gs = "__reactProps$" + fi,
  nn = "__reactContainer$" + fi,
  pu = "__reactEvents$" + fi,
  Iy = "__reactListeners$" + fi,
  Ny = "__reactHandles$" + fi;
function Qn(e) {
  var t = e[Dt];
  if (t) return t;
  for (var n = e.parentNode; n; ) {
    if ((t = n[nn] || n[Dt])) {
      if (
        ((n = t.alternate),
        t.child !== null || (n !== null && n.child !== null))
      )
        for (e = gf(e); e !== null; ) {
          if ((n = e[Dt])) return n;
          e = gf(e);
        }
      return t;
    }
    (e = n), (n = e.parentNode);
  }
  return null;
}
function Ds(e) {
  return (
    (e = e[Dt] || e[nn]),
    !e || (e.tag !== 5 && e.tag !== 6 && e.tag !== 13 && e.tag !== 3) ? null : e
  );
}
function Lr(e) {
  if (e.tag === 5 || e.tag === 6) return e.stateNode;
  throw Error(b(33));
}
function xl(e) {
  return e[gs] || null;
}
var hu = [],
  Or = -1;
function Nn(e) {
  return { current: e };
}
function re(e) {
  0 > Or || ((e.current = hu[Or]), (hu[Or] = null), Or--);
}
function te(e, t) {
  Or++, (hu[Or] = e.current), (e.current = t);
}
var Ln = {},
  De = Nn(Ln),
  $e = Nn(!1),
  sr = Ln;
function qr(e, t) {
  var n = e.type.contextTypes;
  if (!n) return Ln;
  var r = e.stateNode;
  if (r && r.__reactInternalMemoizedUnmaskedChildContext === t)
    return r.__reactInternalMemoizedMaskedChildContext;
  var i = {},
    s;
  for (s in n) i[s] = t[s];
  return (
    r &&
      ((e = e.stateNode),
      (e.__reactInternalMemoizedUnmaskedChildContext = t),
      (e.__reactInternalMemoizedMaskedChildContext = i)),
    i
  );
}
function Ge(e) {
  return (e = e.childContextTypes), e != null;
}
function Ho() {
  re($e), re(De);
}
function vf(e, t, n) {
  if (De.current !== Ln) throw Error(b(168));
  te(De, t), te($e, n);
}
function jm(e, t, n) {
  var r = e.stateNode;
  if (((t = t.childContextTypes), typeof r.getChildContext != "function"))
    return n;
  r = r.getChildContext();
  for (var i in r) if (!(i in t)) throw Error(b(108, Sv(e) || "Unknown", i));
  return ce({}, n, r);
}
function $o(e) {
  return (
    (e =
      ((e = e.stateNode) && e.__reactInternalMemoizedMergedChildContext) || Ln),
    (sr = De.current),
    te(De, e),
    te($e, $e.current),
    !0
  );
}
function yf(e, t, n) {
  var r = e.stateNode;
  if (!r) throw Error(b(169));
  n
    ? ((e = jm(e, t, sr)),
      (r.__reactInternalMemoizedMergedChildContext = e),
      re($e),
      re(De),
      te(De, e))
    : re($e),
    te($e, n);
}
var Gt = null,
  Sl = !1,
  ua = !1;
function Fm(e) {
  Gt === null ? (Gt = [e]) : Gt.push(e);
}
function jy(e) {
  (Sl = !0), Fm(e);
}
function jn() {
  if (!ua && Gt !== null) {
    ua = !0;
    var e = 0,
      t = q;
    try {
      var n = Gt;
      for (q = 1; e < n.length; e++) {
        var r = n[e];
        do r = r(!0);
        while (r !== null);
      }
      (Gt = null), (Sl = !1);
    } catch (i) {
      throw (Gt !== null && (Gt = Gt.slice(e + 1)), cm(hc, jn), i);
    } finally {
      (q = t), (ua = !1);
    }
  }
  return null;
}
var Dr = [],
  Rr = 0,
  Go = null,
  Wo = 0,
  ct = [],
  dt = 0,
  or = null,
  Wt = 1,
  Ut = "";
function Kn(e, t) {
  (Dr[Rr++] = Wo), (Dr[Rr++] = Go), (Go = e), (Wo = t);
}
function zm(e, t, n) {
  (ct[dt++] = Wt), (ct[dt++] = Ut), (ct[dt++] = or), (or = e);
  var r = Wt;
  e = Ut;
  var i = 32 - Ct(r) - 1;
  (r &= ~(1 << i)), (n += 1);
  var s = 32 - Ct(t) + i;
  if (30 < s) {
    var o = i - (i % 5);
    (s = (r & ((1 << o) - 1)).toString(32)),
      (r >>= o),
      (i -= o),
      (Wt = (1 << (32 - Ct(t) + i)) | (n << i) | r),
      (Ut = s + e);
  } else (Wt = (1 << s) | (n << i) | r), (Ut = e);
}
function Cc(e) {
  e.return !== null && (Kn(e, 1), zm(e, 1, 0));
}
function Tc(e) {
  for (; e === Go; )
    (Go = Dr[--Rr]), (Dr[Rr] = null), (Wo = Dr[--Rr]), (Dr[Rr] = null);
  for (; e === or; )
    (or = ct[--dt]),
      (ct[dt] = null),
      (Ut = ct[--dt]),
      (ct[dt] = null),
      (Wt = ct[--dt]),
      (ct[dt] = null);
}
var Qe = null,
  Ze = null,
  se = !1,
  _t = null;
function Bm(e, t) {
  var n = ft(5, null, null, 0);
  (n.elementType = "DELETED"),
    (n.stateNode = t),
    (n.return = e),
    (t = e.deletions),
    t === null ? ((e.deletions = [n]), (e.flags |= 16)) : t.push(n);
}
function wf(e, t) {
  switch (e.tag) {
    case 5:
      var n = e.type;
      return (
        (t =
          t.nodeType !== 1 || n.toLowerCase() !== t.nodeName.toLowerCase()
            ? null
            : t),
        t !== null
          ? ((e.stateNode = t), (Qe = e), (Ze = En(t.firstChild)), !0)
          : !1
      );
    case 6:
      return (
        (t = e.pendingProps === "" || t.nodeType !== 3 ? null : t),
        t !== null ? ((e.stateNode = t), (Qe = e), (Ze = null), !0) : !1
      );
    case 13:
      return (
        (t = t.nodeType !== 8 ? null : t),
        t !== null
          ? ((n = or !== null ? { id: Wt, overflow: Ut } : null),
            (e.memoizedState = {
              dehydrated: t,
              treeContext: n,
              retryLane: 1073741824,
            }),
            (n = ft(18, null, null, 0)),
            (n.stateNode = t),
            (n.return = e),
            (e.child = n),
            (Qe = e),
            (Ze = null),
            !0)
          : !1
      );
    default:
      return !1;
  }
}
function mu(e) {
  return (e.mode & 1) !== 0 && (e.flags & 128) === 0;
}
function gu(e) {
  if (se) {
    var t = Ze;
    if (t) {
      var n = t;
      if (!wf(e, t)) {
        if (mu(e)) throw Error(b(418));
        t = En(n.nextSibling);
        var r = Qe;
        t && wf(e, t)
          ? Bm(r, n)
          : ((e.flags = (e.flags & -4097) | 2), (se = !1), (Qe = e));
      }
    } else {
      if (mu(e)) throw Error(b(418));
      (e.flags = (e.flags & -4097) | 2), (se = !1), (Qe = e);
    }
  }
}
function xf(e) {
  for (e = e.return; e !== null && e.tag !== 5 && e.tag !== 3 && e.tag !== 13; )
    e = e.return;
  Qe = e;
}
function ro(e) {
  if (e !== Qe) return !1;
  if (!se) return xf(e), (se = !0), !1;
  var t;
  if (
    ((t = e.tag !== 3) &&
      !(t = e.tag !== 5) &&
      ((t = e.type),
      (t = t !== "head" && t !== "body" && !du(e.type, e.memoizedProps))),
    t && (t = Ze))
  ) {
    if (mu(e)) throw (Hm(), Error(b(418)));
    for (; t; ) Bm(e, t), (t = En(t.nextSibling));
  }
  if ((xf(e), e.tag === 13)) {
    if (((e = e.memoizedState), (e = e !== null ? e.dehydrated : null), !e))
      throw Error(b(317));
    e: {
      for (e = e.nextSibling, t = 0; e; ) {
        if (e.nodeType === 8) {
          var n = e.data;
          if (n === "/$") {
            if (t === 0) {
              Ze = En(e.nextSibling);
              break e;
            }
            t--;
          } else (n !== "$" && n !== "$!" && n !== "$?") || t++;
        }
        e = e.nextSibling;
      }
      Ze = null;
    }
  } else Ze = Qe ? En(e.stateNode.nextSibling) : null;
  return !0;
}
function Hm() {
  for (var e = Ze; e; ) e = En(e.nextSibling);
}
function Jr() {
  (Ze = Qe = null), (se = !1);
}
function Ec(e) {
  _t === null ? (_t = [e]) : _t.push(e);
}
var Fy = ln.ReactCurrentBatchConfig;
function xt(e, t) {
  if (e && e.defaultProps) {
    (t = ce({}, t)), (e = e.defaultProps);
    for (var n in e) t[n] === void 0 && (t[n] = e[n]);
    return t;
  }
  return t;
}
var Uo = Nn(null),
  Ko = null,
  Vr = null,
  Pc = null;
function Ac() {
  Pc = Vr = Ko = null;
}
function kc(e) {
  var t = Uo.current;
  re(Uo), (e._currentValue = t);
}
function vu(e, t, n) {
  for (; e !== null; ) {
    var r = e.alternate;
    if (
      ((e.childLanes & t) !== t
        ? ((e.childLanes |= t), r !== null && (r.childLanes |= t))
        : r !== null && (r.childLanes & t) !== t && (r.childLanes |= t),
      e === n)
    )
      break;
    e = e.return;
  }
}
function Kr(e, t) {
  (Ko = e),
    (Pc = Vr = null),
    (e = e.dependencies),
    e !== null &&
      e.firstContext !== null &&
      (e.lanes & t && (He = !0), (e.firstContext = null));
}
function ht(e) {
  var t = e._currentValue;
  if (Pc !== e)
    if (((e = { context: e, memoizedValue: t, next: null }), Vr === null)) {
      if (Ko === null) throw Error(b(308));
      (Vr = e), (Ko.dependencies = { lanes: 0, firstContext: e });
    } else Vr = Vr.next = e;
  return t;
}
var qn = null;
function Mc(e) {
  qn === null ? (qn = [e]) : qn.push(e);
}
function $m(e, t, n, r) {
  var i = t.interleaved;
  return (
    i === null ? ((n.next = n), Mc(t)) : ((n.next = i.next), (i.next = n)),
    (t.interleaved = n),
    rn(e, r)
  );
}
function rn(e, t) {
  e.lanes |= t;
  var n = e.alternate;
  for (n !== null && (n.lanes |= t), n = e, e = e.return; e !== null; )
    (e.childLanes |= t),
      (n = e.alternate),
      n !== null && (n.childLanes |= t),
      (n = e),
      (e = e.return);
  return n.tag === 3 ? n.stateNode : null;
}
var gn = !1;
function bc(e) {
  e.updateQueue = {
    baseState: e.memoizedState,
    firstBaseUpdate: null,
    lastBaseUpdate: null,
    shared: { pending: null, interleaved: null, lanes: 0 },
    effects: null,
  };
}
function Gm(e, t) {
  (e = e.updateQueue),
    t.updateQueue === e &&
      (t.updateQueue = {
        baseState: e.baseState,
        firstBaseUpdate: e.firstBaseUpdate,
        lastBaseUpdate: e.lastBaseUpdate,
        shared: e.shared,
        effects: e.effects,
      });
}
function Xt(e, t) {
  return {
    eventTime: e,
    lane: t,
    tag: 0,
    payload: null,
    callback: null,
    next: null,
  };
}
function Pn(e, t, n) {
  var r = e.updateQueue;
  if (r === null) return null;
  if (((r = r.shared), X & 2)) {
    var i = r.pending;
    return (
      i === null ? (t.next = t) : ((t.next = i.next), (i.next = t)),
      (r.pending = t),
      rn(e, n)
    );
  }
  return (
    (i = r.interleaved),
    i === null ? ((t.next = t), Mc(r)) : ((t.next = i.next), (i.next = t)),
    (r.interleaved = t),
    rn(e, n)
  );
}
function _o(e, t, n) {
  if (
    ((t = t.updateQueue), t !== null && ((t = t.shared), (n & 4194240) !== 0))
  ) {
    var r = t.lanes;
    (r &= e.pendingLanes), (n |= r), (t.lanes = n), mc(e, n);
  }
}
function Sf(e, t) {
  var n = e.updateQueue,
    r = e.alternate;
  if (r !== null && ((r = r.updateQueue), n === r)) {
    var i = null,
      s = null;
    if (((n = n.firstBaseUpdate), n !== null)) {
      do {
        var o = {
          eventTime: n.eventTime,
          lane: n.lane,
          tag: n.tag,
          payload: n.payload,
          callback: n.callback,
          next: null,
        };
        s === null ? (i = s = o) : (s = s.next = o), (n = n.next);
      } while (n !== null);
      s === null ? (i = s = t) : (s = s.next = t);
    } else i = s = t;
    (n = {
      baseState: r.baseState,
      firstBaseUpdate: i,
      lastBaseUpdate: s,
      shared: r.shared,
      effects: r.effects,
    }),
      (e.updateQueue = n);
    return;
  }
  (e = n.lastBaseUpdate),
    e === null ? (n.firstBaseUpdate = t) : (e.next = t),
    (n.lastBaseUpdate = t);
}
function Yo(e, t, n, r) {
  var i = e.updateQueue;
  gn = !1;
  var s = i.firstBaseUpdate,
    o = i.lastBaseUpdate,
    u = i.shared.pending;
  if (u !== null) {
    i.shared.pending = null;
    var a = u,
      d = a.next;
    (a.next = null), o === null ? (s = d) : (o.next = d), (o = a);
    var p = e.alternate;
    p !== null &&
      ((p = p.updateQueue),
      (u = p.lastBaseUpdate),
      u !== o &&
        (u === null ? (p.firstBaseUpdate = d) : (u.next = d),
        (p.lastBaseUpdate = a)));
  }
  if (s !== null) {
    var l = i.baseState;
    (o = 0), (p = d = a = null), (u = s);
    do {
      var c = u.lane,
        f = u.eventTime;
      if ((r & c) === c) {
        p !== null &&
          (p = p.next =
            {
              eventTime: f,
              lane: 0,
              tag: u.tag,
              payload: u.payload,
              callback: u.callback,
              next: null,
            });
        e: {
          var m = e,
            v = u;
          switch (((c = t), (f = n), v.tag)) {
            case 1:
              if (((m = v.payload), typeof m == "function")) {
                l = m.call(f, l, c);
                break e;
              }
              l = m;
              break e;
            case 3:
              m.flags = (m.flags & -65537) | 128;
            case 0:
              if (
                ((m = v.payload),
                (c = typeof m == "function" ? m.call(f, l, c) : m),
                c == null)
              )
                break e;
              l = ce({}, l, c);
              break e;
            case 2:
              gn = !0;
          }
        }
        u.callback !== null &&
          u.lane !== 0 &&
          ((e.flags |= 64),
          (c = i.effects),
          c === null ? (i.effects = [u]) : c.push(u));
      } else
        (f = {
          eventTime: f,
          lane: c,
          tag: u.tag,
          payload: u.payload,
          callback: u.callback,
          next: null,
        }),
          p === null ? ((d = p = f), (a = l)) : (p = p.next = f),
          (o |= c);
      if (((u = u.next), u === null)) {
        if (((u = i.shared.pending), u === null)) break;
        (c = u),
          (u = c.next),
          (c.next = null),
          (i.lastBaseUpdate = c),
          (i.shared.pending = null);
      }
    } while (1);
    if (
      (p === null && (a = l),
      (i.baseState = a),
      (i.firstBaseUpdate = d),
      (i.lastBaseUpdate = p),
      (t = i.shared.interleaved),
      t !== null)
    ) {
      i = t;
      do (o |= i.lane), (i = i.next);
      while (i !== t);
    } else s === null && (i.shared.lanes = 0);
    (ar |= o), (e.lanes = o), (e.memoizedState = l);
  }
}
function _f(e, t, n) {
  if (((e = t.effects), (t.effects = null), e !== null))
    for (t = 0; t < e.length; t++) {
      var r = e[t],
        i = r.callback;
      if (i !== null) {
        if (((r.callback = null), (r = n), typeof i != "function"))
          throw Error(b(191, i));
        i.call(r);
      }
    }
}
var Wm = new $h.Component().refs;
function yu(e, t, n, r) {
  (t = e.memoizedState),
    (n = n(r, t)),
    (n = n == null ? t : ce({}, t, n)),
    (e.memoizedState = n),
    e.lanes === 0 && (e.updateQueue.baseState = n);
}
var _l = {
  isMounted: function (e) {
    return (e = e._reactInternals) ? mr(e) === e : !1;
  },
  enqueueSetState: function (e, t, n) {
    e = e._reactInternals;
    var r = Ne(),
      i = kn(e),
      s = Xt(r, i);
    (s.payload = t),
      n != null && (s.callback = n),
      (t = Pn(e, s, i)),
      t !== null && (Tt(t, e, i, r), _o(t, e, i));
  },
  enqueueReplaceState: function (e, t, n) {
    e = e._reactInternals;
    var r = Ne(),
      i = kn(e),
      s = Xt(r, i);
    (s.tag = 1),
      (s.payload = t),
      n != null && (s.callback = n),
      (t = Pn(e, s, i)),
      t !== null && (Tt(t, e, i, r), _o(t, e, i));
  },
  enqueueForceUpdate: function (e, t) {
    e = e._reactInternals;
    var n = Ne(),
      r = kn(e),
      i = Xt(n, r);
    (i.tag = 2),
      t != null && (i.callback = t),
      (t = Pn(e, i, r)),
      t !== null && (Tt(t, e, r, n), _o(t, e, r));
  },
};
function Cf(e, t, n, r, i, s, o) {
  return (
    (e = e.stateNode),
    typeof e.shouldComponentUpdate == "function"
      ? e.shouldComponentUpdate(r, s, o)
      : t.prototype && t.prototype.isPureReactComponent
      ? !ps(n, r) || !ps(i, s)
      : !0
  );
}
function Um(e, t, n) {
  var r = !1,
    i = Ln,
    s = t.contextType;
  return (
    typeof s == "object" && s !== null
      ? (s = ht(s))
      : ((i = Ge(t) ? sr : De.current),
        (r = t.contextTypes),
        (s = (r = r != null) ? qr(e, i) : Ln)),
    (t = new t(n, s)),
    (e.memoizedState = t.state !== null && t.state !== void 0 ? t.state : null),
    (t.updater = _l),
    (e.stateNode = t),
    (t._reactInternals = e),
    r &&
      ((e = e.stateNode),
      (e.__reactInternalMemoizedUnmaskedChildContext = i),
      (e.__reactInternalMemoizedMaskedChildContext = s)),
    t
  );
}
function Tf(e, t, n, r) {
  (e = t.state),
    typeof t.componentWillReceiveProps == "function" &&
      t.componentWillReceiveProps(n, r),
    typeof t.UNSAFE_componentWillReceiveProps == "function" &&
      t.UNSAFE_componentWillReceiveProps(n, r),
    t.state !== e && _l.enqueueReplaceState(t, t.state, null);
}
function wu(e, t, n, r) {
  var i = e.stateNode;
  (i.props = n), (i.state = e.memoizedState), (i.refs = Wm), bc(e);
  var s = t.contextType;
  typeof s == "object" && s !== null
    ? (i.context = ht(s))
    : ((s = Ge(t) ? sr : De.current), (i.context = qr(e, s))),
    (i.state = e.memoizedState),
    (s = t.getDerivedStateFromProps),
    typeof s == "function" && (yu(e, t, s, n), (i.state = e.memoizedState)),
    typeof t.getDerivedStateFromProps == "function" ||
      typeof i.getSnapshotBeforeUpdate == "function" ||
      (typeof i.UNSAFE_componentWillMount != "function" &&
        typeof i.componentWillMount != "function") ||
      ((t = i.state),
      typeof i.componentWillMount == "function" && i.componentWillMount(),
      typeof i.UNSAFE_componentWillMount == "function" &&
        i.UNSAFE_componentWillMount(),
      t !== i.state && _l.enqueueReplaceState(i, i.state, null),
      Yo(e, n, i, r),
      (i.state = e.memoizedState)),
    typeof i.componentDidMount == "function" && (e.flags |= 4194308);
}
function Ri(e, t, n) {
  if (
    ((e = n.ref), e !== null && typeof e != "function" && typeof e != "object")
  ) {
    if (n._owner) {
      if (((n = n._owner), n)) {
        if (n.tag !== 1) throw Error(b(309));
        var r = n.stateNode;
      }
      if (!r) throw Error(b(147, e));
      var i = r,
        s = "" + e;
      return t !== null &&
        t.ref !== null &&
        typeof t.ref == "function" &&
        t.ref._stringRef === s
        ? t.ref
        : ((t = function (o) {
            var u = i.refs;
            u === Wm && (u = i.refs = {}),
              o === null ? delete u[s] : (u[s] = o);
          }),
          (t._stringRef = s),
          t);
    }
    if (typeof e != "string") throw Error(b(284));
    if (!n._owner) throw Error(b(290, e));
  }
  return e;
}
function io(e, t) {
  throw (
    ((e = Object.prototype.toString.call(t)),
    Error(
      b(
        31,
        e === "[object Object]"
          ? "object with keys {" + Object.keys(t).join(", ") + "}"
          : e
      )
    ))
  );
}
function Ef(e) {
  var t = e._init;
  return t(e._payload);
}
function Km(e) {
  function t(h, g) {
    if (e) {
      var y = h.deletions;
      y === null ? ((h.deletions = [g]), (h.flags |= 16)) : y.push(g);
    }
  }
  function n(h, g) {
    if (!e) return null;
    for (; g !== null; ) t(h, g), (g = g.sibling);
    return null;
  }
  function r(h, g) {
    for (h = new Map(); g !== null; )
      g.key !== null ? h.set(g.key, g) : h.set(g.index, g), (g = g.sibling);
    return h;
  }
  function i(h, g) {
    return (h = Mn(h, g)), (h.index = 0), (h.sibling = null), h;
  }
  function s(h, g, y) {
    return (
      (h.index = y),
      e
        ? ((y = h.alternate),
          y !== null
            ? ((y = y.index), y < g ? ((h.flags |= 2), g) : y)
            : ((h.flags |= 2), g))
        : ((h.flags |= 1048576), g)
    );
  }
  function o(h) {
    return e && h.alternate === null && (h.flags |= 2), h;
  }
  function u(h, g, y, x) {
    return g === null || g.tag !== 6
      ? ((g = ga(y, h.mode, x)), (g.return = h), g)
      : ((g = i(g, y)), (g.return = h), g);
  }
  function a(h, g, y, x) {
    var S = y.type;
    return S === Ar
      ? p(h, g, y.props.children, x, y.key)
      : g !== null &&
        (g.elementType === S ||
          (typeof S == "object" &&
            S !== null &&
            S.$$typeof === mn &&
            Ef(S) === g.type))
      ? ((x = i(g, y.props)), (x.ref = Ri(h, g, y)), (x.return = h), x)
      : ((x = ko(y.type, y.key, y.props, null, h.mode, x)),
        (x.ref = Ri(h, g, y)),
        (x.return = h),
        x);
  }
  function d(h, g, y, x) {
    return g === null ||
      g.tag !== 4 ||
      g.stateNode.containerInfo !== y.containerInfo ||
      g.stateNode.implementation !== y.implementation
      ? ((g = va(y, h.mode, x)), (g.return = h), g)
      : ((g = i(g, y.children || [])), (g.return = h), g);
  }
  function p(h, g, y, x, S) {
    return g === null || g.tag !== 7
      ? ((g = nr(y, h.mode, x, S)), (g.return = h), g)
      : ((g = i(g, y)), (g.return = h), g);
  }
  function l(h, g, y) {
    if ((typeof g == "string" && g !== "") || typeof g == "number")
      return (g = ga("" + g, h.mode, y)), (g.return = h), g;
    if (typeof g == "object" && g !== null) {
      switch (g.$$typeof) {
        case Ks:
          return (
            (y = ko(g.type, g.key, g.props, null, h.mode, y)),
            (y.ref = Ri(h, null, g)),
            (y.return = h),
            y
          );
        case Pr:
          return (g = va(g, h.mode, y)), (g.return = h), g;
        case mn:
          var x = g._init;
          return l(h, x(g._payload), y);
      }
      if (Bi(g) || Mi(g))
        return (g = nr(g, h.mode, y, null)), (g.return = h), g;
      io(h, g);
    }
    return null;
  }
  function c(h, g, y, x) {
    var S = g !== null ? g.key : null;
    if ((typeof y == "string" && y !== "") || typeof y == "number")
      return S !== null ? null : u(h, g, "" + y, x);
    if (typeof y == "object" && y !== null) {
      switch (y.$$typeof) {
        case Ks:
          return y.key === S ? a(h, g, y, x) : null;
        case Pr:
          return y.key === S ? d(h, g, y, x) : null;
        case mn:
          return (S = y._init), c(h, g, S(y._payload), x);
      }
      if (Bi(y) || Mi(y)) return S !== null ? null : p(h, g, y, x, null);
      io(h, y);
    }
    return null;
  }
  function f(h, g, y, x, S) {
    if ((typeof x == "string" && x !== "") || typeof x == "number")
      return (h = h.get(y) || null), u(g, h, "" + x, S);
    if (typeof x == "object" && x !== null) {
      switch (x.$$typeof) {
        case Ks:
          return (h = h.get(x.key === null ? y : x.key) || null), a(g, h, x, S);
        case Pr:
          return (h = h.get(x.key === null ? y : x.key) || null), d(g, h, x, S);
        case mn:
          var T = x._init;
          return f(h, g, y, T(x._payload), S);
      }
      if (Bi(x) || Mi(x)) return (h = h.get(y) || null), p(g, h, x, S, null);
      io(g, x);
    }
    return null;
  }
  function m(h, g, y, x) {
    for (
      var S = null, T = null, M = g, E = (g = 0), k = null;
      M !== null && E < y.length;
      E++
    ) {
      M.index > E ? ((k = M), (M = null)) : (k = M.sibling);
      var P = c(h, M, y[E], x);
      if (P === null) {
        M === null && (M = k);
        break;
      }
      e && M && P.alternate === null && t(h, M),
        (g = s(P, g, E)),
        T === null ? (S = P) : (T.sibling = P),
        (T = P),
        (M = k);
    }
    if (E === y.length) return n(h, M), se && Kn(h, E), S;
    if (M === null) {
      for (; E < y.length; E++)
        (M = l(h, y[E], x)),
          M !== null &&
            ((g = s(M, g, E)), T === null ? (S = M) : (T.sibling = M), (T = M));
      return se && Kn(h, E), S;
    }
    for (M = r(h, M); E < y.length; E++)
      (k = f(M, h, E, y[E], x)),
        k !== null &&
          (e && k.alternate !== null && M.delete(k.key === null ? E : k.key),
          (g = s(k, g, E)),
          T === null ? (S = k) : (T.sibling = k),
          (T = k));
    return (
      e &&
        M.forEach(function (O) {
          return t(h, O);
        }),
      se && Kn(h, E),
      S
    );
  }
  function v(h, g, y, x) {
    var S = Mi(y);
    if (typeof S != "function") throw Error(b(150));
    if (((y = S.call(y)), y == null)) throw Error(b(151));
    for (
      var T = (S = null), M = g, E = (g = 0), k = null, P = y.next();
      M !== null && !P.done;
      E++, P = y.next()
    ) {
      M.index > E ? ((k = M), (M = null)) : (k = M.sibling);
      var O = c(h, M, P.value, x);
      if (O === null) {
        M === null && (M = k);
        break;
      }
      e && M && O.alternate === null && t(h, M),
        (g = s(O, g, E)),
        T === null ? (S = O) : (T.sibling = O),
        (T = O),
        (M = k);
    }
    if (P.done) return n(h, M), se && Kn(h, E), S;
    if (M === null) {
      for (; !P.done; E++, P = y.next())
        (P = l(h, P.value, x)),
          P !== null &&
            ((g = s(P, g, E)), T === null ? (S = P) : (T.sibling = P), (T = P));
      return se && Kn(h, E), S;
    }
    for (M = r(h, M); !P.done; E++, P = y.next())
      (P = f(M, h, E, P.value, x)),
        P !== null &&
          (e && P.alternate !== null && M.delete(P.key === null ? E : P.key),
          (g = s(P, g, E)),
          T === null ? (S = P) : (T.sibling = P),
          (T = P));
    return (
      e &&
        M.forEach(function (V) {
          return t(h, V);
        }),
      se && Kn(h, E),
      S
    );
  }
  function w(h, g, y, x) {
    if (
      (typeof y == "object" &&
        y !== null &&
        y.type === Ar &&
        y.key === null &&
        (y = y.props.children),
      typeof y == "object" && y !== null)
    ) {
      switch (y.$$typeof) {
        case Ks:
          e: {
            for (var S = y.key, T = g; T !== null; ) {
              if (T.key === S) {
                if (((S = y.type), S === Ar)) {
                  if (T.tag === 7) {
                    n(h, T.sibling),
                      (g = i(T, y.props.children)),
                      (g.return = h),
                      (h = g);
                    break e;
                  }
                } else if (
                  T.elementType === S ||
                  (typeof S == "object" &&
                    S !== null &&
                    S.$$typeof === mn &&
                    Ef(S) === T.type)
                ) {
                  n(h, T.sibling),
                    (g = i(T, y.props)),
                    (g.ref = Ri(h, T, y)),
                    (g.return = h),
                    (h = g);
                  break e;
                }
                n(h, T);
                break;
              } else t(h, T);
              T = T.sibling;
            }
            y.type === Ar
              ? ((g = nr(y.props.children, h.mode, x, y.key)),
                (g.return = h),
                (h = g))
              : ((x = ko(y.type, y.key, y.props, null, h.mode, x)),
                (x.ref = Ri(h, g, y)),
                (x.return = h),
                (h = x));
          }
          return o(h);
        case Pr:
          e: {
            for (T = y.key; g !== null; ) {
              if (g.key === T)
                if (
                  g.tag === 4 &&
                  g.stateNode.containerInfo === y.containerInfo &&
                  g.stateNode.implementation === y.implementation
                ) {
                  n(h, g.sibling),
                    (g = i(g, y.children || [])),
                    (g.return = h),
                    (h = g);
                  break e;
                } else {
                  n(h, g);
                  break;
                }
              else t(h, g);
              g = g.sibling;
            }
            (g = va(y, h.mode, x)), (g.return = h), (h = g);
          }
          return o(h);
        case mn:
          return (T = y._init), w(h, g, T(y._payload), x);
      }
      if (Bi(y)) return m(h, g, y, x);
      if (Mi(y)) return v(h, g, y, x);
      io(h, y);
    }
    return (typeof y == "string" && y !== "") || typeof y == "number"
      ? ((y = "" + y),
        g !== null && g.tag === 6
          ? (n(h, g.sibling), (g = i(g, y)), (g.return = h), (h = g))
          : (n(h, g), (g = ga(y, h.mode, x)), (g.return = h), (h = g)),
        o(h))
      : n(h, g);
  }
  return w;
}
var ei = Km(!0),
  Ym = Km(!1),
  Rs = {},
  Vt = Nn(Rs),
  vs = Nn(Rs),
  ys = Nn(Rs);
function Jn(e) {
  if (e === Rs) throw Error(b(174));
  return e;
}
function Lc(e, t) {
  switch ((te(ys, t), te(vs, e), te(Vt, Rs), (e = t.nodeType), e)) {
    case 9:
    case 11:
      t = (t = t.documentElement) ? t.namespaceURI : Qa(null, "");
      break;
    default:
      (e = e === 8 ? t.parentNode : t),
        (t = e.namespaceURI || null),
        (e = e.tagName),
        (t = Qa(t, e));
  }
  re(Vt), te(Vt, t);
}
function ti() {
  re(Vt), re(vs), re(ys);
}
function Xm(e) {
  Jn(ys.current);
  var t = Jn(Vt.current),
    n = Qa(t, e.type);
  t !== n && (te(vs, e), te(Vt, n));
}
function Oc(e) {
  vs.current === e && (re(Vt), re(vs));
}
var le = Nn(0);
function Xo(e) {
  for (var t = e; t !== null; ) {
    if (t.tag === 13) {
      var n = t.memoizedState;
      if (
        n !== null &&
        ((n = n.dehydrated), n === null || n.data === "$?" || n.data === "$!")
      )
        return t;
    } else if (t.tag === 19 && t.memoizedProps.revealOrder !== void 0) {
      if (t.flags & 128) return t;
    } else if (t.child !== null) {
      (t.child.return = t), (t = t.child);
      continue;
    }
    if (t === e) break;
    for (; t.sibling === null; ) {
      if (t.return === null || t.return === e) return null;
      t = t.return;
    }
    (t.sibling.return = t.return), (t = t.sibling);
  }
  return null;
}
var ca = [];
function Dc() {
  for (var e = 0; e < ca.length; e++)
    ca[e]._workInProgressVersionPrimary = null;
  ca.length = 0;
}
var Co = ln.ReactCurrentDispatcher,
  da = ln.ReactCurrentBatchConfig,
  lr = 0,
  ue = null,
  ve = null,
  xe = null,
  Zo = !1,
  Qi = !1,
  ws = 0,
  zy = 0;
function ke() {
  throw Error(b(321));
}
function Rc(e, t) {
  if (t === null) return !1;
  for (var n = 0; n < t.length && n < e.length; n++)
    if (!Et(e[n], t[n])) return !1;
  return !0;
}
function Vc(e, t, n, r, i, s) {
  if (
    ((lr = s),
    (ue = t),
    (t.memoizedState = null),
    (t.updateQueue = null),
    (t.lanes = 0),
    (Co.current = e === null || e.memoizedState === null ? Gy : Wy),
    (e = n(r, i)),
    Qi)
  ) {
    s = 0;
    do {
      if (((Qi = !1), (ws = 0), 25 <= s)) throw Error(b(301));
      (s += 1),
        (xe = ve = null),
        (t.updateQueue = null),
        (Co.current = Uy),
        (e = n(r, i));
    } while (Qi);
  }
  if (
    ((Co.current = Qo),
    (t = ve !== null && ve.next !== null),
    (lr = 0),
    (xe = ve = ue = null),
    (Zo = !1),
    t)
  )
    throw Error(b(300));
  return e;
}
function Ic() {
  var e = ws !== 0;
  return (ws = 0), e;
}
function Ot() {
  var e = {
    memoizedState: null,
    baseState: null,
    baseQueue: null,
    queue: null,
    next: null,
  };
  return xe === null ? (ue.memoizedState = xe = e) : (xe = xe.next = e), xe;
}
function mt() {
  if (ve === null) {
    var e = ue.alternate;
    e = e !== null ? e.memoizedState : null;
  } else e = ve.next;
  var t = xe === null ? ue.memoizedState : xe.next;
  if (t !== null) (xe = t), (ve = e);
  else {
    if (e === null) throw Error(b(310));
    (ve = e),
      (e = {
        memoizedState: ve.memoizedState,
        baseState: ve.baseState,
        baseQueue: ve.baseQueue,
        queue: ve.queue,
        next: null,
      }),
      xe === null ? (ue.memoizedState = xe = e) : (xe = xe.next = e);
  }
  return xe;
}
function xs(e, t) {
  return typeof t == "function" ? t(e) : t;
}
function fa(e) {
  var t = mt(),
    n = t.queue;
  if (n === null) throw Error(b(311));
  n.lastRenderedReducer = e;
  var r = ve,
    i = r.baseQueue,
    s = n.pending;
  if (s !== null) {
    if (i !== null) {
      var o = i.next;
      (i.next = s.next), (s.next = o);
    }
    (r.baseQueue = i = s), (n.pending = null);
  }
  if (i !== null) {
    (s = i.next), (r = r.baseState);
    var u = (o = null),
      a = null,
      d = s;
    do {
      var p = d.lane;
      if ((lr & p) === p)
        a !== null &&
          (a = a.next =
            {
              lane: 0,
              action: d.action,
              hasEagerState: d.hasEagerState,
              eagerState: d.eagerState,
              next: null,
            }),
          (r = d.hasEagerState ? d.eagerState : e(r, d.action));
      else {
        var l = {
          lane: p,
          action: d.action,
          hasEagerState: d.hasEagerState,
          eagerState: d.eagerState,
          next: null,
        };
        a === null ? ((u = a = l), (o = r)) : (a = a.next = l),
          (ue.lanes |= p),
          (ar |= p);
      }
      d = d.next;
    } while (d !== null && d !== s);
    a === null ? (o = r) : (a.next = u),
      Et(r, t.memoizedState) || (He = !0),
      (t.memoizedState = r),
      (t.baseState = o),
      (t.baseQueue = a),
      (n.lastRenderedState = r);
  }
  if (((e = n.interleaved), e !== null)) {
    i = e;
    do (s = i.lane), (ue.lanes |= s), (ar |= s), (i = i.next);
    while (i !== e);
  } else i === null && (n.lanes = 0);
  return [t.memoizedState, n.dispatch];
}
function pa(e) {
  var t = mt(),
    n = t.queue;
  if (n === null) throw Error(b(311));
  n.lastRenderedReducer = e;
  var r = n.dispatch,
    i = n.pending,
    s = t.memoizedState;
  if (i !== null) {
    n.pending = null;
    var o = (i = i.next);
    do (s = e(s, o.action)), (o = o.next);
    while (o !== i);
    Et(s, t.memoizedState) || (He = !0),
      (t.memoizedState = s),
      t.baseQueue === null && (t.baseState = s),
      (n.lastRenderedState = s);
  }
  return [s, r];
}
function Zm() {}
function Qm(e, t) {
  var n = ue,
    r = mt(),
    i = t(),
    s = !Et(r.memoizedState, i);
  if (
    (s && ((r.memoizedState = i), (He = !0)),
    (r = r.queue),
    Nc(e1.bind(null, n, r, e), [e]),
    r.getSnapshot !== t || s || (xe !== null && xe.memoizedState.tag & 1))
  ) {
    if (
      ((n.flags |= 2048),
      Ss(9, Jm.bind(null, n, r, i, t), void 0, null),
      Se === null)
    )
      throw Error(b(349));
    lr & 30 || qm(n, t, i);
  }
  return i;
}
function qm(e, t, n) {
  (e.flags |= 16384),
    (e = { getSnapshot: t, value: n }),
    (t = ue.updateQueue),
    t === null
      ? ((t = { lastEffect: null, stores: null }),
        (ue.updateQueue = t),
        (t.stores = [e]))
      : ((n = t.stores), n === null ? (t.stores = [e]) : n.push(e));
}
function Jm(e, t, n, r) {
  (t.value = n), (t.getSnapshot = r), t1(t) && n1(e);
}
function e1(e, t, n) {
  return n(function () {
    t1(t) && n1(e);
  });
}
function t1(e) {
  var t = e.getSnapshot;
  e = e.value;
  try {
    var n = t();
    return !Et(e, n);
  } catch {
    return !0;
  }
}
function n1(e) {
  var t = rn(e, 1);
  t !== null && Tt(t, e, 1, -1);
}
function Pf(e) {
  var t = Ot();
  return (
    typeof e == "function" && (e = e()),
    (t.memoizedState = t.baseState = e),
    (e = {
      pending: null,
      interleaved: null,
      lanes: 0,
      dispatch: null,
      lastRenderedReducer: xs,
      lastRenderedState: e,
    }),
    (t.queue = e),
    (e = e.dispatch = $y.bind(null, ue, e)),
    [t.memoizedState, e]
  );
}
function Ss(e, t, n, r) {
  return (
    (e = { tag: e, create: t, destroy: n, deps: r, next: null }),
    (t = ue.updateQueue),
    t === null
      ? ((t = { lastEffect: null, stores: null }),
        (ue.updateQueue = t),
        (t.lastEffect = e.next = e))
      : ((n = t.lastEffect),
        n === null
          ? (t.lastEffect = e.next = e)
          : ((r = n.next), (n.next = e), (e.next = r), (t.lastEffect = e))),
    e
  );
}
function r1() {
  return mt().memoizedState;
}
function To(e, t, n, r) {
  var i = Ot();
  (ue.flags |= e),
    (i.memoizedState = Ss(1 | t, n, void 0, r === void 0 ? null : r));
}
function Cl(e, t, n, r) {
  var i = mt();
  r = r === void 0 ? null : r;
  var s = void 0;
  if (ve !== null) {
    var o = ve.memoizedState;
    if (((s = o.destroy), r !== null && Rc(r, o.deps))) {
      i.memoizedState = Ss(t, n, s, r);
      return;
    }
  }
  (ue.flags |= e), (i.memoizedState = Ss(1 | t, n, s, r));
}
function Af(e, t) {
  return To(8390656, 8, e, t);
}
function Nc(e, t) {
  return Cl(2048, 8, e, t);
}
function i1(e, t) {
  return Cl(4, 2, e, t);
}
function s1(e, t) {
  return Cl(4, 4, e, t);
}
function o1(e, t) {
  if (typeof t == "function")
    return (
      (e = e()),
      t(e),
      function () {
        t(null);
      }
    );
  if (t != null)
    return (
      (e = e()),
      (t.current = e),
      function () {
        t.current = null;
      }
    );
}
function l1(e, t, n) {
  return (
    (n = n != null ? n.concat([e]) : null), Cl(4, 4, o1.bind(null, t, e), n)
  );
}
function jc() {}
function a1(e, t) {
  var n = mt();
  t = t === void 0 ? null : t;
  var r = n.memoizedState;
  return r !== null && t !== null && Rc(t, r[1])
    ? r[0]
    : ((n.memoizedState = [e, t]), e);
}
function u1(e, t) {
  var n = mt();
  t = t === void 0 ? null : t;
  var r = n.memoizedState;
  return r !== null && t !== null && Rc(t, r[1])
    ? r[0]
    : ((e = e()), (n.memoizedState = [e, t]), e);
}
function c1(e, t, n) {
  return lr & 21
    ? (Et(n, t) || ((n = pm()), (ue.lanes |= n), (ar |= n), (e.baseState = !0)),
      t)
    : (e.baseState && ((e.baseState = !1), (He = !0)), (e.memoizedState = n));
}
function By(e, t) {
  var n = q;
  (q = n !== 0 && 4 > n ? n : 4), e(!0);
  var r = da.transition;
  da.transition = {};
  try {
    e(!1), t();
  } finally {
    (q = n), (da.transition = r);
  }
}
function d1() {
  return mt().memoizedState;
}
function Hy(e, t, n) {
  var r = kn(e);
  if (
    ((n = {
      lane: r,
      action: n,
      hasEagerState: !1,
      eagerState: null,
      next: null,
    }),
    f1(e))
  )
    p1(t, n);
  else if (((n = $m(e, t, n, r)), n !== null)) {
    var i = Ne();
    Tt(n, e, r, i), h1(n, t, r);
  }
}
function $y(e, t, n) {
  var r = kn(e),
    i = { lane: r, action: n, hasEagerState: !1, eagerState: null, next: null };
  if (f1(e)) p1(t, i);
  else {
    var s = e.alternate;
    if (
      e.lanes === 0 &&
      (s === null || s.lanes === 0) &&
      ((s = t.lastRenderedReducer), s !== null)
    )
      try {
        var o = t.lastRenderedState,
          u = s(o, n);
        if (((i.hasEagerState = !0), (i.eagerState = u), Et(u, o))) {
          var a = t.interleaved;
          a === null
            ? ((i.next = i), Mc(t))
            : ((i.next = a.next), (a.next = i)),
            (t.interleaved = i);
          return;
        }
      } catch {
      } finally {
      }
    (n = $m(e, t, i, r)),
      n !== null && ((i = Ne()), Tt(n, e, r, i), h1(n, t, r));
  }
}
function f1(e) {
  var t = e.alternate;
  return e === ue || (t !== null && t === ue);
}
function p1(e, t) {
  Qi = Zo = !0;
  var n = e.pending;
  n === null ? (t.next = t) : ((t.next = n.next), (n.next = t)),
    (e.pending = t);
}
function h1(e, t, n) {
  if (n & 4194240) {
    var r = t.lanes;
    (r &= e.pendingLanes), (n |= r), (t.lanes = n), mc(e, n);
  }
}
var Qo = {
    readContext: ht,
    useCallback: ke,
    useContext: ke,
    useEffect: ke,
    useImperativeHandle: ke,
    useInsertionEffect: ke,
    useLayoutEffect: ke,
    useMemo: ke,
    useReducer: ke,
    useRef: ke,
    useState: ke,
    useDebugValue: ke,
    useDeferredValue: ke,
    useTransition: ke,
    useMutableSource: ke,
    useSyncExternalStore: ke,
    useId: ke,
    unstable_isNewReconciler: !1,
  },
  Gy = {
    readContext: ht,
    useCallback: function (e, t) {
      return (Ot().memoizedState = [e, t === void 0 ? null : t]), e;
    },
    useContext: ht,
    useEffect: Af,
    useImperativeHandle: function (e, t, n) {
      return (
        (n = n != null ? n.concat([e]) : null),
        To(4194308, 4, o1.bind(null, t, e), n)
      );
    },
    useLayoutEffect: function (e, t) {
      return To(4194308, 4, e, t);
    },
    useInsertionEffect: function (e, t) {
      return To(4, 2, e, t);
    },
    useMemo: function (e, t) {
      var n = Ot();
      return (
        (t = t === void 0 ? null : t), (e = e()), (n.memoizedState = [e, t]), e
      );
    },
    useReducer: function (e, t, n) {
      var r = Ot();
      return (
        (t = n !== void 0 ? n(t) : t),
        (r.memoizedState = r.baseState = t),
        (e = {
          pending: null,
          interleaved: null,
          lanes: 0,
          dispatch: null,
          lastRenderedReducer: e,
          lastRenderedState: t,
        }),
        (r.queue = e),
        (e = e.dispatch = Hy.bind(null, ue, e)),
        [r.memoizedState, e]
      );
    },
    useRef: function (e) {
      var t = Ot();
      return (e = { current: e }), (t.memoizedState = e);
    },
    useState: Pf,
    useDebugValue: jc,
    useDeferredValue: function (e) {
      return (Ot().memoizedState = e);
    },
    useTransition: function () {
      var e = Pf(!1),
        t = e[0];
      return (e = By.bind(null, e[1])), (Ot().memoizedState = e), [t, e];
    },
    useMutableSource: function () {},
    useSyncExternalStore: function (e, t, n) {
      var r = ue,
        i = Ot();
      if (se) {
        if (n === void 0) throw Error(b(407));
        n = n();
      } else {
        if (((n = t()), Se === null)) throw Error(b(349));
        lr & 30 || qm(r, t, n);
      }
      i.memoizedState = n;
      var s = { value: n, getSnapshot: t };
      return (
        (i.queue = s),
        Af(e1.bind(null, r, s, e), [e]),
        (r.flags |= 2048),
        Ss(9, Jm.bind(null, r, s, n, t), void 0, null),
        n
      );
    },
    useId: function () {
      var e = Ot(),
        t = Se.identifierPrefix;
      if (se) {
        var n = Ut,
          r = Wt;
        (n = (r & ~(1 << (32 - Ct(r) - 1))).toString(32) + n),
          (t = ":" + t + "R" + n),
          (n = ws++),
          0 < n && (t += "H" + n.toString(32)),
          (t += ":");
      } else (n = zy++), (t = ":" + t + "r" + n.toString(32) + ":");
      return (e.memoizedState = t);
    },
    unstable_isNewReconciler: !1,
  },
  Wy = {
    readContext: ht,
    useCallback: a1,
    useContext: ht,
    useEffect: Nc,
    useImperativeHandle: l1,
    useInsertionEffect: i1,
    useLayoutEffect: s1,
    useMemo: u1,
    useReducer: fa,
    useRef: r1,
    useState: function () {
      return fa(xs);
    },
    useDebugValue: jc,
    useDeferredValue: function (e) {
      var t = mt();
      return c1(t, ve.memoizedState, e);
    },
    useTransition: function () {
      var e = fa(xs)[0],
        t = mt().memoizedState;
      return [e, t];
    },
    useMutableSource: Zm,
    useSyncExternalStore: Qm,
    useId: d1,
    unstable_isNewReconciler: !1,
  },
  Uy = {
    readContext: ht,
    useCallback: a1,
    useContext: ht,
    useEffect: Nc,
    useImperativeHandle: l1,
    useInsertionEffect: i1,
    useLayoutEffect: s1,
    useMemo: u1,
    useReducer: pa,
    useRef: r1,
    useState: function () {
      return pa(xs);
    },
    useDebugValue: jc,
    useDeferredValue: function (e) {
      var t = mt();
      return ve === null ? (t.memoizedState = e) : c1(t, ve.memoizedState, e);
    },
    useTransition: function () {
      var e = pa(xs)[0],
        t = mt().memoizedState;
      return [e, t];
    },
    useMutableSource: Zm,
    useSyncExternalStore: Qm,
    useId: d1,
    unstable_isNewReconciler: !1,
  };
function ni(e, t) {
  try {
    var n = "",
      r = t;
    do (n += xv(r)), (r = r.return);
    while (r);
    var i = n;
  } catch (s) {
    i =
      `
Error generating stack: ` +
      s.message +
      `
` +
      s.stack;
  }
  return { value: e, source: t, stack: i, digest: null };
}
function ha(e, t, n) {
  return { value: e, source: null, stack: n ?? null, digest: t ?? null };
}
function xu(e, t) {
  try {
    console.error(t.value);
  } catch (n) {
    setTimeout(function () {
      throw n;
    });
  }
}
var Ky = typeof WeakMap == "function" ? WeakMap : Map;
function m1(e, t, n) {
  (n = Xt(-1, n)), (n.tag = 3), (n.payload = { element: null });
  var r = t.value;
  return (
    (n.callback = function () {
      Jo || ((Jo = !0), (bu = r)), xu(e, t);
    }),
    n
  );
}
function g1(e, t, n) {
  (n = Xt(-1, n)), (n.tag = 3);
  var r = e.type.getDerivedStateFromError;
  if (typeof r == "function") {
    var i = t.value;
    (n.payload = function () {
      return r(i);
    }),
      (n.callback = function () {
        xu(e, t);
      });
  }
  var s = e.stateNode;
  return (
    s !== null &&
      typeof s.componentDidCatch == "function" &&
      (n.callback = function () {
        xu(e, t),
          typeof r != "function" &&
            (An === null ? (An = new Set([this])) : An.add(this));
        var o = t.stack;
        this.componentDidCatch(t.value, {
          componentStack: o !== null ? o : "",
        });
      }),
    n
  );
}
function kf(e, t, n) {
  var r = e.pingCache;
  if (r === null) {
    r = e.pingCache = new Ky();
    var i = new Set();
    r.set(t, i);
  } else (i = r.get(t)), i === void 0 && ((i = new Set()), r.set(t, i));
  i.has(n) || (i.add(n), (e = lw.bind(null, e, t, n)), t.then(e, e));
}
function Mf(e) {
  do {
    var t;
    if (
      ((t = e.tag === 13) &&
        ((t = e.memoizedState), (t = t !== null ? t.dehydrated !== null : !0)),
      t)
    )
      return e;
    e = e.return;
  } while (e !== null);
  return null;
}
function bf(e, t, n, r, i) {
  return e.mode & 1
    ? ((e.flags |= 65536), (e.lanes = i), e)
    : (e === t
        ? (e.flags |= 65536)
        : ((e.flags |= 128),
          (n.flags |= 131072),
          (n.flags &= -52805),
          n.tag === 1 &&
            (n.alternate === null
              ? (n.tag = 17)
              : ((t = Xt(-1, 1)), (t.tag = 2), Pn(n, t, 1))),
          (n.lanes |= 1)),
      e);
}
var Yy = ln.ReactCurrentOwner,
  He = !1;
function Ie(e, t, n, r) {
  t.child = e === null ? Ym(t, null, n, r) : ei(t, e.child, n, r);
}
function Lf(e, t, n, r, i) {
  n = n.render;
  var s = t.ref;
  return (
    Kr(t, i),
    (r = Vc(e, t, n, r, s, i)),
    (n = Ic()),
    e !== null && !He
      ? ((t.updateQueue = e.updateQueue),
        (t.flags &= -2053),
        (e.lanes &= ~i),
        sn(e, t, i))
      : (se && n && Cc(t), (t.flags |= 1), Ie(e, t, r, i), t.child)
  );
}
function Of(e, t, n, r, i) {
  if (e === null) {
    var s = n.type;
    return typeof s == "function" &&
      !Uc(s) &&
      s.defaultProps === void 0 &&
      n.compare === null &&
      n.defaultProps === void 0
      ? ((t.tag = 15), (t.type = s), v1(e, t, s, r, i))
      : ((e = ko(n.type, null, r, t, t.mode, i)),
        (e.ref = t.ref),
        (e.return = t),
        (t.child = e));
  }
  if (((s = e.child), !(e.lanes & i))) {
    var o = s.memoizedProps;
    if (
      ((n = n.compare), (n = n !== null ? n : ps), n(o, r) && e.ref === t.ref)
    )
      return sn(e, t, i);
  }
  return (
    (t.flags |= 1),
    (e = Mn(s, r)),
    (e.ref = t.ref),
    (e.return = t),
    (t.child = e)
  );
}
function v1(e, t, n, r, i) {
  if (e !== null) {
    var s = e.memoizedProps;
    if (ps(s, r) && e.ref === t.ref)
      if (((He = !1), (t.pendingProps = r = s), (e.lanes & i) !== 0))
        e.flags & 131072 && (He = !0);
      else return (t.lanes = e.lanes), sn(e, t, i);
  }
  return Su(e, t, n, r, i);
}
function y1(e, t, n) {
  var r = t.pendingProps,
    i = r.children,
    s = e !== null ? e.memoizedState : null;
  if (r.mode === "hidden")
    if (!(t.mode & 1))
      (t.memoizedState = { baseLanes: 0, cachePool: null, transitions: null }),
        te(Nr, Ye),
        (Ye |= n);
    else {
      if (!(n & 1073741824))
        return (
          (e = s !== null ? s.baseLanes | n : n),
          (t.lanes = t.childLanes = 1073741824),
          (t.memoizedState = {
            baseLanes: e,
            cachePool: null,
            transitions: null,
          }),
          (t.updateQueue = null),
          te(Nr, Ye),
          (Ye |= e),
          null
        );
      (t.memoizedState = { baseLanes: 0, cachePool: null, transitions: null }),
        (r = s !== null ? s.baseLanes : n),
        te(Nr, Ye),
        (Ye |= r);
    }
  else
    s !== null ? ((r = s.baseLanes | n), (t.memoizedState = null)) : (r = n),
      te(Nr, Ye),
      (Ye |= r);
  return Ie(e, t, i, n), t.child;
}
function w1(e, t) {
  var n = t.ref;
  ((e === null && n !== null) || (e !== null && e.ref !== n)) &&
    ((t.flags |= 512), (t.flags |= 2097152));
}
function Su(e, t, n, r, i) {
  var s = Ge(n) ? sr : De.current;
  return (
    (s = qr(t, s)),
    Kr(t, i),
    (n = Vc(e, t, n, r, s, i)),
    (r = Ic()),
    e !== null && !He
      ? ((t.updateQueue = e.updateQueue),
        (t.flags &= -2053),
        (e.lanes &= ~i),
        sn(e, t, i))
      : (se && r && Cc(t), (t.flags |= 1), Ie(e, t, n, i), t.child)
  );
}
function Df(e, t, n, r, i) {
  if (Ge(n)) {
    var s = !0;
    $o(t);
  } else s = !1;
  if ((Kr(t, i), t.stateNode === null))
    Eo(e, t), Um(t, n, r), wu(t, n, r, i), (r = !0);
  else if (e === null) {
    var o = t.stateNode,
      u = t.memoizedProps;
    o.props = u;
    var a = o.context,
      d = n.contextType;
    typeof d == "object" && d !== null
      ? (d = ht(d))
      : ((d = Ge(n) ? sr : De.current), (d = qr(t, d)));
    var p = n.getDerivedStateFromProps,
      l =
        typeof p == "function" ||
        typeof o.getSnapshotBeforeUpdate == "function";
    l ||
      (typeof o.UNSAFE_componentWillReceiveProps != "function" &&
        typeof o.componentWillReceiveProps != "function") ||
      ((u !== r || a !== d) && Tf(t, o, r, d)),
      (gn = !1);
    var c = t.memoizedState;
    (o.state = c),
      Yo(t, r, o, i),
      (a = t.memoizedState),
      u !== r || c !== a || $e.current || gn
        ? (typeof p == "function" && (yu(t, n, p, r), (a = t.memoizedState)),
          (u = gn || Cf(t, n, u, r, c, a, d))
            ? (l ||
                (typeof o.UNSAFE_componentWillMount != "function" &&
                  typeof o.componentWillMount != "function") ||
                (typeof o.componentWillMount == "function" &&
                  o.componentWillMount(),
                typeof o.UNSAFE_componentWillMount == "function" &&
                  o.UNSAFE_componentWillMount()),
              typeof o.componentDidMount == "function" && (t.flags |= 4194308))
            : (typeof o.componentDidMount == "function" && (t.flags |= 4194308),
              (t.memoizedProps = r),
              (t.memoizedState = a)),
          (o.props = r),
          (o.state = a),
          (o.context = d),
          (r = u))
        : (typeof o.componentDidMount == "function" && (t.flags |= 4194308),
          (r = !1));
  } else {
    (o = t.stateNode),
      Gm(e, t),
      (u = t.memoizedProps),
      (d = t.type === t.elementType ? u : xt(t.type, u)),
      (o.props = d),
      (l = t.pendingProps),
      (c = o.context),
      (a = n.contextType),
      typeof a == "object" && a !== null
        ? (a = ht(a))
        : ((a = Ge(n) ? sr : De.current), (a = qr(t, a)));
    var f = n.getDerivedStateFromProps;
    (p =
      typeof f == "function" ||
      typeof o.getSnapshotBeforeUpdate == "function") ||
      (typeof o.UNSAFE_componentWillReceiveProps != "function" &&
        typeof o.componentWillReceiveProps != "function") ||
      ((u !== l || c !== a) && Tf(t, o, r, a)),
      (gn = !1),
      (c = t.memoizedState),
      (o.state = c),
      Yo(t, r, o, i);
    var m = t.memoizedState;
    u !== l || c !== m || $e.current || gn
      ? (typeof f == "function" && (yu(t, n, f, r), (m = t.memoizedState)),
        (d = gn || Cf(t, n, d, r, c, m, a) || !1)
          ? (p ||
              (typeof o.UNSAFE_componentWillUpdate != "function" &&
                typeof o.componentWillUpdate != "function") ||
              (typeof o.componentWillUpdate == "function" &&
                o.componentWillUpdate(r, m, a),
              typeof o.UNSAFE_componentWillUpdate == "function" &&
                o.UNSAFE_componentWillUpdate(r, m, a)),
            typeof o.componentDidUpdate == "function" && (t.flags |= 4),
            typeof o.getSnapshotBeforeUpdate == "function" && (t.flags |= 1024))
          : (typeof o.componentDidUpdate != "function" ||
              (u === e.memoizedProps && c === e.memoizedState) ||
              (t.flags |= 4),
            typeof o.getSnapshotBeforeUpdate != "function" ||
              (u === e.memoizedProps && c === e.memoizedState) ||
              (t.flags |= 1024),
            (t.memoizedProps = r),
            (t.memoizedState = m)),
        (o.props = r),
        (o.state = m),
        (o.context = a),
        (r = d))
      : (typeof o.componentDidUpdate != "function" ||
          (u === e.memoizedProps && c === e.memoizedState) ||
          (t.flags |= 4),
        typeof o.getSnapshotBeforeUpdate != "function" ||
          (u === e.memoizedProps && c === e.memoizedState) ||
          (t.flags |= 1024),
        (r = !1));
  }
  return _u(e, t, n, r, s, i);
}
function _u(e, t, n, r, i, s) {
  w1(e, t);
  var o = (t.flags & 128) !== 0;
  if (!r && !o) return i && yf(t, n, !1), sn(e, t, s);
  (r = t.stateNode), (Yy.current = t);
  var u =
    o && typeof n.getDerivedStateFromError != "function" ? null : r.render();
  return (
    (t.flags |= 1),
    e !== null && o
      ? ((t.child = ei(t, e.child, null, s)), (t.child = ei(t, null, u, s)))
      : Ie(e, t, u, s),
    (t.memoizedState = r.state),
    i && yf(t, n, !0),
    t.child
  );
}
function x1(e) {
  var t = e.stateNode;
  t.pendingContext
    ? vf(e, t.pendingContext, t.pendingContext !== t.context)
    : t.context && vf(e, t.context, !1),
    Lc(e, t.containerInfo);
}
function Rf(e, t, n, r, i) {
  return Jr(), Ec(i), (t.flags |= 256), Ie(e, t, n, r), t.child;
}
var Cu = { dehydrated: null, treeContext: null, retryLane: 0 };
function Tu(e) {
  return { baseLanes: e, cachePool: null, transitions: null };
}
function S1(e, t, n) {
  var r = t.pendingProps,
    i = le.current,
    s = !1,
    o = (t.flags & 128) !== 0,
    u;
  if (
    ((u = o) ||
      (u = e !== null && e.memoizedState === null ? !1 : (i & 2) !== 0),
    u
      ? ((s = !0), (t.flags &= -129))
      : (e === null || e.memoizedState !== null) && (i |= 1),
    te(le, i & 1),
    e === null)
  )
    return (
      gu(t),
      (e = t.memoizedState),
      e !== null && ((e = e.dehydrated), e !== null)
        ? (t.mode & 1
            ? e.data === "$!"
              ? (t.lanes = 8)
              : (t.lanes = 1073741824)
            : (t.lanes = 1),
          null)
        : ((o = r.children),
          (e = r.fallback),
          s
            ? ((r = t.mode),
              (s = t.child),
              (o = { mode: "hidden", children: o }),
              !(r & 1) && s !== null
                ? ((s.childLanes = 0), (s.pendingProps = o))
                : (s = Pl(o, r, 0, null)),
              (e = nr(e, r, n, null)),
              (s.return = t),
              (e.return = t),
              (s.sibling = e),
              (t.child = s),
              (t.child.memoizedState = Tu(n)),
              (t.memoizedState = Cu),
              e)
            : Fc(t, o))
    );
  if (((i = e.memoizedState), i !== null && ((u = i.dehydrated), u !== null)))
    return Xy(e, t, o, r, u, i, n);
  if (s) {
    (s = r.fallback), (o = t.mode), (i = e.child), (u = i.sibling);
    var a = { mode: "hidden", children: r.children };
    return (
      !(o & 1) && t.child !== i
        ? ((r = t.child),
          (r.childLanes = 0),
          (r.pendingProps = a),
          (t.deletions = null))
        : ((r = Mn(i, a)), (r.subtreeFlags = i.subtreeFlags & 14680064)),
      u !== null ? (s = Mn(u, s)) : ((s = nr(s, o, n, null)), (s.flags |= 2)),
      (s.return = t),
      (r.return = t),
      (r.sibling = s),
      (t.child = r),
      (r = s),
      (s = t.child),
      (o = e.child.memoizedState),
      (o =
        o === null
          ? Tu(n)
          : {
              baseLanes: o.baseLanes | n,
              cachePool: null,
              transitions: o.transitions,
            }),
      (s.memoizedState = o),
      (s.childLanes = e.childLanes & ~n),
      (t.memoizedState = Cu),
      r
    );
  }
  return (
    (s = e.child),
    (e = s.sibling),
    (r = Mn(s, { mode: "visible", children: r.children })),
    !(t.mode & 1) && (r.lanes = n),
    (r.return = t),
    (r.sibling = null),
    e !== null &&
      ((n = t.deletions),
      n === null ? ((t.deletions = [e]), (t.flags |= 16)) : n.push(e)),
    (t.child = r),
    (t.memoizedState = null),
    r
  );
}
function Fc(e, t) {
  return (
    (t = Pl({ mode: "visible", children: t }, e.mode, 0, null)),
    (t.return = e),
    (e.child = t)
  );
}
function so(e, t, n, r) {
  return (
    r !== null && Ec(r),
    ei(t, e.child, null, n),
    (e = Fc(t, t.pendingProps.children)),
    (e.flags |= 2),
    (t.memoizedState = null),
    e
  );
}
function Xy(e, t, n, r, i, s, o) {
  if (n)
    return t.flags & 256
      ? ((t.flags &= -257), (r = ha(Error(b(422)))), so(e, t, o, r))
      : t.memoizedState !== null
      ? ((t.child = e.child), (t.flags |= 128), null)
      : ((s = r.fallback),
        (i = t.mode),
        (r = Pl({ mode: "visible", children: r.children }, i, 0, null)),
        (s = nr(s, i, o, null)),
        (s.flags |= 2),
        (r.return = t),
        (s.return = t),
        (r.sibling = s),
        (t.child = r),
        t.mode & 1 && ei(t, e.child, null, o),
        (t.child.memoizedState = Tu(o)),
        (t.memoizedState = Cu),
        s);
  if (!(t.mode & 1)) return so(e, t, o, null);
  if (i.data === "$!") {
    if (((r = i.nextSibling && i.nextSibling.dataset), r)) var u = r.dgst;
    return (r = u), (s = Error(b(419))), (r = ha(s, r, void 0)), so(e, t, o, r);
  }
  if (((u = (o & e.childLanes) !== 0), He || u)) {
    if (((r = Se), r !== null)) {
      switch (o & -o) {
        case 4:
          i = 2;
          break;
        case 16:
          i = 8;
          break;
        case 64:
        case 128:
        case 256:
        case 512:
        case 1024:
        case 2048:
        case 4096:
        case 8192:
        case 16384:
        case 32768:
        case 65536:
        case 131072:
        case 262144:
        case 524288:
        case 1048576:
        case 2097152:
        case 4194304:
        case 8388608:
        case 16777216:
        case 33554432:
        case 67108864:
          i = 32;
          break;
        case 536870912:
          i = 268435456;
          break;
        default:
          i = 0;
      }
      (i = i & (r.suspendedLanes | o) ? 0 : i),
        i !== 0 &&
          i !== s.retryLane &&
          ((s.retryLane = i), rn(e, i), Tt(r, e, i, -1));
    }
    return Wc(), (r = ha(Error(b(421)))), so(e, t, o, r);
  }
  return i.data === "$?"
    ? ((t.flags |= 128),
      (t.child = e.child),
      (t = aw.bind(null, e)),
      (i._reactRetry = t),
      null)
    : ((e = s.treeContext),
      (Ze = En(i.nextSibling)),
      (Qe = t),
      (se = !0),
      (_t = null),
      e !== null &&
        ((ct[dt++] = Wt),
        (ct[dt++] = Ut),
        (ct[dt++] = or),
        (Wt = e.id),
        (Ut = e.overflow),
        (or = t)),
      (t = Fc(t, r.children)),
      (t.flags |= 4096),
      t);
}
function Vf(e, t, n) {
  e.lanes |= t;
  var r = e.alternate;
  r !== null && (r.lanes |= t), vu(e.return, t, n);
}
function ma(e, t, n, r, i) {
  var s = e.memoizedState;
  s === null
    ? (e.memoizedState = {
        isBackwards: t,
        rendering: null,
        renderingStartTime: 0,
        last: r,
        tail: n,
        tailMode: i,
      })
    : ((s.isBackwards = t),
      (s.rendering = null),
      (s.renderingStartTime = 0),
      (s.last = r),
      (s.tail = n),
      (s.tailMode = i));
}
function _1(e, t, n) {
  var r = t.pendingProps,
    i = r.revealOrder,
    s = r.tail;
  if ((Ie(e, t, r.children, n), (r = le.current), r & 2))
    (r = (r & 1) | 2), (t.flags |= 128);
  else {
    if (e !== null && e.flags & 128)
      e: for (e = t.child; e !== null; ) {
        if (e.tag === 13) e.memoizedState !== null && Vf(e, n, t);
        else if (e.tag === 19) Vf(e, n, t);
        else if (e.child !== null) {
          (e.child.return = e), (e = e.child);
          continue;
        }
        if (e === t) break e;
        for (; e.sibling === null; ) {
          if (e.return === null || e.return === t) break e;
          e = e.return;
        }
        (e.sibling.return = e.return), (e = e.sibling);
      }
    r &= 1;
  }
  if ((te(le, r), !(t.mode & 1))) t.memoizedState = null;
  else
    switch (i) {
      case "forwards":
        for (n = t.child, i = null; n !== null; )
          (e = n.alternate),
            e !== null && Xo(e) === null && (i = n),
            (n = n.sibling);
        (n = i),
          n === null
            ? ((i = t.child), (t.child = null))
            : ((i = n.sibling), (n.sibling = null)),
          ma(t, !1, i, n, s);
        break;
      case "backwards":
        for (n = null, i = t.child, t.child = null; i !== null; ) {
          if (((e = i.alternate), e !== null && Xo(e) === null)) {
            t.child = i;
            break;
          }
          (e = i.sibling), (i.sibling = n), (n = i), (i = e);
        }
        ma(t, !0, n, null, s);
        break;
      case "together":
        ma(t, !1, null, null, void 0);
        break;
      default:
        t.memoizedState = null;
    }
  return t.child;
}
function Eo(e, t) {
  !(t.mode & 1) &&
    e !== null &&
    ((e.alternate = null), (t.alternate = null), (t.flags |= 2));
}
function sn(e, t, n) {
  if (
    (e !== null && (t.dependencies = e.dependencies),
    (ar |= t.lanes),
    !(n & t.childLanes))
  )
    return null;
  if (e !== null && t.child !== e.child) throw Error(b(153));
  if (t.child !== null) {
    for (
      e = t.child, n = Mn(e, e.pendingProps), t.child = n, n.return = t;
      e.sibling !== null;

    )
      (e = e.sibling), (n = n.sibling = Mn(e, e.pendingProps)), (n.return = t);
    n.sibling = null;
  }
  return t.child;
}
function Zy(e, t, n) {
  switch (t.tag) {
    case 3:
      x1(t), Jr();
      break;
    case 5:
      Xm(t);
      break;
    case 1:
      Ge(t.type) && $o(t);
      break;
    case 4:
      Lc(t, t.stateNode.containerInfo);
      break;
    case 10:
      var r = t.type._context,
        i = t.memoizedProps.value;
      te(Uo, r._currentValue), (r._currentValue = i);
      break;
    case 13:
      if (((r = t.memoizedState), r !== null))
        return r.dehydrated !== null
          ? (te(le, le.current & 1), (t.flags |= 128), null)
          : n & t.child.childLanes
          ? S1(e, t, n)
          : (te(le, le.current & 1),
            (e = sn(e, t, n)),
            e !== null ? e.sibling : null);
      te(le, le.current & 1);
      break;
    case 19:
      if (((r = (n & t.childLanes) !== 0), e.flags & 128)) {
        if (r) return _1(e, t, n);
        t.flags |= 128;
      }
      if (
        ((i = t.memoizedState),
        i !== null &&
          ((i.rendering = null), (i.tail = null), (i.lastEffect = null)),
        te(le, le.current),
        r)
      )
        break;
      return null;
    case 22:
    case 23:
      return (t.lanes = 0), y1(e, t, n);
  }
  return sn(e, t, n);
}
var C1, Eu, T1, E1;
C1 = function (e, t) {
  for (var n = t.child; n !== null; ) {
    if (n.tag === 5 || n.tag === 6) e.appendChild(n.stateNode);
    else if (n.tag !== 4 && n.child !== null) {
      (n.child.return = n), (n = n.child);
      continue;
    }
    if (n === t) break;
    for (; n.sibling === null; ) {
      if (n.return === null || n.return === t) return;
      n = n.return;
    }
    (n.sibling.return = n.return), (n = n.sibling);
  }
};
Eu = function () {};
T1 = function (e, t, n, r) {
  var i = e.memoizedProps;
  if (i !== r) {
    (e = t.stateNode), Jn(Vt.current);
    var s = null;
    switch (n) {
      case "input":
        (i = Ka(e, i)), (r = Ka(e, r)), (s = []);
        break;
      case "select":
        (i = ce({}, i, { value: void 0 })),
          (r = ce({}, r, { value: void 0 })),
          (s = []);
        break;
      case "textarea":
        (i = Za(e, i)), (r = Za(e, r)), (s = []);
        break;
      default:
        typeof i.onClick != "function" &&
          typeof r.onClick == "function" &&
          (e.onclick = Bo);
    }
    qa(n, r);
    var o;
    n = null;
    for (d in i)
      if (!r.hasOwnProperty(d) && i.hasOwnProperty(d) && i[d] != null)
        if (d === "style") {
          var u = i[d];
          for (o in u) u.hasOwnProperty(o) && (n || (n = {}), (n[o] = ""));
        } else
          d !== "dangerouslySetInnerHTML" &&
            d !== "children" &&
            d !== "suppressContentEditableWarning" &&
            d !== "suppressHydrationWarning" &&
            d !== "autoFocus" &&
            (os.hasOwnProperty(d)
              ? s || (s = [])
              : (s = s || []).push(d, null));
    for (d in r) {
      var a = r[d];
      if (
        ((u = i != null ? i[d] : void 0),
        r.hasOwnProperty(d) && a !== u && (a != null || u != null))
      )
        if (d === "style")
          if (u) {
            for (o in u)
              !u.hasOwnProperty(o) ||
                (a && a.hasOwnProperty(o)) ||
                (n || (n = {}), (n[o] = ""));
            for (o in a)
              a.hasOwnProperty(o) &&
                u[o] !== a[o] &&
                (n || (n = {}), (n[o] = a[o]));
          } else n || (s || (s = []), s.push(d, n)), (n = a);
        else
          d === "dangerouslySetInnerHTML"
            ? ((a = a ? a.__html : void 0),
              (u = u ? u.__html : void 0),
              a != null && u !== a && (s = s || []).push(d, a))
            : d === "children"
            ? (typeof a != "string" && typeof a != "number") ||
              (s = s || []).push(d, "" + a)
            : d !== "suppressContentEditableWarning" &&
              d !== "suppressHydrationWarning" &&
              (os.hasOwnProperty(d)
                ? (a != null && d === "onScroll" && ne("scroll", e),
                  s || u === a || (s = []))
                : (s = s || []).push(d, a));
    }
    n && (s = s || []).push("style", n);
    var d = s;
    (t.updateQueue = d) && (t.flags |= 4);
  }
};
E1 = function (e, t, n, r) {
  n !== r && (t.flags |= 4);
};
function Vi(e, t) {
  if (!se)
    switch (e.tailMode) {
      case "hidden":
        t = e.tail;
        for (var n = null; t !== null; )
          t.alternate !== null && (n = t), (t = t.sibling);
        n === null ? (e.tail = null) : (n.sibling = null);
        break;
      case "collapsed":
        n = e.tail;
        for (var r = null; n !== null; )
          n.alternate !== null && (r = n), (n = n.sibling);
        r === null
          ? t || e.tail === null
            ? (e.tail = null)
            : (e.tail.sibling = null)
          : (r.sibling = null);
    }
}
function Me(e) {
  var t = e.alternate !== null && e.alternate.child === e.child,
    n = 0,
    r = 0;
  if (t)
    for (var i = e.child; i !== null; )
      (n |= i.lanes | i.childLanes),
        (r |= i.subtreeFlags & 14680064),
        (r |= i.flags & 14680064),
        (i.return = e),
        (i = i.sibling);
  else
    for (i = e.child; i !== null; )
      (n |= i.lanes | i.childLanes),
        (r |= i.subtreeFlags),
        (r |= i.flags),
        (i.return = e),
        (i = i.sibling);
  return (e.subtreeFlags |= r), (e.childLanes = n), t;
}
function Qy(e, t, n) {
  var r = t.pendingProps;
  switch ((Tc(t), t.tag)) {
    case 2:
    case 16:
    case 15:
    case 0:
    case 11:
    case 7:
    case 8:
    case 12:
    case 9:
    case 14:
      return Me(t), null;
    case 1:
      return Ge(t.type) && Ho(), Me(t), null;
    case 3:
      return (
        (r = t.stateNode),
        ti(),
        re($e),
        re(De),
        Dc(),
        r.pendingContext &&
          ((r.context = r.pendingContext), (r.pendingContext = null)),
        (e === null || e.child === null) &&
          (ro(t)
            ? (t.flags |= 4)
            : e === null ||
              (e.memoizedState.isDehydrated && !(t.flags & 256)) ||
              ((t.flags |= 1024), _t !== null && (Du(_t), (_t = null)))),
        Eu(e, t),
        Me(t),
        null
      );
    case 5:
      Oc(t);
      var i = Jn(ys.current);
      if (((n = t.type), e !== null && t.stateNode != null))
        T1(e, t, n, r, i),
          e.ref !== t.ref && ((t.flags |= 512), (t.flags |= 2097152));
      else {
        if (!r) {
          if (t.stateNode === null) throw Error(b(166));
          return Me(t), null;
        }
        if (((e = Jn(Vt.current)), ro(t))) {
          (r = t.stateNode), (n = t.type);
          var s = t.memoizedProps;
          switch (((r[Dt] = t), (r[gs] = s), (e = (t.mode & 1) !== 0), n)) {
            case "dialog":
              ne("cancel", r), ne("close", r);
              break;
            case "iframe":
            case "object":
            case "embed":
              ne("load", r);
              break;
            case "video":
            case "audio":
              for (i = 0; i < $i.length; i++) ne($i[i], r);
              break;
            case "source":
              ne("error", r);
              break;
            case "img":
            case "image":
            case "link":
              ne("error", r), ne("load", r);
              break;
            case "details":
              ne("toggle", r);
              break;
            case "input":
              $d(r, s), ne("invalid", r);
              break;
            case "select":
              (r._wrapperState = { wasMultiple: !!s.multiple }),
                ne("invalid", r);
              break;
            case "textarea":
              Wd(r, s), ne("invalid", r);
          }
          qa(n, s), (i = null);
          for (var o in s)
            if (s.hasOwnProperty(o)) {
              var u = s[o];
              o === "children"
                ? typeof u == "string"
                  ? r.textContent !== u &&
                    (s.suppressHydrationWarning !== !0 &&
                      no(r.textContent, u, e),
                    (i = ["children", u]))
                  : typeof u == "number" &&
                    r.textContent !== "" + u &&
                    (s.suppressHydrationWarning !== !0 &&
                      no(r.textContent, u, e),
                    (i = ["children", "" + u]))
                : os.hasOwnProperty(o) &&
                  u != null &&
                  o === "onScroll" &&
                  ne("scroll", r);
            }
          switch (n) {
            case "input":
              Ys(r), Gd(r, s, !0);
              break;
            case "textarea":
              Ys(r), Ud(r);
              break;
            case "select":
            case "option":
              break;
            default:
              typeof s.onClick == "function" && (r.onclick = Bo);
          }
          (r = i), (t.updateQueue = r), r !== null && (t.flags |= 4);
        } else {
          (o = i.nodeType === 9 ? i : i.ownerDocument),
            e === "http://www.w3.org/1999/xhtml" && (e = qh(n)),
            e === "http://www.w3.org/1999/xhtml"
              ? n === "script"
                ? ((e = o.createElement("div")),
                  (e.innerHTML = "<script></script>"),
                  (e = e.removeChild(e.firstChild)))
                : typeof r.is == "string"
                ? (e = o.createElement(n, { is: r.is }))
                : ((e = o.createElement(n)),
                  n === "select" &&
                    ((o = e),
                    r.multiple
                      ? (o.multiple = !0)
                      : r.size && (o.size = r.size)))
              : (e = o.createElementNS(e, n)),
            (e[Dt] = t),
            (e[gs] = r),
            C1(e, t, !1, !1),
            (t.stateNode = e);
          e: {
            switch (((o = Ja(n, r)), n)) {
              case "dialog":
                ne("cancel", e), ne("close", e), (i = r);
                break;
              case "iframe":
              case "object":
              case "embed":
                ne("load", e), (i = r);
                break;
              case "video":
              case "audio":
                for (i = 0; i < $i.length; i++) ne($i[i], e);
                i = r;
                break;
              case "source":
                ne("error", e), (i = r);
                break;
              case "img":
              case "image":
              case "link":
                ne("error", e), ne("load", e), (i = r);
                break;
              case "details":
                ne("toggle", e), (i = r);
                break;
              case "input":
                $d(e, r), (i = Ka(e, r)), ne("invalid", e);
                break;
              case "option":
                i = r;
                break;
              case "select":
                (e._wrapperState = { wasMultiple: !!r.multiple }),
                  (i = ce({}, r, { value: void 0 })),
                  ne("invalid", e);
                break;
              case "textarea":
                Wd(e, r), (i = Za(e, r)), ne("invalid", e);
                break;
              default:
                i = r;
            }
            qa(n, i), (u = i);
            for (s in u)
              if (u.hasOwnProperty(s)) {
                var a = u[s];
                s === "style"
                  ? tm(e, a)
                  : s === "dangerouslySetInnerHTML"
                  ? ((a = a ? a.__html : void 0), a != null && Jh(e, a))
                  : s === "children"
                  ? typeof a == "string"
                    ? (n !== "textarea" || a !== "") && ls(e, a)
                    : typeof a == "number" && ls(e, "" + a)
                  : s !== "suppressContentEditableWarning" &&
                    s !== "suppressHydrationWarning" &&
                    s !== "autoFocus" &&
                    (os.hasOwnProperty(s)
                      ? a != null && s === "onScroll" && ne("scroll", e)
                      : a != null && uc(e, s, a, o));
              }
            switch (n) {
              case "input":
                Ys(e), Gd(e, r, !1);
                break;
              case "textarea":
                Ys(e), Ud(e);
                break;
              case "option":
                r.value != null && e.setAttribute("value", "" + bn(r.value));
                break;
              case "select":
                (e.multiple = !!r.multiple),
                  (s = r.value),
                  s != null
                    ? $r(e, !!r.multiple, s, !1)
                    : r.defaultValue != null &&
                      $r(e, !!r.multiple, r.defaultValue, !0);
                break;
              default:
                typeof i.onClick == "function" && (e.onclick = Bo);
            }
            switch (n) {
              case "button":
              case "input":
              case "select":
              case "textarea":
                r = !!r.autoFocus;
                break e;
              case "img":
                r = !0;
                break e;
              default:
                r = !1;
            }
          }
          r && (t.flags |= 4);
        }
        t.ref !== null && ((t.flags |= 512), (t.flags |= 2097152));
      }
      return Me(t), null;
    case 6:
      if (e && t.stateNode != null) E1(e, t, e.memoizedProps, r);
      else {
        if (typeof r != "string" && t.stateNode === null) throw Error(b(166));
        if (((n = Jn(ys.current)), Jn(Vt.current), ro(t))) {
          if (
            ((r = t.stateNode),
            (n = t.memoizedProps),
            (r[Dt] = t),
            (s = r.nodeValue !== n) && ((e = Qe), e !== null))
          )
            switch (e.tag) {
              case 3:
                no(r.nodeValue, n, (e.mode & 1) !== 0);
                break;
              case 5:
                e.memoizedProps.suppressHydrationWarning !== !0 &&
                  no(r.nodeValue, n, (e.mode & 1) !== 0);
            }
          s && (t.flags |= 4);
        } else
          (r = (n.nodeType === 9 ? n : n.ownerDocument).createTextNode(r)),
            (r[Dt] = t),
            (t.stateNode = r);
      }
      return Me(t), null;
    case 13:
      if (
        (re(le),
        (r = t.memoizedState),
        e === null ||
          (e.memoizedState !== null && e.memoizedState.dehydrated !== null))
      ) {
        if (se && Ze !== null && t.mode & 1 && !(t.flags & 128))
          Hm(), Jr(), (t.flags |= 98560), (s = !1);
        else if (((s = ro(t)), r !== null && r.dehydrated !== null)) {
          if (e === null) {
            if (!s) throw Error(b(318));
            if (
              ((s = t.memoizedState),
              (s = s !== null ? s.dehydrated : null),
              !s)
            )
              throw Error(b(317));
            s[Dt] = t;
          } else
            Jr(), !(t.flags & 128) && (t.memoizedState = null), (t.flags |= 4);
          Me(t), (s = !1);
        } else _t !== null && (Du(_t), (_t = null)), (s = !0);
        if (!s) return t.flags & 65536 ? t : null;
      }
      return t.flags & 128
        ? ((t.lanes = n), t)
        : ((r = r !== null),
          r !== (e !== null && e.memoizedState !== null) &&
            r &&
            ((t.child.flags |= 8192),
            t.mode & 1 &&
              (e === null || le.current & 1 ? ye === 0 && (ye = 3) : Wc())),
          t.updateQueue !== null && (t.flags |= 4),
          Me(t),
          null);
    case 4:
      return (
        ti(), Eu(e, t), e === null && hs(t.stateNode.containerInfo), Me(t), null
      );
    case 10:
      return kc(t.type._context), Me(t), null;
    case 17:
      return Ge(t.type) && Ho(), Me(t), null;
    case 19:
      if ((re(le), (s = t.memoizedState), s === null)) return Me(t), null;
      if (((r = (t.flags & 128) !== 0), (o = s.rendering), o === null))
        if (r) Vi(s, !1);
        else {
          if (ye !== 0 || (e !== null && e.flags & 128))
            for (e = t.child; e !== null; ) {
              if (((o = Xo(e)), o !== null)) {
                for (
                  t.flags |= 128,
                    Vi(s, !1),
                    r = o.updateQueue,
                    r !== null && ((t.updateQueue = r), (t.flags |= 4)),
                    t.subtreeFlags = 0,
                    r = n,
                    n = t.child;
                  n !== null;

                )
                  (s = n),
                    (e = r),
                    (s.flags &= 14680066),
                    (o = s.alternate),
                    o === null
                      ? ((s.childLanes = 0),
                        (s.lanes = e),
                        (s.child = null),
                        (s.subtreeFlags = 0),
                        (s.memoizedProps = null),
                        (s.memoizedState = null),
                        (s.updateQueue = null),
                        (s.dependencies = null),
                        (s.stateNode = null))
                      : ((s.childLanes = o.childLanes),
                        (s.lanes = o.lanes),
                        (s.child = o.child),
                        (s.subtreeFlags = 0),
                        (s.deletions = null),
                        (s.memoizedProps = o.memoizedProps),
                        (s.memoizedState = o.memoizedState),
                        (s.updateQueue = o.updateQueue),
                        (s.type = o.type),
                        (e = o.dependencies),
                        (s.dependencies =
                          e === null
                            ? null
                            : {
                                lanes: e.lanes,
                                firstContext: e.firstContext,
                              })),
                    (n = n.sibling);
                return te(le, (le.current & 1) | 2), t.child;
              }
              e = e.sibling;
            }
          s.tail !== null &&
            pe() > ri &&
            ((t.flags |= 128), (r = !0), Vi(s, !1), (t.lanes = 4194304));
        }
      else {
        if (!r)
          if (((e = Xo(o)), e !== null)) {
            if (
              ((t.flags |= 128),
              (r = !0),
              (n = e.updateQueue),
              n !== null && ((t.updateQueue = n), (t.flags |= 4)),
              Vi(s, !0),
              s.tail === null && s.tailMode === "hidden" && !o.alternate && !se)
            )
              return Me(t), null;
          } else
            2 * pe() - s.renderingStartTime > ri &&
              n !== 1073741824 &&
              ((t.flags |= 128), (r = !0), Vi(s, !1), (t.lanes = 4194304));
        s.isBackwards
          ? ((o.sibling = t.child), (t.child = o))
          : ((n = s.last),
            n !== null ? (n.sibling = o) : (t.child = o),
            (s.last = o));
      }
      return s.tail !== null
        ? ((t = s.tail),
          (s.rendering = t),
          (s.tail = t.sibling),
          (s.renderingStartTime = pe()),
          (t.sibling = null),
          (n = le.current),
          te(le, r ? (n & 1) | 2 : n & 1),
          t)
        : (Me(t), null);
    case 22:
    case 23:
      return (
        Gc(),
        (r = t.memoizedState !== null),
        e !== null && (e.memoizedState !== null) !== r && (t.flags |= 8192),
        r && t.mode & 1
          ? Ye & 1073741824 && (Me(t), t.subtreeFlags & 6 && (t.flags |= 8192))
          : Me(t),
        null
      );
    case 24:
      return null;
    case 25:
      return null;
  }
  throw Error(b(156, t.tag));
}
function qy(e, t) {
  switch ((Tc(t), t.tag)) {
    case 1:
      return (
        Ge(t.type) && Ho(),
        (e = t.flags),
        e & 65536 ? ((t.flags = (e & -65537) | 128), t) : null
      );
    case 3:
      return (
        ti(),
        re($e),
        re(De),
        Dc(),
        (e = t.flags),
        e & 65536 && !(e & 128) ? ((t.flags = (e & -65537) | 128), t) : null
      );
    case 5:
      return Oc(t), null;
    case 13:
      if (
        (re(le), (e = t.memoizedState), e !== null && e.dehydrated !== null)
      ) {
        if (t.alternate === null) throw Error(b(340));
        Jr();
      }
      return (
        (e = t.flags), e & 65536 ? ((t.flags = (e & -65537) | 128), t) : null
      );
    case 19:
      return re(le), null;
    case 4:
      return ti(), null;
    case 10:
      return kc(t.type._context), null;
    case 22:
    case 23:
      return Gc(), null;
    case 24:
      return null;
    default:
      return null;
  }
}
var oo = !1,
  Le = !1,
  Jy = typeof WeakSet == "function" ? WeakSet : Set,
  j = null;
function Ir(e, t) {
  var n = e.ref;
  if (n !== null)
    if (typeof n == "function")
      try {
        n(null);
      } catch (r) {
        de(e, t, r);
      }
    else n.current = null;
}
function Pu(e, t, n) {
  try {
    n();
  } catch (r) {
    de(e, t, r);
  }
}
var If = !1;
function ew(e, t) {
  if (((uu = jo), (e = Mm()), _c(e))) {
    if ("selectionStart" in e)
      var n = { start: e.selectionStart, end: e.selectionEnd };
    else
      e: {
        n = ((n = e.ownerDocument) && n.defaultView) || window;
        var r = n.getSelection && n.getSelection();
        if (r && r.rangeCount !== 0) {
          n = r.anchorNode;
          var i = r.anchorOffset,
            s = r.focusNode;
          r = r.focusOffset;
          try {
            n.nodeType, s.nodeType;
          } catch {
            n = null;
            break e;
          }
          var o = 0,
            u = -1,
            a = -1,
            d = 0,
            p = 0,
            l = e,
            c = null;
          t: for (;;) {
            for (
              var f;
              l !== n || (i !== 0 && l.nodeType !== 3) || (u = o + i),
                l !== s || (r !== 0 && l.nodeType !== 3) || (a = o + r),
                l.nodeType === 3 && (o += l.nodeValue.length),
                (f = l.firstChild) !== null;

            )
              (c = l), (l = f);
            for (;;) {
              if (l === e) break t;
              if (
                (c === n && ++d === i && (u = o),
                c === s && ++p === r && (a = o),
                (f = l.nextSibling) !== null)
              )
                break;
              (l = c), (c = l.parentNode);
            }
            l = f;
          }
          n = u === -1 || a === -1 ? null : { start: u, end: a };
        } else n = null;
      }
    n = n || { start: 0, end: 0 };
  } else n = null;
  for (cu = { focusedElem: e, selectionRange: n }, jo = !1, j = t; j !== null; )
    if (((t = j), (e = t.child), (t.subtreeFlags & 1028) !== 0 && e !== null))
      (e.return = t), (j = e);
    else
      for (; j !== null; ) {
        t = j;
        try {
          var m = t.alternate;
          if (t.flags & 1024)
            switch (t.tag) {
              case 0:
              case 11:
              case 15:
                break;
              case 1:
                if (m !== null) {
                  var v = m.memoizedProps,
                    w = m.memoizedState,
                    h = t.stateNode,
                    g = h.getSnapshotBeforeUpdate(
                      t.elementType === t.type ? v : xt(t.type, v),
                      w
                    );
                  h.__reactInternalSnapshotBeforeUpdate = g;
                }
                break;
              case 3:
                var y = t.stateNode.containerInfo;
                y.nodeType === 1
                  ? (y.textContent = "")
                  : y.nodeType === 9 &&
                    y.documentElement &&
                    y.removeChild(y.documentElement);
                break;
              case 5:
              case 6:
              case 4:
              case 17:
                break;
              default:
                throw Error(b(163));
            }
        } catch (x) {
          de(t, t.return, x);
        }
        if (((e = t.sibling), e !== null)) {
          (e.return = t.return), (j = e);
          break;
        }
        j = t.return;
      }
  return (m = If), (If = !1), m;
}
function qi(e, t, n) {
  var r = t.updateQueue;
  if (((r = r !== null ? r.lastEffect : null), r !== null)) {
    var i = (r = r.next);
    do {
      if ((i.tag & e) === e) {
        var s = i.destroy;
        (i.destroy = void 0), s !== void 0 && Pu(t, n, s);
      }
      i = i.next;
    } while (i !== r);
  }
}
function Tl(e, t) {
  if (
    ((t = t.updateQueue), (t = t !== null ? t.lastEffect : null), t !== null)
  ) {
    var n = (t = t.next);
    do {
      if ((n.tag & e) === e) {
        var r = n.create;
        n.destroy = r();
      }
      n = n.next;
    } while (n !== t);
  }
}
function Au(e) {
  var t = e.ref;
  if (t !== null) {
    var n = e.stateNode;
    switch (e.tag) {
      case 5:
        e = n;
        break;
      default:
        e = n;
    }
    typeof t == "function" ? t(e) : (t.current = e);
  }
}
function P1(e) {
  var t = e.alternate;
  t !== null && ((e.alternate = null), P1(t)),
    (e.child = null),
    (e.deletions = null),
    (e.sibling = null),
    e.tag === 5 &&
      ((t = e.stateNode),
      t !== null &&
        (delete t[Dt], delete t[gs], delete t[pu], delete t[Iy], delete t[Ny])),
    (e.stateNode = null),
    (e.return = null),
    (e.dependencies = null),
    (e.memoizedProps = null),
    (e.memoizedState = null),
    (e.pendingProps = null),
    (e.stateNode = null),
    (e.updateQueue = null);
}
function A1(e) {
  return e.tag === 5 || e.tag === 3 || e.tag === 4;
}
function Nf(e) {
  e: for (;;) {
    for (; e.sibling === null; ) {
      if (e.return === null || A1(e.return)) return null;
      e = e.return;
    }
    for (
      e.sibling.return = e.return, e = e.sibling;
      e.tag !== 5 && e.tag !== 6 && e.tag !== 18;

    ) {
      if (e.flags & 2 || e.child === null || e.tag === 4) continue e;
      (e.child.return = e), (e = e.child);
    }
    if (!(e.flags & 2)) return e.stateNode;
  }
}
function ku(e, t, n) {
  var r = e.tag;
  if (r === 5 || r === 6)
    (e = e.stateNode),
      t
        ? n.nodeType === 8
          ? n.parentNode.insertBefore(e, t)
          : n.insertBefore(e, t)
        : (n.nodeType === 8
            ? ((t = n.parentNode), t.insertBefore(e, n))
            : ((t = n), t.appendChild(e)),
          (n = n._reactRootContainer),
          n != null || t.onclick !== null || (t.onclick = Bo));
  else if (r !== 4 && ((e = e.child), e !== null))
    for (ku(e, t, n), e = e.sibling; e !== null; ) ku(e, t, n), (e = e.sibling);
}
function Mu(e, t, n) {
  var r = e.tag;
  if (r === 5 || r === 6)
    (e = e.stateNode), t ? n.insertBefore(e, t) : n.appendChild(e);
  else if (r !== 4 && ((e = e.child), e !== null))
    for (Mu(e, t, n), e = e.sibling; e !== null; ) Mu(e, t, n), (e = e.sibling);
}
var _e = null,
  St = !1;
function fn(e, t, n) {
  for (n = n.child; n !== null; ) k1(e, t, n), (n = n.sibling);
}
function k1(e, t, n) {
  if (Rt && typeof Rt.onCommitFiberUnmount == "function")
    try {
      Rt.onCommitFiberUnmount(gl, n);
    } catch {}
  switch (n.tag) {
    case 5:
      Le || Ir(n, t);
    case 6:
      var r = _e,
        i = St;
      (_e = null),
        fn(e, t, n),
        (_e = r),
        (St = i),
        _e !== null &&
          (St
            ? ((e = _e),
              (n = n.stateNode),
              e.nodeType === 8 ? e.parentNode.removeChild(n) : e.removeChild(n))
            : _e.removeChild(n.stateNode));
      break;
    case 18:
      _e !== null &&
        (St
          ? ((e = _e),
            (n = n.stateNode),
            e.nodeType === 8
              ? aa(e.parentNode, n)
              : e.nodeType === 1 && aa(e, n),
            ds(e))
          : aa(_e, n.stateNode));
      break;
    case 4:
      (r = _e),
        (i = St),
        (_e = n.stateNode.containerInfo),
        (St = !0),
        fn(e, t, n),
        (_e = r),
        (St = i);
      break;
    case 0:
    case 11:
    case 14:
    case 15:
      if (
        !Le &&
        ((r = n.updateQueue), r !== null && ((r = r.lastEffect), r !== null))
      ) {
        i = r = r.next;
        do {
          var s = i,
            o = s.destroy;
          (s = s.tag),
            o !== void 0 && (s & 2 || s & 4) && Pu(n, t, o),
            (i = i.next);
        } while (i !== r);
      }
      fn(e, t, n);
      break;
    case 1:
      if (
        !Le &&
        (Ir(n, t),
        (r = n.stateNode),
        typeof r.componentWillUnmount == "function")
      )
        try {
          (r.props = n.memoizedProps),
            (r.state = n.memoizedState),
            r.componentWillUnmount();
        } catch (u) {
          de(n, t, u);
        }
      fn(e, t, n);
      break;
    case 21:
      fn(e, t, n);
      break;
    case 22:
      n.mode & 1
        ? ((Le = (r = Le) || n.memoizedState !== null), fn(e, t, n), (Le = r))
        : fn(e, t, n);
      break;
    default:
      fn(e, t, n);
  }
}
function jf(e) {
  var t = e.updateQueue;
  if (t !== null) {
    e.updateQueue = null;
    var n = e.stateNode;
    n === null && (n = e.stateNode = new Jy()),
      t.forEach(function (r) {
        var i = uw.bind(null, e, r);
        n.has(r) || (n.add(r), r.then(i, i));
      });
  }
}
function wt(e, t) {
  var n = t.deletions;
  if (n !== null)
    for (var r = 0; r < n.length; r++) {
      var i = n[r];
      try {
        var s = e,
          o = t,
          u = o;
        e: for (; u !== null; ) {
          switch (u.tag) {
            case 5:
              (_e = u.stateNode), (St = !1);
              break e;
            case 3:
              (_e = u.stateNode.containerInfo), (St = !0);
              break e;
            case 4:
              (_e = u.stateNode.containerInfo), (St = !0);
              break e;
          }
          u = u.return;
        }
        if (_e === null) throw Error(b(160));
        k1(s, o, i), (_e = null), (St = !1);
        var a = i.alternate;
        a !== null && (a.return = null), (i.return = null);
      } catch (d) {
        de(i, t, d);
      }
    }
  if (t.subtreeFlags & 12854)
    for (t = t.child; t !== null; ) M1(t, e), (t = t.sibling);
}
function M1(e, t) {
  var n = e.alternate,
    r = e.flags;
  switch (e.tag) {
    case 0:
    case 11:
    case 14:
    case 15:
      if ((wt(t, e), Lt(e), r & 4)) {
        try {
          qi(3, e, e.return), Tl(3, e);
        } catch (v) {
          de(e, e.return, v);
        }
        try {
          qi(5, e, e.return);
        } catch (v) {
          de(e, e.return, v);
        }
      }
      break;
    case 1:
      wt(t, e), Lt(e), r & 512 && n !== null && Ir(n, n.return);
      break;
    case 5:
      if (
        (wt(t, e),
        Lt(e),
        r & 512 && n !== null && Ir(n, n.return),
        e.flags & 32)
      ) {
        var i = e.stateNode;
        try {
          ls(i, "");
        } catch (v) {
          de(e, e.return, v);
        }
      }
      if (r & 4 && ((i = e.stateNode), i != null)) {
        var s = e.memoizedProps,
          o = n !== null ? n.memoizedProps : s,
          u = e.type,
          a = e.updateQueue;
        if (((e.updateQueue = null), a !== null))
          try {
            u === "input" && s.type === "radio" && s.name != null && Zh(i, s),
              Ja(u, o);
            var d = Ja(u, s);
            for (o = 0; o < a.length; o += 2) {
              var p = a[o],
                l = a[o + 1];
              p === "style"
                ? tm(i, l)
                : p === "dangerouslySetInnerHTML"
                ? Jh(i, l)
                : p === "children"
                ? ls(i, l)
                : uc(i, p, l, d);
            }
            switch (u) {
              case "input":
                Ya(i, s);
                break;
              case "textarea":
                Qh(i, s);
                break;
              case "select":
                var c = i._wrapperState.wasMultiple;
                i._wrapperState.wasMultiple = !!s.multiple;
                var f = s.value;
                f != null
                  ? $r(i, !!s.multiple, f, !1)
                  : c !== !!s.multiple &&
                    (s.defaultValue != null
                      ? $r(i, !!s.multiple, s.defaultValue, !0)
                      : $r(i, !!s.multiple, s.multiple ? [] : "", !1));
            }
            i[gs] = s;
          } catch (v) {
            de(e, e.return, v);
          }
      }
      break;
    case 6:
      if ((wt(t, e), Lt(e), r & 4)) {
        if (e.stateNode === null) throw Error(b(162));
        (i = e.stateNode), (s = e.memoizedProps);
        try {
          i.nodeValue = s;
        } catch (v) {
          de(e, e.return, v);
        }
      }
      break;
    case 3:
      if (
        (wt(t, e), Lt(e), r & 4 && n !== null && n.memoizedState.isDehydrated)
      )
        try {
          ds(t.containerInfo);
        } catch (v) {
          de(e, e.return, v);
        }
      break;
    case 4:
      wt(t, e), Lt(e);
      break;
    case 13:
      wt(t, e),
        Lt(e),
        (i = e.child),
        i.flags & 8192 &&
          ((s = i.memoizedState !== null),
          (i.stateNode.isHidden = s),
          !s ||
            (i.alternate !== null && i.alternate.memoizedState !== null) ||
            (Hc = pe())),
        r & 4 && jf(e);
      break;
    case 22:
      if (
        ((p = n !== null && n.memoizedState !== null),
        e.mode & 1 ? ((Le = (d = Le) || p), wt(t, e), (Le = d)) : wt(t, e),
        Lt(e),
        r & 8192)
      ) {
        if (
          ((d = e.memoizedState !== null),
          (e.stateNode.isHidden = d) && !p && e.mode & 1)
        )
          for (j = e, p = e.child; p !== null; ) {
            for (l = j = p; j !== null; ) {
              switch (((c = j), (f = c.child), c.tag)) {
                case 0:
                case 11:
                case 14:
                case 15:
                  qi(4, c, c.return);
                  break;
                case 1:
                  Ir(c, c.return);
                  var m = c.stateNode;
                  if (typeof m.componentWillUnmount == "function") {
                    (r = c), (n = c.return);
                    try {
                      (t = r),
                        (m.props = t.memoizedProps),
                        (m.state = t.memoizedState),
                        m.componentWillUnmount();
                    } catch (v) {
                      de(r, n, v);
                    }
                  }
                  break;
                case 5:
                  Ir(c, c.return);
                  break;
                case 22:
                  if (c.memoizedState !== null) {
                    zf(l);
                    continue;
                  }
              }
              f !== null ? ((f.return = c), (j = f)) : zf(l);
            }
            p = p.sibling;
          }
        e: for (p = null, l = e; ; ) {
          if (l.tag === 5) {
            if (p === null) {
              p = l;
              try {
                (i = l.stateNode),
                  d
                    ? ((s = i.style),
                      typeof s.setProperty == "function"
                        ? s.setProperty("display", "none", "important")
                        : (s.display = "none"))
                    : ((u = l.stateNode),
                      (a = l.memoizedProps.style),
                      (o =
                        a != null && a.hasOwnProperty("display")
                          ? a.display
                          : null),
                      (u.style.display = em("display", o)));
              } catch (v) {
                de(e, e.return, v);
              }
            }
          } else if (l.tag === 6) {
            if (p === null)
              try {
                l.stateNode.nodeValue = d ? "" : l.memoizedProps;
              } catch (v) {
                de(e, e.return, v);
              }
          } else if (
            ((l.tag !== 22 && l.tag !== 23) ||
              l.memoizedState === null ||
              l === e) &&
            l.child !== null
          ) {
            (l.child.return = l), (l = l.child);
            continue;
          }
          if (l === e) break e;
          for (; l.sibling === null; ) {
            if (l.return === null || l.return === e) break e;
            p === l && (p = null), (l = l.return);
          }
          p === l && (p = null), (l.sibling.return = l.return), (l = l.sibling);
        }
      }
      break;
    case 19:
      wt(t, e), Lt(e), r & 4 && jf(e);
      break;
    case 21:
      break;
    default:
      wt(t, e), Lt(e);
  }
}
function Lt(e) {
  var t = e.flags;
  if (t & 2) {
    try {
      e: {
        for (var n = e.return; n !== null; ) {
          if (A1(n)) {
            var r = n;
            break e;
          }
          n = n.return;
        }
        throw Error(b(160));
      }
      switch (r.tag) {
        case 5:
          var i = r.stateNode;
          r.flags & 32 && (ls(i, ""), (r.flags &= -33));
          var s = Nf(e);
          Mu(e, s, i);
          break;
        case 3:
        case 4:
          var o = r.stateNode.containerInfo,
            u = Nf(e);
          ku(e, u, o);
          break;
        default:
          throw Error(b(161));
      }
    } catch (a) {
      de(e, e.return, a);
    }
    e.flags &= -3;
  }
  t & 4096 && (e.flags &= -4097);
}
function tw(e, t, n) {
  (j = e), b1(e);
}
function b1(e, t, n) {
  for (var r = (e.mode & 1) !== 0; j !== null; ) {
    var i = j,
      s = i.child;
    if (i.tag === 22 && r) {
      var o = i.memoizedState !== null || oo;
      if (!o) {
        var u = i.alternate,
          a = (u !== null && u.memoizedState !== null) || Le;
        u = oo;
        var d = Le;
        if (((oo = o), (Le = a) && !d))
          for (j = i; j !== null; )
            (o = j),
              (a = o.child),
              o.tag === 22 && o.memoizedState !== null
                ? Bf(i)
                : a !== null
                ? ((a.return = o), (j = a))
                : Bf(i);
        for (; s !== null; ) (j = s), b1(s), (s = s.sibling);
        (j = i), (oo = u), (Le = d);
      }
      Ff(e);
    } else
      i.subtreeFlags & 8772 && s !== null ? ((s.return = i), (j = s)) : Ff(e);
  }
}
function Ff(e) {
  for (; j !== null; ) {
    var t = j;
    if (t.flags & 8772) {
      var n = t.alternate;
      try {
        if (t.flags & 8772)
          switch (t.tag) {
            case 0:
            case 11:
            case 15:
              Le || Tl(5, t);
              break;
            case 1:
              var r = t.stateNode;
              if (t.flags & 4 && !Le)
                if (n === null) r.componentDidMount();
                else {
                  var i =
                    t.elementType === t.type
                      ? n.memoizedProps
                      : xt(t.type, n.memoizedProps);
                  r.componentDidUpdate(
                    i,
                    n.memoizedState,
                    r.__reactInternalSnapshotBeforeUpdate
                  );
                }
              var s = t.updateQueue;
              s !== null && _f(t, s, r);
              break;
            case 3:
              var o = t.updateQueue;
              if (o !== null) {
                if (((n = null), t.child !== null))
                  switch (t.child.tag) {
                    case 5:
                      n = t.child.stateNode;
                      break;
                    case 1:
                      n = t.child.stateNode;
                  }
                _f(t, o, n);
              }
              break;
            case 5:
              var u = t.stateNode;
              if (n === null && t.flags & 4) {
                n = u;
                var a = t.memoizedProps;
                switch (t.type) {
                  case "button":
                  case "input":
                  case "select":
                  case "textarea":
                    a.autoFocus && n.focus();
                    break;
                  case "img":
                    a.src && (n.src = a.src);
                }
              }
              break;
            case 6:
              break;
            case 4:
              break;
            case 12:
              break;
            case 13:
              if (t.memoizedState === null) {
                var d = t.alternate;
                if (d !== null) {
                  var p = d.memoizedState;
                  if (p !== null) {
                    var l = p.dehydrated;
                    l !== null && ds(l);
                  }
                }
              }
              break;
            case 19:
            case 17:
            case 21:
            case 22:
            case 23:
            case 25:
              break;
            default:
              throw Error(b(163));
          }
        Le || (t.flags & 512 && Au(t));
      } catch (c) {
        de(t, t.return, c);
      }
    }
    if (t === e) {
      j = null;
      break;
    }
    if (((n = t.sibling), n !== null)) {
      (n.return = t.return), (j = n);
      break;
    }
    j = t.return;
  }
}
function zf(e) {
  for (; j !== null; ) {
    var t = j;
    if (t === e) {
      j = null;
      break;
    }
    var n = t.sibling;
    if (n !== null) {
      (n.return = t.return), (j = n);
      break;
    }
    j = t.return;
  }
}
function Bf(e) {
  for (; j !== null; ) {
    var t = j;
    try {
      switch (t.tag) {
        case 0:
        case 11:
        case 15:
          var n = t.return;
          try {
            Tl(4, t);
          } catch (a) {
            de(t, n, a);
          }
          break;
        case 1:
          var r = t.stateNode;
          if (typeof r.componentDidMount == "function") {
            var i = t.return;
            try {
              r.componentDidMount();
            } catch (a) {
              de(t, i, a);
            }
          }
          var s = t.return;
          try {
            Au(t);
          } catch (a) {
            de(t, s, a);
          }
          break;
        case 5:
          var o = t.return;
          try {
            Au(t);
          } catch (a) {
            de(t, o, a);
          }
      }
    } catch (a) {
      de(t, t.return, a);
    }
    if (t === e) {
      j = null;
      break;
    }
    var u = t.sibling;
    if (u !== null) {
      (u.return = t.return), (j = u);
      break;
    }
    j = t.return;
  }
}
var nw = Math.ceil,
  qo = ln.ReactCurrentDispatcher,
  zc = ln.ReactCurrentOwner,
  pt = ln.ReactCurrentBatchConfig,
  X = 0,
  Se = null,
  me = null,
  Te = 0,
  Ye = 0,
  Nr = Nn(0),
  ye = 0,
  _s = null,
  ar = 0,
  El = 0,
  Bc = 0,
  Ji = null,
  Be = null,
  Hc = 0,
  ri = 1 / 0,
  $t = null,
  Jo = !1,
  bu = null,
  An = null,
  lo = !1,
  xn = null,
  el = 0,
  es = 0,
  Lu = null,
  Po = -1,
  Ao = 0;
function Ne() {
  return X & 6 ? pe() : Po !== -1 ? Po : (Po = pe());
}
function kn(e) {
  return e.mode & 1
    ? X & 2 && Te !== 0
      ? Te & -Te
      : Fy.transition !== null
      ? (Ao === 0 && (Ao = pm()), Ao)
      : ((e = q),
        e !== 0 || ((e = window.event), (e = e === void 0 ? 16 : xm(e.type))),
        e)
    : 1;
}
function Tt(e, t, n, r) {
  if (50 < es) throw ((es = 0), (Lu = null), Error(b(185)));
  Ls(e, n, r),
    (!(X & 2) || e !== Se) &&
      (e === Se && (!(X & 2) && (El |= n), ye === 4 && yn(e, Te)),
      We(e, r),
      n === 1 && X === 0 && !(t.mode & 1) && ((ri = pe() + 500), Sl && jn()));
}
function We(e, t) {
  var n = e.callbackNode;
  Fv(e, t);
  var r = No(e, e === Se ? Te : 0);
  if (r === 0)
    n !== null && Xd(n), (e.callbackNode = null), (e.callbackPriority = 0);
  else if (((t = r & -r), e.callbackPriority !== t)) {
    if ((n != null && Xd(n), t === 1))
      e.tag === 0 ? jy(Hf.bind(null, e)) : Fm(Hf.bind(null, e)),
        Ry(function () {
          !(X & 6) && jn();
        }),
        (n = null);
    else {
      switch (hm(r)) {
        case 1:
          n = hc;
          break;
        case 4:
          n = dm;
          break;
        case 16:
          n = Io;
          break;
        case 536870912:
          n = fm;
          break;
        default:
          n = Io;
      }
      n = j1(n, L1.bind(null, e));
    }
    (e.callbackPriority = t), (e.callbackNode = n);
  }
}
function L1(e, t) {
  if (((Po = -1), (Ao = 0), X & 6)) throw Error(b(327));
  var n = e.callbackNode;
  if (Yr() && e.callbackNode !== n) return null;
  var r = No(e, e === Se ? Te : 0);
  if (r === 0) return null;
  if (r & 30 || r & e.expiredLanes || t) t = tl(e, r);
  else {
    t = r;
    var i = X;
    X |= 2;
    var s = D1();
    (Se !== e || Te !== t) && (($t = null), (ri = pe() + 500), tr(e, t));
    do
      try {
        sw();
        break;
      } catch (u) {
        O1(e, u);
      }
    while (1);
    Ac(),
      (qo.current = s),
      (X = i),
      me !== null ? (t = 0) : ((Se = null), (Te = 0), (t = ye));
  }
  if (t !== 0) {
    if (
      (t === 2 && ((i = iu(e)), i !== 0 && ((r = i), (t = Ou(e, i)))), t === 1)
    )
      throw ((n = _s), tr(e, 0), yn(e, r), We(e, pe()), n);
    if (t === 6) yn(e, r);
    else {
      if (
        ((i = e.current.alternate),
        !(r & 30) &&
          !rw(i) &&
          ((t = tl(e, r)),
          t === 2 && ((s = iu(e)), s !== 0 && ((r = s), (t = Ou(e, s)))),
          t === 1))
      )
        throw ((n = _s), tr(e, 0), yn(e, r), We(e, pe()), n);
      switch (((e.finishedWork = i), (e.finishedLanes = r), t)) {
        case 0:
        case 1:
          throw Error(b(345));
        case 2:
          Yn(e, Be, $t);
          break;
        case 3:
          if (
            (yn(e, r), (r & 130023424) === r && ((t = Hc + 500 - pe()), 10 < t))
          ) {
            if (No(e, 0) !== 0) break;
            if (((i = e.suspendedLanes), (i & r) !== r)) {
              Ne(), (e.pingedLanes |= e.suspendedLanes & i);
              break;
            }
            e.timeoutHandle = fu(Yn.bind(null, e, Be, $t), t);
            break;
          }
          Yn(e, Be, $t);
          break;
        case 4:
          if ((yn(e, r), (r & 4194240) === r)) break;
          for (t = e.eventTimes, i = -1; 0 < r; ) {
            var o = 31 - Ct(r);
            (s = 1 << o), (o = t[o]), o > i && (i = o), (r &= ~s);
          }
          if (
            ((r = i),
            (r = pe() - r),
            (r =
              (120 > r
                ? 120
                : 480 > r
                ? 480
                : 1080 > r
                ? 1080
                : 1920 > r
                ? 1920
                : 3e3 > r
                ? 3e3
                : 4320 > r
                ? 4320
                : 1960 * nw(r / 1960)) - r),
            10 < r)
          ) {
            e.timeoutHandle = fu(Yn.bind(null, e, Be, $t), r);
            break;
          }
          Yn(e, Be, $t);
          break;
        case 5:
          Yn(e, Be, $t);
          break;
        default:
          throw Error(b(329));
      }
    }
  }
  return We(e, pe()), e.callbackNode === n ? L1.bind(null, e) : null;
}
function Ou(e, t) {
  var n = Ji;
  return (
    e.current.memoizedState.isDehydrated && (tr(e, t).flags |= 256),
    (e = tl(e, t)),
    e !== 2 && ((t = Be), (Be = n), t !== null && Du(t)),
    e
  );
}
function Du(e) {
  Be === null ? (Be = e) : Be.push.apply(Be, e);
}
function rw(e) {
  for (var t = e; ; ) {
    if (t.flags & 16384) {
      var n = t.updateQueue;
      if (n !== null && ((n = n.stores), n !== null))
        for (var r = 0; r < n.length; r++) {
          var i = n[r],
            s = i.getSnapshot;
          i = i.value;
          try {
            if (!Et(s(), i)) return !1;
          } catch {
            return !1;
          }
        }
    }
    if (((n = t.child), t.subtreeFlags & 16384 && n !== null))
      (n.return = t), (t = n);
    else {
      if (t === e) break;
      for (; t.sibling === null; ) {
        if (t.return === null || t.return === e) return !0;
        t = t.return;
      }
      (t.sibling.return = t.return), (t = t.sibling);
    }
  }
  return !0;
}
function yn(e, t) {
  for (
    t &= ~Bc,
      t &= ~El,
      e.suspendedLanes |= t,
      e.pingedLanes &= ~t,
      e = e.expirationTimes;
    0 < t;

  ) {
    var n = 31 - Ct(t),
      r = 1 << n;
    (e[n] = -1), (t &= ~r);
  }
}
function Hf(e) {
  if (X & 6) throw Error(b(327));
  Yr();
  var t = No(e, 0);
  if (!(t & 1)) return We(e, pe()), null;
  var n = tl(e, t);
  if (e.tag !== 0 && n === 2) {
    var r = iu(e);
    r !== 0 && ((t = r), (n = Ou(e, r)));
  }
  if (n === 1) throw ((n = _s), tr(e, 0), yn(e, t), We(e, pe()), n);
  if (n === 6) throw Error(b(345));
  return (
    (e.finishedWork = e.current.alternate),
    (e.finishedLanes = t),
    Yn(e, Be, $t),
    We(e, pe()),
    null
  );
}
function $c(e, t) {
  var n = X;
  X |= 1;
  try {
    return e(t);
  } finally {
    (X = n), X === 0 && ((ri = pe() + 500), Sl && jn());
  }
}
function ur(e) {
  xn !== null && xn.tag === 0 && !(X & 6) && Yr();
  var t = X;
  X |= 1;
  var n = pt.transition,
    r = q;
  try {
    if (((pt.transition = null), (q = 1), e)) return e();
  } finally {
    (q = r), (pt.transition = n), (X = t), !(X & 6) && jn();
  }
}
function Gc() {
  (Ye = Nr.current), re(Nr);
}
function tr(e, t) {
  (e.finishedWork = null), (e.finishedLanes = 0);
  var n = e.timeoutHandle;
  if ((n !== -1 && ((e.timeoutHandle = -1), Dy(n)), me !== null))
    for (n = me.return; n !== null; ) {
      var r = n;
      switch ((Tc(r), r.tag)) {
        case 1:
          (r = r.type.childContextTypes), r != null && Ho();
          break;
        case 3:
          ti(), re($e), re(De), Dc();
          break;
        case 5:
          Oc(r);
          break;
        case 4:
          ti();
          break;
        case 13:
          re(le);
          break;
        case 19:
          re(le);
          break;
        case 10:
          kc(r.type._context);
          break;
        case 22:
        case 23:
          Gc();
      }
      n = n.return;
    }
  if (
    ((Se = e),
    (me = e = Mn(e.current, null)),
    (Te = Ye = t),
    (ye = 0),
    (_s = null),
    (Bc = El = ar = 0),
    (Be = Ji = null),
    qn !== null)
  ) {
    for (t = 0; t < qn.length; t++)
      if (((n = qn[t]), (r = n.interleaved), r !== null)) {
        n.interleaved = null;
        var i = r.next,
          s = n.pending;
        if (s !== null) {
          var o = s.next;
          (s.next = i), (r.next = o);
        }
        n.pending = r;
      }
    qn = null;
  }
  return e;
}
function O1(e, t) {
  do {
    var n = me;
    try {
      if ((Ac(), (Co.current = Qo), Zo)) {
        for (var r = ue.memoizedState; r !== null; ) {
          var i = r.queue;
          i !== null && (i.pending = null), (r = r.next);
        }
        Zo = !1;
      }
      if (
        ((lr = 0),
        (xe = ve = ue = null),
        (Qi = !1),
        (ws = 0),
        (zc.current = null),
        n === null || n.return === null)
      ) {
        (ye = 1), (_s = t), (me = null);
        break;
      }
      e: {
        var s = e,
          o = n.return,
          u = n,
          a = t;
        if (
          ((t = Te),
          (u.flags |= 32768),
          a !== null && typeof a == "object" && typeof a.then == "function")
        ) {
          var d = a,
            p = u,
            l = p.tag;
          if (!(p.mode & 1) && (l === 0 || l === 11 || l === 15)) {
            var c = p.alternate;
            c
              ? ((p.updateQueue = c.updateQueue),
                (p.memoizedState = c.memoizedState),
                (p.lanes = c.lanes))
              : ((p.updateQueue = null), (p.memoizedState = null));
          }
          var f = Mf(o);
          if (f !== null) {
            (f.flags &= -257),
              bf(f, o, u, s, t),
              f.mode & 1 && kf(s, d, t),
              (t = f),
              (a = d);
            var m = t.updateQueue;
            if (m === null) {
              var v = new Set();
              v.add(a), (t.updateQueue = v);
            } else m.add(a);
            break e;
          } else {
            if (!(t & 1)) {
              kf(s, d, t), Wc();
              break e;
            }
            a = Error(b(426));
          }
        } else if (se && u.mode & 1) {
          var w = Mf(o);
          if (w !== null) {
            !(w.flags & 65536) && (w.flags |= 256),
              bf(w, o, u, s, t),
              Ec(ni(a, u));
            break e;
          }
        }
        (s = a = ni(a, u)),
          ye !== 4 && (ye = 2),
          Ji === null ? (Ji = [s]) : Ji.push(s),
          (s = o);
        do {
          switch (s.tag) {
            case 3:
              (s.flags |= 65536), (t &= -t), (s.lanes |= t);
              var h = m1(s, a, t);
              Sf(s, h);
              break e;
            case 1:
              u = a;
              var g = s.type,
                y = s.stateNode;
              if (
                !(s.flags & 128) &&
                (typeof g.getDerivedStateFromError == "function" ||
                  (y !== null &&
                    typeof y.componentDidCatch == "function" &&
                    (An === null || !An.has(y))))
              ) {
                (s.flags |= 65536), (t &= -t), (s.lanes |= t);
                var x = g1(s, u, t);
                Sf(s, x);
                break e;
              }
          }
          s = s.return;
        } while (s !== null);
      }
      V1(n);
    } catch (S) {
      (t = S), me === n && n !== null && (me = n = n.return);
      continue;
    }
    break;
  } while (1);
}
function D1() {
  var e = qo.current;
  return (qo.current = Qo), e === null ? Qo : e;
}
function Wc() {
  (ye === 0 || ye === 3 || ye === 2) && (ye = 4),
    Se === null || (!(ar & 268435455) && !(El & 268435455)) || yn(Se, Te);
}
function tl(e, t) {
  var n = X;
  X |= 2;
  var r = D1();
  (Se !== e || Te !== t) && (($t = null), tr(e, t));
  do
    try {
      iw();
      break;
    } catch (i) {
      O1(e, i);
    }
  while (1);
  if ((Ac(), (X = n), (qo.current = r), me !== null)) throw Error(b(261));
  return (Se = null), (Te = 0), ye;
}
function iw() {
  for (; me !== null; ) R1(me);
}
function sw() {
  for (; me !== null && !bv(); ) R1(me);
}
function R1(e) {
  var t = N1(e.alternate, e, Ye);
  (e.memoizedProps = e.pendingProps),
    t === null ? V1(e) : (me = t),
    (zc.current = null);
}
function V1(e) {
  var t = e;
  do {
    var n = t.alternate;
    if (((e = t.return), t.flags & 32768)) {
      if (((n = qy(n, t)), n !== null)) {
        (n.flags &= 32767), (me = n);
        return;
      }
      if (e !== null)
        (e.flags |= 32768), (e.subtreeFlags = 0), (e.deletions = null);
      else {
        (ye = 6), (me = null);
        return;
      }
    } else if (((n = Qy(n, t, Ye)), n !== null)) {
      me = n;
      return;
    }
    if (((t = t.sibling), t !== null)) {
      me = t;
      return;
    }
    me = t = e;
  } while (t !== null);
  ye === 0 && (ye = 5);
}
function Yn(e, t, n) {
  var r = q,
    i = pt.transition;
  try {
    (pt.transition = null), (q = 1), ow(e, t, n, r);
  } finally {
    (pt.transition = i), (q = r);
  }
  return null;
}
function ow(e, t, n, r) {
  do Yr();
  while (xn !== null);
  if (X & 6) throw Error(b(327));
  n = e.finishedWork;
  var i = e.finishedLanes;
  if (n === null) return null;
  if (((e.finishedWork = null), (e.finishedLanes = 0), n === e.current))
    throw Error(b(177));
  (e.callbackNode = null), (e.callbackPriority = 0);
  var s = n.lanes | n.childLanes;
  if (
    (zv(e, s),
    e === Se && ((me = Se = null), (Te = 0)),
    (!(n.subtreeFlags & 2064) && !(n.flags & 2064)) ||
      lo ||
      ((lo = !0),
      j1(Io, function () {
        return Yr(), null;
      })),
    (s = (n.flags & 15990) !== 0),
    n.subtreeFlags & 15990 || s)
  ) {
    (s = pt.transition), (pt.transition = null);
    var o = q;
    q = 1;
    var u = X;
    (X |= 4),
      (zc.current = null),
      ew(e, n),
      M1(n, e),
      Py(cu),
      (jo = !!uu),
      (cu = uu = null),
      (e.current = n),
      tw(n),
      Lv(),
      (X = u),
      (q = o),
      (pt.transition = s);
  } else e.current = n;
  if (
    (lo && ((lo = !1), (xn = e), (el = i)),
    (s = e.pendingLanes),
    s === 0 && (An = null),
    Rv(n.stateNode),
    We(e, pe()),
    t !== null)
  )
    for (r = e.onRecoverableError, n = 0; n < t.length; n++)
      (i = t[n]), r(i.value, { componentStack: i.stack, digest: i.digest });
  if (Jo) throw ((Jo = !1), (e = bu), (bu = null), e);
  return (
    el & 1 && e.tag !== 0 && Yr(),
    (s = e.pendingLanes),
    s & 1 ? (e === Lu ? es++ : ((es = 0), (Lu = e))) : (es = 0),
    jn(),
    null
  );
}
function Yr() {
  if (xn !== null) {
    var e = hm(el),
      t = pt.transition,
      n = q;
    try {
      if (((pt.transition = null), (q = 16 > e ? 16 : e), xn === null))
        var r = !1;
      else {
        if (((e = xn), (xn = null), (el = 0), X & 6)) throw Error(b(331));
        var i = X;
        for (X |= 4, j = e.current; j !== null; ) {
          var s = j,
            o = s.child;
          if (j.flags & 16) {
            var u = s.deletions;
            if (u !== null) {
              for (var a = 0; a < u.length; a++) {
                var d = u[a];
                for (j = d; j !== null; ) {
                  var p = j;
                  switch (p.tag) {
                    case 0:
                    case 11:
                    case 15:
                      qi(8, p, s);
                  }
                  var l = p.child;
                  if (l !== null) (l.return = p), (j = l);
                  else
                    for (; j !== null; ) {
                      p = j;
                      var c = p.sibling,
                        f = p.return;
                      if ((P1(p), p === d)) {
                        j = null;
                        break;
                      }
                      if (c !== null) {
                        (c.return = f), (j = c);
                        break;
                      }
                      j = f;
                    }
                }
              }
              var m = s.alternate;
              if (m !== null) {
                var v = m.child;
                if (v !== null) {
                  m.child = null;
                  do {
                    var w = v.sibling;
                    (v.sibling = null), (v = w);
                  } while (v !== null);
                }
              }
              j = s;
            }
          }
          if (s.subtreeFlags & 2064 && o !== null) (o.return = s), (j = o);
          else
            e: for (; j !== null; ) {
              if (((s = j), s.flags & 2048))
                switch (s.tag) {
                  case 0:
                  case 11:
                  case 15:
                    qi(9, s, s.return);
                }
              var h = s.sibling;
              if (h !== null) {
                (h.return = s.return), (j = h);
                break e;
              }
              j = s.return;
            }
        }
        var g = e.current;
        for (j = g; j !== null; ) {
          o = j;
          var y = o.child;
          if (o.subtreeFlags & 2064 && y !== null) (y.return = o), (j = y);
          else
            e: for (o = g; j !== null; ) {
              if (((u = j), u.flags & 2048))
                try {
                  switch (u.tag) {
                    case 0:
                    case 11:
                    case 15:
                      Tl(9, u);
                  }
                } catch (S) {
                  de(u, u.return, S);
                }
              if (u === o) {
                j = null;
                break e;
              }
              var x = u.sibling;
              if (x !== null) {
                (x.return = u.return), (j = x);
                break e;
              }
              j = u.return;
            }
        }
        if (
          ((X = i), jn(), Rt && typeof Rt.onPostCommitFiberRoot == "function")
        )
          try {
            Rt.onPostCommitFiberRoot(gl, e);
          } catch {}
        r = !0;
      }
      return r;
    } finally {
      (q = n), (pt.transition = t);
    }
  }
  return !1;
}
function $f(e, t, n) {
  (t = ni(n, t)),
    (t = m1(e, t, 1)),
    (e = Pn(e, t, 1)),
    (t = Ne()),
    e !== null && (Ls(e, 1, t), We(e, t));
}
function de(e, t, n) {
  if (e.tag === 3) $f(e, e, n);
  else
    for (; t !== null; ) {
      if (t.tag === 3) {
        $f(t, e, n);
        break;
      } else if (t.tag === 1) {
        var r = t.stateNode;
        if (
          typeof t.type.getDerivedStateFromError == "function" ||
          (typeof r.componentDidCatch == "function" &&
            (An === null || !An.has(r)))
        ) {
          (e = ni(n, e)),
            (e = g1(t, e, 1)),
            (t = Pn(t, e, 1)),
            (e = Ne()),
            t !== null && (Ls(t, 1, e), We(t, e));
          break;
        }
      }
      t = t.return;
    }
}
function lw(e, t, n) {
  var r = e.pingCache;
  r !== null && r.delete(t),
    (t = Ne()),
    (e.pingedLanes |= e.suspendedLanes & n),
    Se === e &&
      (Te & n) === n &&
      (ye === 4 || (ye === 3 && (Te & 130023424) === Te && 500 > pe() - Hc)
        ? tr(e, 0)
        : (Bc |= n)),
    We(e, t);
}
function I1(e, t) {
  t === 0 &&
    (e.mode & 1
      ? ((t = Qs), (Qs <<= 1), !(Qs & 130023424) && (Qs = 4194304))
      : (t = 1));
  var n = Ne();
  (e = rn(e, t)), e !== null && (Ls(e, t, n), We(e, n));
}
function aw(e) {
  var t = e.memoizedState,
    n = 0;
  t !== null && (n = t.retryLane), I1(e, n);
}
function uw(e, t) {
  var n = 0;
  switch (e.tag) {
    case 13:
      var r = e.stateNode,
        i = e.memoizedState;
      i !== null && (n = i.retryLane);
      break;
    case 19:
      r = e.stateNode;
      break;
    default:
      throw Error(b(314));
  }
  r !== null && r.delete(t), I1(e, n);
}
var N1;
N1 = function (e, t, n) {
  if (e !== null)
    if (e.memoizedProps !== t.pendingProps || $e.current) He = !0;
    else {
      if (!(e.lanes & n) && !(t.flags & 128)) return (He = !1), Zy(e, t, n);
      He = !!(e.flags & 131072);
    }
  else (He = !1), se && t.flags & 1048576 && zm(t, Wo, t.index);
  switch (((t.lanes = 0), t.tag)) {
    case 2:
      var r = t.type;
      Eo(e, t), (e = t.pendingProps);
      var i = qr(t, De.current);
      Kr(t, n), (i = Vc(null, t, r, e, i, n));
      var s = Ic();
      return (
        (t.flags |= 1),
        typeof i == "object" &&
        i !== null &&
        typeof i.render == "function" &&
        i.$$typeof === void 0
          ? ((t.tag = 1),
            (t.memoizedState = null),
            (t.updateQueue = null),
            Ge(r) ? ((s = !0), $o(t)) : (s = !1),
            (t.memoizedState =
              i.state !== null && i.state !== void 0 ? i.state : null),
            bc(t),
            (i.updater = _l),
            (t.stateNode = i),
            (i._reactInternals = t),
            wu(t, r, e, n),
            (t = _u(null, t, r, !0, s, n)))
          : ((t.tag = 0), se && s && Cc(t), Ie(null, t, i, n), (t = t.child)),
        t
      );
    case 16:
      r = t.elementType;
      e: {
        switch (
          (Eo(e, t),
          (e = t.pendingProps),
          (i = r._init),
          (r = i(r._payload)),
          (t.type = r),
          (i = t.tag = dw(r)),
          (e = xt(r, e)),
          i)
        ) {
          case 0:
            t = Su(null, t, r, e, n);
            break e;
          case 1:
            t = Df(null, t, r, e, n);
            break e;
          case 11:
            t = Lf(null, t, r, e, n);
            break e;
          case 14:
            t = Of(null, t, r, xt(r.type, e), n);
            break e;
        }
        throw Error(b(306, r, ""));
      }
      return t;
    case 0:
      return (
        (r = t.type),
        (i = t.pendingProps),
        (i = t.elementType === r ? i : xt(r, i)),
        Su(e, t, r, i, n)
      );
    case 1:
      return (
        (r = t.type),
        (i = t.pendingProps),
        (i = t.elementType === r ? i : xt(r, i)),
        Df(e, t, r, i, n)
      );
    case 3:
      e: {
        if ((x1(t), e === null)) throw Error(b(387));
        (r = t.pendingProps),
          (s = t.memoizedState),
          (i = s.element),
          Gm(e, t),
          Yo(t, r, null, n);
        var o = t.memoizedState;
        if (((r = o.element), s.isDehydrated))
          if (
            ((s = {
              element: r,
              isDehydrated: !1,
              cache: o.cache,
              pendingSuspenseBoundaries: o.pendingSuspenseBoundaries,
              transitions: o.transitions,
            }),
            (t.updateQueue.baseState = s),
            (t.memoizedState = s),
            t.flags & 256)
          ) {
            (i = ni(Error(b(423)), t)), (t = Rf(e, t, r, n, i));
            break e;
          } else if (r !== i) {
            (i = ni(Error(b(424)), t)), (t = Rf(e, t, r, n, i));
            break e;
          } else
            for (
              Ze = En(t.stateNode.containerInfo.firstChild),
                Qe = t,
                se = !0,
                _t = null,
                n = Ym(t, null, r, n),
                t.child = n;
              n;

            )
              (n.flags = (n.flags & -3) | 4096), (n = n.sibling);
        else {
          if ((Jr(), r === i)) {
            t = sn(e, t, n);
            break e;
          }
          Ie(e, t, r, n);
        }
        t = t.child;
      }
      return t;
    case 5:
      return (
        Xm(t),
        e === null && gu(t),
        (r = t.type),
        (i = t.pendingProps),
        (s = e !== null ? e.memoizedProps : null),
        (o = i.children),
        du(r, i) ? (o = null) : s !== null && du(r, s) && (t.flags |= 32),
        w1(e, t),
        Ie(e, t, o, n),
        t.child
      );
    case 6:
      return e === null && gu(t), null;
    case 13:
      return S1(e, t, n);
    case 4:
      return (
        Lc(t, t.stateNode.containerInfo),
        (r = t.pendingProps),
        e === null ? (t.child = ei(t, null, r, n)) : Ie(e, t, r, n),
        t.child
      );
    case 11:
      return (
        (r = t.type),
        (i = t.pendingProps),
        (i = t.elementType === r ? i : xt(r, i)),
        Lf(e, t, r, i, n)
      );
    case 7:
      return Ie(e, t, t.pendingProps, n), t.child;
    case 8:
      return Ie(e, t, t.pendingProps.children, n), t.child;
    case 12:
      return Ie(e, t, t.pendingProps.children, n), t.child;
    case 10:
      e: {
        if (
          ((r = t.type._context),
          (i = t.pendingProps),
          (s = t.memoizedProps),
          (o = i.value),
          te(Uo, r._currentValue),
          (r._currentValue = o),
          s !== null)
        )
          if (Et(s.value, o)) {
            if (s.children === i.children && !$e.current) {
              t = sn(e, t, n);
              break e;
            }
          } else
            for (s = t.child, s !== null && (s.return = t); s !== null; ) {
              var u = s.dependencies;
              if (u !== null) {
                o = s.child;
                for (var a = u.firstContext; a !== null; ) {
                  if (a.context === r) {
                    if (s.tag === 1) {
                      (a = Xt(-1, n & -n)), (a.tag = 2);
                      var d = s.updateQueue;
                      if (d !== null) {
                        d = d.shared;
                        var p = d.pending;
                        p === null
                          ? (a.next = a)
                          : ((a.next = p.next), (p.next = a)),
                          (d.pending = a);
                      }
                    }
                    (s.lanes |= n),
                      (a = s.alternate),
                      a !== null && (a.lanes |= n),
                      vu(s.return, n, t),
                      (u.lanes |= n);
                    break;
                  }
                  a = a.next;
                }
              } else if (s.tag === 10) o = s.type === t.type ? null : s.child;
              else if (s.tag === 18) {
                if (((o = s.return), o === null)) throw Error(b(341));
                (o.lanes |= n),
                  (u = o.alternate),
                  u !== null && (u.lanes |= n),
                  vu(o, n, t),
                  (o = s.sibling);
              } else o = s.child;
              if (o !== null) o.return = s;
              else
                for (o = s; o !== null; ) {
                  if (o === t) {
                    o = null;
                    break;
                  }
                  if (((s = o.sibling), s !== null)) {
                    (s.return = o.return), (o = s);
                    break;
                  }
                  o = o.return;
                }
              s = o;
            }
        Ie(e, t, i.children, n), (t = t.child);
      }
      return t;
    case 9:
      return (
        (i = t.type),
        (r = t.pendingProps.children),
        Kr(t, n),
        (i = ht(i)),
        (r = r(i)),
        (t.flags |= 1),
        Ie(e, t, r, n),
        t.child
      );
    case 14:
      return (
        (r = t.type),
        (i = xt(r, t.pendingProps)),
        (i = xt(r.type, i)),
        Of(e, t, r, i, n)
      );
    case 15:
      return v1(e, t, t.type, t.pendingProps, n);
    case 17:
      return (
        (r = t.type),
        (i = t.pendingProps),
        (i = t.elementType === r ? i : xt(r, i)),
        Eo(e, t),
        (t.tag = 1),
        Ge(r) ? ((e = !0), $o(t)) : (e = !1),
        Kr(t, n),
        Um(t, r, i),
        wu(t, r, i, n),
        _u(null, t, r, !0, e, n)
      );
    case 19:
      return _1(e, t, n);
    case 22:
      return y1(e, t, n);
  }
  throw Error(b(156, t.tag));
};
function j1(e, t) {
  return cm(e, t);
}
function cw(e, t, n, r) {
  (this.tag = e),
    (this.key = n),
    (this.sibling =
      this.child =
      this.return =
      this.stateNode =
      this.type =
      this.elementType =
        null),
    (this.index = 0),
    (this.ref = null),
    (this.pendingProps = t),
    (this.dependencies =
      this.memoizedState =
      this.updateQueue =
      this.memoizedProps =
        null),
    (this.mode = r),
    (this.subtreeFlags = this.flags = 0),
    (this.deletions = null),
    (this.childLanes = this.lanes = 0),
    (this.alternate = null);
}
function ft(e, t, n, r) {
  return new cw(e, t, n, r);
}
function Uc(e) {
  return (e = e.prototype), !(!e || !e.isReactComponent);
}
function dw(e) {
  if (typeof e == "function") return Uc(e) ? 1 : 0;
  if (e != null) {
    if (((e = e.$$typeof), e === dc)) return 11;
    if (e === fc) return 14;
  }
  return 2;
}
function Mn(e, t) {
  var n = e.alternate;
  return (
    n === null
      ? ((n = ft(e.tag, t, e.key, e.mode)),
        (n.elementType = e.elementType),
        (n.type = e.type),
        (n.stateNode = e.stateNode),
        (n.alternate = e),
        (e.alternate = n))
      : ((n.pendingProps = t),
        (n.type = e.type),
        (n.flags = 0),
        (n.subtreeFlags = 0),
        (n.deletions = null)),
    (n.flags = e.flags & 14680064),
    (n.childLanes = e.childLanes),
    (n.lanes = e.lanes),
    (n.child = e.child),
    (n.memoizedProps = e.memoizedProps),
    (n.memoizedState = e.memoizedState),
    (n.updateQueue = e.updateQueue),
    (t = e.dependencies),
    (n.dependencies =
      t === null ? null : { lanes: t.lanes, firstContext: t.firstContext }),
    (n.sibling = e.sibling),
    (n.index = e.index),
    (n.ref = e.ref),
    n
  );
}
function ko(e, t, n, r, i, s) {
  var o = 2;
  if (((r = e), typeof e == "function")) Uc(e) && (o = 1);
  else if (typeof e == "string") o = 5;
  else
    e: switch (e) {
      case Ar:
        return nr(n.children, i, s, t);
      case cc:
        (o = 8), (i |= 8);
        break;
      case $a:
        return (
          (e = ft(12, n, t, i | 2)), (e.elementType = $a), (e.lanes = s), e
        );
      case Ga:
        return (e = ft(13, n, t, i)), (e.elementType = Ga), (e.lanes = s), e;
      case Wa:
        return (e = ft(19, n, t, i)), (e.elementType = Wa), (e.lanes = s), e;
      case Kh:
        return Pl(n, i, s, t);
      default:
        if (typeof e == "object" && e !== null)
          switch (e.$$typeof) {
            case Wh:
              o = 10;
              break e;
            case Uh:
              o = 9;
              break e;
            case dc:
              o = 11;
              break e;
            case fc:
              o = 14;
              break e;
            case mn:
              (o = 16), (r = null);
              break e;
          }
        throw Error(b(130, e == null ? e : typeof e, ""));
    }
  return (
    (t = ft(o, n, t, i)), (t.elementType = e), (t.type = r), (t.lanes = s), t
  );
}
function nr(e, t, n, r) {
  return (e = ft(7, e, r, t)), (e.lanes = n), e;
}
function Pl(e, t, n, r) {
  return (
    (e = ft(22, e, r, t)),
    (e.elementType = Kh),
    (e.lanes = n),
    (e.stateNode = { isHidden: !1 }),
    e
  );
}
function ga(e, t, n) {
  return (e = ft(6, e, null, t)), (e.lanes = n), e;
}
function va(e, t, n) {
  return (
    (t = ft(4, e.children !== null ? e.children : [], e.key, t)),
    (t.lanes = n),
    (t.stateNode = {
      containerInfo: e.containerInfo,
      pendingChildren: null,
      implementation: e.implementation,
    }),
    t
  );
}
function fw(e, t, n, r, i) {
  (this.tag = t),
    (this.containerInfo = e),
    (this.finishedWork =
      this.pingCache =
      this.current =
      this.pendingChildren =
        null),
    (this.timeoutHandle = -1),
    (this.callbackNode = this.pendingContext = this.context = null),
    (this.callbackPriority = 0),
    (this.eventTimes = Ql(0)),
    (this.expirationTimes = Ql(-1)),
    (this.entangledLanes =
      this.finishedLanes =
      this.mutableReadLanes =
      this.expiredLanes =
      this.pingedLanes =
      this.suspendedLanes =
      this.pendingLanes =
        0),
    (this.entanglements = Ql(0)),
    (this.identifierPrefix = r),
    (this.onRecoverableError = i),
    (this.mutableSourceEagerHydrationData = null);
}
function Kc(e, t, n, r, i, s, o, u, a) {
  return (
    (e = new fw(e, t, n, u, a)),
    t === 1 ? ((t = 1), s === !0 && (t |= 8)) : (t = 0),
    (s = ft(3, null, null, t)),
    (e.current = s),
    (s.stateNode = e),
    (s.memoizedState = {
      element: r,
      isDehydrated: n,
      cache: null,
      transitions: null,
      pendingSuspenseBoundaries: null,
    }),
    bc(s),
    e
  );
}
function pw(e, t, n) {
  var r = 3 < arguments.length && arguments[3] !== void 0 ? arguments[3] : null;
  return {
    $$typeof: Pr,
    key: r == null ? null : "" + r,
    children: e,
    containerInfo: t,
    implementation: n,
  };
}
function F1(e) {
  if (!e) return Ln;
  e = e._reactInternals;
  e: {
    if (mr(e) !== e || e.tag !== 1) throw Error(b(170));
    var t = e;
    do {
      switch (t.tag) {
        case 3:
          t = t.stateNode.context;
          break e;
        case 1:
          if (Ge(t.type)) {
            t = t.stateNode.__reactInternalMemoizedMergedChildContext;
            break e;
          }
      }
      t = t.return;
    } while (t !== null);
    throw Error(b(171));
  }
  if (e.tag === 1) {
    var n = e.type;
    if (Ge(n)) return jm(e, n, t);
  }
  return t;
}
function z1(e, t, n, r, i, s, o, u, a) {
  return (
    (e = Kc(n, r, !0, e, i, s, o, u, a)),
    (e.context = F1(null)),
    (n = e.current),
    (r = Ne()),
    (i = kn(n)),
    (s = Xt(r, i)),
    (s.callback = t ?? null),
    Pn(n, s, i),
    (e.current.lanes = i),
    Ls(e, i, r),
    We(e, r),
    e
  );
}
function Al(e, t, n, r) {
  var i = t.current,
    s = Ne(),
    o = kn(i);
  return (
    (n = F1(n)),
    t.context === null ? (t.context = n) : (t.pendingContext = n),
    (t = Xt(s, o)),
    (t.payload = { element: e }),
    (r = r === void 0 ? null : r),
    r !== null && (t.callback = r),
    (e = Pn(i, t, o)),
    e !== null && (Tt(e, i, o, s), _o(e, i, o)),
    o
  );
}
function nl(e) {
  if (((e = e.current), !e.child)) return null;
  switch (e.child.tag) {
    case 5:
      return e.child.stateNode;
    default:
      return e.child.stateNode;
  }
}
function Gf(e, t) {
  if (((e = e.memoizedState), e !== null && e.dehydrated !== null)) {
    var n = e.retryLane;
    e.retryLane = n !== 0 && n < t ? n : t;
  }
}
function Yc(e, t) {
  Gf(e, t), (e = e.alternate) && Gf(e, t);
}
function hw() {
  return null;
}
var B1 =
  typeof reportError == "function"
    ? reportError
    : function (e) {
        console.error(e);
      };
function Xc(e) {
  this._internalRoot = e;
}
kl.prototype.render = Xc.prototype.render = function (e) {
  var t = this._internalRoot;
  if (t === null) throw Error(b(409));
  Al(e, t, null, null);
};
kl.prototype.unmount = Xc.prototype.unmount = function () {
  var e = this._internalRoot;
  if (e !== null) {
    this._internalRoot = null;
    var t = e.containerInfo;
    ur(function () {
      Al(null, e, null, null);
    }),
      (t[nn] = null);
  }
};
function kl(e) {
  this._internalRoot = e;
}
kl.prototype.unstable_scheduleHydration = function (e) {
  if (e) {
    var t = vm();
    e = { blockedOn: null, target: e, priority: t };
    for (var n = 0; n < vn.length && t !== 0 && t < vn[n].priority; n++);
    vn.splice(n, 0, e), n === 0 && wm(e);
  }
};
function Zc(e) {
  return !(!e || (e.nodeType !== 1 && e.nodeType !== 9 && e.nodeType !== 11));
}
function Ml(e) {
  return !(
    !e ||
    (e.nodeType !== 1 &&
      e.nodeType !== 9 &&
      e.nodeType !== 11 &&
      (e.nodeType !== 8 || e.nodeValue !== " react-mount-point-unstable "))
  );
}
function Wf() {}
function mw(e, t, n, r, i) {
  if (i) {
    if (typeof r == "function") {
      var s = r;
      r = function () {
        var d = nl(o);
        s.call(d);
      };
    }
    var o = z1(t, r, e, 0, null, !1, !1, "", Wf);
    return (
      (e._reactRootContainer = o),
      (e[nn] = o.current),
      hs(e.nodeType === 8 ? e.parentNode : e),
      ur(),
      o
    );
  }
  for (; (i = e.lastChild); ) e.removeChild(i);
  if (typeof r == "function") {
    var u = r;
    r = function () {
      var d = nl(a);
      u.call(d);
    };
  }
  var a = Kc(e, 0, !1, null, null, !1, !1, "", Wf);
  return (
    (e._reactRootContainer = a),
    (e[nn] = a.current),
    hs(e.nodeType === 8 ? e.parentNode : e),
    ur(function () {
      Al(t, a, n, r);
    }),
    a
  );
}
function bl(e, t, n, r, i) {
  var s = n._reactRootContainer;
  if (s) {
    var o = s;
    if (typeof i == "function") {
      var u = i;
      i = function () {
        var a = nl(o);
        u.call(a);
      };
    }
    Al(t, o, e, i);
  } else o = mw(n, t, e, i, r);
  return nl(o);
}
mm = function (e) {
  switch (e.tag) {
    case 3:
      var t = e.stateNode;
      if (t.current.memoizedState.isDehydrated) {
        var n = Hi(t.pendingLanes);
        n !== 0 &&
          (mc(t, n | 1), We(t, pe()), !(X & 6) && ((ri = pe() + 500), jn()));
      }
      break;
    case 13:
      ur(function () {
        var r = rn(e, 1);
        if (r !== null) {
          var i = Ne();
          Tt(r, e, 1, i);
        }
      }),
        Yc(e, 1);
  }
};
gc = function (e) {
  if (e.tag === 13) {
    var t = rn(e, 134217728);
    if (t !== null) {
      var n = Ne();
      Tt(t, e, 134217728, n);
    }
    Yc(e, 134217728);
  }
};
gm = function (e) {
  if (e.tag === 13) {
    var t = kn(e),
      n = rn(e, t);
    if (n !== null) {
      var r = Ne();
      Tt(n, e, t, r);
    }
    Yc(e, t);
  }
};
vm = function () {
  return q;
};
ym = function (e, t) {
  var n = q;
  try {
    return (q = e), t();
  } finally {
    q = n;
  }
};
tu = function (e, t, n) {
  switch (t) {
    case "input":
      if ((Ya(e, n), (t = n.name), n.type === "radio" && t != null)) {
        for (n = e; n.parentNode; ) n = n.parentNode;
        for (
          n = n.querySelectorAll(
            "input[name=" + JSON.stringify("" + t) + '][type="radio"]'
          ),
            t = 0;
          t < n.length;
          t++
        ) {
          var r = n[t];
          if (r !== e && r.form === e.form) {
            var i = xl(r);
            if (!i) throw Error(b(90));
            Xh(r), Ya(r, i);
          }
        }
      }
      break;
    case "textarea":
      Qh(e, n);
      break;
    case "select":
      (t = n.value), t != null && $r(e, !!n.multiple, t, !1);
  }
};
im = $c;
sm = ur;
var gw = { usingClientEntryPoint: !1, Events: [Ds, Lr, xl, nm, rm, $c] },
  Ii = {
    findFiberByHostInstance: Qn,
    bundleType: 0,
    version: "18.2.0",
    rendererPackageName: "react-dom",
  },
  vw = {
    bundleType: Ii.bundleType,
    version: Ii.version,
    rendererPackageName: Ii.rendererPackageName,
    rendererConfig: Ii.rendererConfig,
    overrideHookState: null,
    overrideHookStateDeletePath: null,
    overrideHookStateRenamePath: null,
    overrideProps: null,
    overridePropsDeletePath: null,
    overridePropsRenamePath: null,
    setErrorHandler: null,
    setSuspenseHandler: null,
    scheduleUpdate: null,
    currentDispatcherRef: ln.ReactCurrentDispatcher,
    findHostInstanceByFiber: function (e) {
      return (e = am(e)), e === null ? null : e.stateNode;
    },
    findFiberByHostInstance: Ii.findFiberByHostInstance || hw,
    findHostInstancesForRefresh: null,
    scheduleRefresh: null,
    scheduleRoot: null,
    setRefreshHandler: null,
    getCurrentFiber: null,
    reconcilerVersion: "18.2.0-next-9e3b772b8-20220608",
  };
if (typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ < "u") {
  var ao = __REACT_DEVTOOLS_GLOBAL_HOOK__;
  if (!ao.isDisabled && ao.supportsFiber)
    try {
      (gl = ao.inject(vw)), (Rt = ao);
    } catch {}
}
tt.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = gw;
tt.createPortal = function (e, t) {
  var n = 2 < arguments.length && arguments[2] !== void 0 ? arguments[2] : null;
  if (!Zc(t)) throw Error(b(200));
  return pw(e, t, null, n);
};
tt.createRoot = function (e, t) {
  if (!Zc(e)) throw Error(b(299));
  var n = !1,
    r = "",
    i = B1;
  return (
    t != null &&
      (t.unstable_strictMode === !0 && (n = !0),
      t.identifierPrefix !== void 0 && (r = t.identifierPrefix),
      t.onRecoverableError !== void 0 && (i = t.onRecoverableError)),
    (t = Kc(e, 1, !1, null, null, n, !1, r, i)),
    (e[nn] = t.current),
    hs(e.nodeType === 8 ? e.parentNode : e),
    new Xc(t)
  );
};
tt.findDOMNode = function (e) {
  if (e == null) return null;
  if (e.nodeType === 1) return e;
  var t = e._reactInternals;
  if (t === void 0)
    throw typeof e.render == "function"
      ? Error(b(188))
      : ((e = Object.keys(e).join(",")), Error(b(268, e)));
  return (e = am(t)), (e = e === null ? null : e.stateNode), e;
};
tt.flushSync = function (e) {
  return ur(e);
};
tt.hydrate = function (e, t, n) {
  if (!Ml(t)) throw Error(b(200));
  return bl(null, e, t, !0, n);
};
tt.hydrateRoot = function (e, t, n) {
  if (!Zc(e)) throw Error(b(405));
  var r = (n != null && n.hydratedSources) || null,
    i = !1,
    s = "",
    o = B1;
  if (
    (n != null &&
      (n.unstable_strictMode === !0 && (i = !0),
      n.identifierPrefix !== void 0 && (s = n.identifierPrefix),
      n.onRecoverableError !== void 0 && (o = n.onRecoverableError)),
    (t = z1(t, null, e, 1, n ?? null, i, !1, s, o)),
    (e[nn] = t.current),
    hs(e),
    r)
  )
    for (e = 0; e < r.length; e++)
      (n = r[e]),
        (i = n._getVersion),
        (i = i(n._source)),
        t.mutableSourceEagerHydrationData == null
          ? (t.mutableSourceEagerHydrationData = [n, i])
          : t.mutableSourceEagerHydrationData.push(n, i);
  return new kl(t);
};
tt.render = function (e, t, n) {
  if (!Ml(t)) throw Error(b(200));
  return bl(null, e, t, !1, n);
};
tt.unmountComponentAtNode = function (e) {
  if (!Ml(e)) throw Error(b(40));
  return e._reactRootContainer
    ? (ur(function () {
        bl(null, null, e, !1, function () {
          (e._reactRootContainer = null), (e[nn] = null);
        });
      }),
      !0)
    : !1;
};
tt.unstable_batchedUpdates = $c;
tt.unstable_renderSubtreeIntoContainer = function (e, t, n, r) {
  if (!Ml(n)) throw Error(b(200));
  if (e == null || e._reactInternals === void 0) throw Error(b(38));
  return bl(e, t, n, !1, r);
};
tt.version = "18.2.0-next-9e3b772b8-20220608";
function H1() {
  if (
    !(
      typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ > "u" ||
      typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE != "function"
    )
  )
    try {
      __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(H1);
    } catch (e) {
      console.error(e);
    }
}
H1(), (zh.exports = tt);
var yw = zh.exports,
  Uf = yw;
(Ba.createRoot = Uf.createRoot), (Ba.hydrateRoot = Uf.hydrateRoot);
const $1 = () => {},
  ww = (e, t) => {
    const n = C.useRef($1);
    C.useEffect(() => {
      n.current = t;
    }, [t]),
      C.useEffect(() => {
        const r = (i) => {
          const { action: s, data: o } = i.data;
          n.current && s === e && n.current(o);
        };
        return (
          window.addEventListener("message", r),
          () => window.removeEventListener("message", r)
        );
      }, [e]);
  },
  Wn = (e, t) => {
    const n = C.useRef($1);
    C.useEffect(() => {
      n.current = t;
    }, [t]),
      C.useEffect(() => {
        (() => {
          n.current &&
            window.nuiHandoverData &&
            window.nuiHandoverData[e] &&
            n.current(window.nuiHandoverData[e]);
        })();
      }, [e]);
  },
  xw = {
    serverName: "N E V A",
    serverTag: "ROLAL",
    serverNameDescription: "LOADING EKRAN",
    imagepopup: !1,
    selectedgame: !1,
    showKeyboard: !1,
    playlist: [
      {
        author: "KA PRN",
        songName: "SİĞ Horse",
        logo: "./music1.png",
        file: "1",
      },
      {
        author: "Katy Pery",
        songName: "Kiss Me",
        logo: "./music1.png",
        file: "2",
      },
    ],
    showMusicPlayer: !1,
    lang: {
      serverName: "N E V A",
      serverTag: "ROLEPLAY",
      serverNameDescription: "Bienvenue en ville !",
      keyboard: "Touches",
      closeAll: "Tout fermer",
      loadingAssets: "Chargement...",
      close: "Close",
      music: "Music",
      rules: "Règles",
      gallery: "Images",
      game: "Jeux",
      media: "Liens",
      team: "Équipe",
      rulesDescription: "Règles du serveur",
      galleryDescription: "Galerie du serveur",
      mediaDescription: "Médias du serveur",
      teamDescription: "Équipe du serveur",
      information: "Informations",
    },
    rules: [
      {
        title: "Respect des joueurs",
        date: "13/03/2025",
        description:
          "Il est interdit d'insulter, harceler ou manquer de respect aux autres joueurs sous peine de sanction.",
      },
      {
        title: "Pas de HRP en jeu",
        date: "13/03/2025",
        description:
          "Toute discussion hors-roleplay doit être évitée en jeu. Utilisez les canaux dédiés pour cela.",
      },
      {
        title: "Pas de Freekill",
        date: "13/03/2025",
        description:
          "Tuer un joueur sans raison RP valable est strictement interdit.",
      },
      {
        title: "Pas de Powergaming",
        date: "13/03/2025",
        description:
          "Ne réalisez pas d'actions irréalistes ou impossibles dans la vraie vie.",
      },
      {
        title: "Pas de Metagaming",
        date: "13/03/2025",
        description:
          "L'utilisation d'informations hors-jeu pour influencer votre gameplay est interdite.",
      },
      {
        title: "Pas de Cheat ou Exploits",
        date: "13/03/2025",
        description:
          "L'utilisation de mods, cheats ou exploits pour avoir un avantage est passible d'un bannissement.",
      },
      {
        title: "Respect des forces de l'ordre",
        date: "13/03/2025",
        description:
          "Les interactions avec la police doivent rester cohérentes et réalistes.",
      },
      {
        title: "Pas de No Fear RP",
        date: "13/03/2025",
        description:
          "Votre personnage doit réagir de manière réaliste face à une situation dangereuse.",
      },
      {
        title: "Respect du New Life Rule (NLR)",
        date: "13/03/2025",
        description:
          "Après la mort de votre personnage, vous ne pouvez pas retourner immédiatement sur les lieux ou vous souvenir des événements précédents.",
      },
      {
        title: "Publicité interdite",
        date: "13/03/2025",
        description:
          "Faire la promotion d'autres serveurs ou services sans autorisation est interdit.",
      },
    ],
    socials: [
      { name: "Twitter", link: "https://twitter.com/izzyshop", icon: "x.png" },
      {
        name: "Instagram",
        link: "https://instagram.com/izzyshop",
        icon: "instagram.png",
      },
      {
        name: "Discord",
        link: "https://facebook.com/izzyshop",
        icon: "discord.png",
      },
      {
        name: "YouTube",
        link: "https://youtube.com/izzyshop",
        icon: "youtube.png",
      },
    ],
    team: [
      {
        name: "NEVA",
        tag: "Fondateur",
        description: "Fondateur et développeur de la NEVA - Base",
        userId: "",
        avatar:
          "https://i.ibb.co/DHpv99q1/00e15172-6008-452c-b268-2ae670748afe.png",
        medias: {
          discord: "neva",
          tiktok: "neva",
          instagram: "neva",
          youtube: "neva",
        },
      },
      {
        name: "ZEN",
        tag: "Fondateur",
        description: "Fondateur et développeur de la NEVA - Base",
        userId: "",
        avatar:
          "https://i.ibb.co/23GRjtL9/a8d6daa0-fb60-4e86-9111-92ff6c6648e4.jpg",
        medias: {
          discord: "zen",
          tiktok: "zen",
          instagram: "zen",
          youtube: "zen",
        },
      },
    ],
    images: [
      "./gallery/1.png",
      "./gallery/2.png",
      "./gallery/3.png",
      "./gallery/4.png",
      "./gallery/5.png",
      "./gallery/1.png",
      "./gallery/2.png",
      "./gallery/3.png",
      "./gallery/4.png",
      "./gallery/5.png",
    ],
    background: !1,
  },
  Sw = (e, t) => {
    switch (t.type) {
      case "SET_IMAGEPOPUP":
        return { ...e, imagepopup: t.payload };
      case "SET_SELECTEDGAME":
        return { ...e, selectedgame: t.payload };
      case "SET_SHOWKEYBOARD":
        return { ...e, showKeyboard: t.payload };
      case "SET_SHOWMUSICPLAYER":
        return { ...e, showMusicPlayer: t.payload };
      case "SET_LANG":
        return { ...e, lang: t.payload };
      case "SET_RULES":
        return { ...e, rules: t.payload };
      case "SET_SOCIALS":
        return { ...e, socials: t.payload };
      case "SET_PLAYLIST":
        return { ...e, playlist: t.payload };
      case "SET_TEAM":
        return { ...e, team: t.payload };
      case "SET_IMAGES":
        return { ...e, images: t.payload };
      case "SET_BACKGROUND":
        return { ...e, background: t.payload };
      default:
        return e;
    }
  },
  G1 = C.createContext(),
  je = () => C.useContext(G1);
function _w({ children: e }) {
  const [t, n] = C.useReducer(Sw, xw),
    r = (i, s) => {
      n({ type: i, payload: s });
    };
  return (
    Wn("setRules", (i) => {
      r("SET_RULES", i);
    }),
    Wn("setLang", (i) => {
      r("SET_LANG", i);
    }),
    Wn("setSocials", (i) => {
      r("SET_SOCIALS", i);
    }),
    Wn("setPlaylist", (i) => {
      r("SET_PLAYLIST", i);
    }),
    Wn("setTeam", (i) => {
      r("SET_TEAM", i);
    }),
    Wn("setImages", (i) => {
      r("SET_IMAGES", i);
    }),
    Wn("setBackground", (i) => {
      r("SET_BACKGROUND", i);
    }),
    _.jsx(G1.Provider, {
      value: { ...t, update: r },
      className: "w-full h-full",
      children: e,
    })
  );
}
function Cw() {
  const { lang: e } = je();
  return _.jsxs("div", {
    className: "flex items-center gap-5",
    children: [
      _.jsx("div", {
        style: { backdropFilter: "blur(10.284894943237305px)" },
        className:
          "w-[4.75rem] h-[4.75rem] rounded-[0.827rem] bg-[#07080D80] flex items-center justify-center",
        children: _.jsx("img", {
          src: "https://i.ibb.co/VHFyJN6/NEVA-Logo-Blanc-Plan-de-travail-1.png",
          alt: "logo",
          className: "w-[2rem] h-[2rem]",
        }),
      }),
      _.jsxs("div", {
        children: [
          _.jsxs("p", {
            className:
              "text-[#74c0fc] text-[1.75rem] font-bold font-roboto leading-[90%] mb-2", // Added margin bottom
            children: [
              e.serverName,
              " ",
              _.jsx("span", { className: "text-white", children: e.serverTag }),
            ],
          }),
          _.jsx("p", {
            className: "text-white font-roboto text-[1.125rem] leading-[90%]",
            children: e.serverNameDescription,
          }),
        ],
      }),
    ],
  });
}
const Tw = ({ className: e }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "24",
      className: e,
      height: "24",
      viewBox: "0 0 24 24",
      fill: "none",
      children: _.jsx("path", {
        d: "M19.2701 5.33C17.9401 4.71 16.5001 4.26 15.0001 4C14.9737 4.00038 14.9486 4.01116 14.9301 4.03C14.7501 4.36 14.5401 4.79 14.4001 5.12C12.8091 4.88015 11.1911 4.88015 9.60012 5.12C9.46012 4.78 9.25012 4.36 9.06012 4.03C9.05012 4.01 9.02012 4 8.99012 4C7.49012 4.26 6.06012 4.71 4.72012 5.33C4.71012 5.33 4.70012 5.34 4.69012 5.35C1.97012 9.42 1.22012 13.38 1.59012 17.3C1.59012 17.32 1.60012 17.34 1.62012 17.35C3.42012 18.67 5.15012 19.47 6.86012 20C6.89012 20.01 6.92012 20 6.93012 19.98C7.33012 19.43 7.69012 18.85 8.00012 18.24C8.02012 18.2 8.00012 18.16 7.96012 18.15C7.39012 17.93 6.85012 17.67 6.32012 17.37C6.28012 17.35 6.28012 17.29 6.31012 17.26C6.42012 17.18 6.53012 17.09 6.64012 17.01C6.66012 16.99 6.69012 16.99 6.71012 17C10.1501 18.57 13.8601 18.57 17.2601 17C17.2801 16.99 17.3101 16.99 17.3301 17.01C17.4401 17.1 17.5501 17.18 17.6601 17.27C17.7001 17.3 17.7001 17.36 17.6501 17.38C17.1301 17.69 16.5801 17.94 16.0101 18.16C15.9701 18.17 15.9601 18.22 15.9701 18.25C16.2901 18.86 16.6501 19.44 17.0401 19.99C17.0701 20 17.1001 20.01 17.1301 20C18.8501 19.47 20.5801 18.67 22.3801 17.35C22.4001 17.34 22.4101 17.32 22.4101 17.3C22.8501 12.77 21.6801 8.84 19.3101 5.35C19.3001 5.34 19.2901 5.33 19.2701 5.33ZM8.52012 14.91C7.49012 14.91 6.63012 13.96 6.63012 12.79C6.63012 11.62 7.47012 10.67 8.52012 10.67C9.58012 10.67 10.4201 11.63 10.4101 12.79C10.4101 13.96 9.57012 14.91 8.52012 14.91ZM15.4901 14.91C14.4601 14.91 13.6001 13.96 13.6001 12.79C13.6001 11.62 14.4401 10.67 15.4901 10.67C16.5501 10.67 17.3901 11.63 17.3801 12.79C17.3801 13.96 16.5501 14.91 15.4901 14.91Z",
        fill: "auto",
      }),
    }),
  Ew = ({ className: e }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "22",
      height: "22",
      viewBox: "0 0 22 22",
      fill: "none",
      className: e,
      children: _.jsx("path", {
        d: "M17.3259 1.05688H20.6992L13.3293 9.48105L22 20.9421H15.2112L9.8945 13.9901L3.80967 20.9421H0.4345L8.31783 11.9313L0 1.0578H6.96117L11.7673 7.41214L17.3259 1.05688ZM16.1425 18.9236H18.0116L5.9455 2.96997H3.93983L16.1425 18.9236Z",
        fill: "auto",
      }),
    }),
  Pw = ({ className: e }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "26",
      height: "26",
      viewBox: "0 0 26 26",
      fill: "none",
      className: e,
      children: _.jsx("path", {
        d: "M17.9825 6.305C17.2422 5.45949 16.8341 4.37385 16.8342 3.25H13.4867V16.6833C13.4614 17.4105 13.1547 18.0993 12.6312 18.6046C12.1077 19.1099 11.4084 19.3921 10.6809 19.3917C9.14253 19.3917 7.86419 18.135 7.86419 16.575C7.86419 14.7117 9.66253 13.3142 11.515 13.8883V10.465C7.77753 9.96667 4.50586 12.87 4.50586 16.575C4.50586 20.1825 7.49586 22.75 10.67 22.75C14.0717 22.75 16.8342 19.9875 16.8342 16.575V9.76083C18.1916 10.7357 19.8213 11.2587 21.4925 11.2558V7.90833C21.4925 7.90833 19.4559 8.00583 17.9825 6.305Z",
        fill: "auto",
      }),
    }),
  Aw = ({ className: e }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "24",
      height: "24",
      className: e,
      viewBox: "0 0 24 24",
      fill: "none",
      children: _.jsx("path", {
        d: "M7.8 2H16.2C19.4 2 22 4.6 22 7.8V16.2C22 17.7383 21.3889 19.2135 20.3012 20.3012C19.2135 21.3889 17.7383 22 16.2 22H7.8C4.6 22 2 19.4 2 16.2V7.8C2 6.26174 2.61107 4.78649 3.69878 3.69878C4.78649 2.61107 6.26174 2 7.8 2ZM7.6 4C6.64522 4 5.72955 4.37928 5.05442 5.05442C4.37928 5.72955 4 6.64522 4 7.6V16.4C4 18.39 5.61 20 7.6 20H16.4C17.3548 20 18.2705 19.6207 18.9456 18.9456C19.6207 18.2705 20 17.3548 20 16.4V7.6C20 5.61 18.39 4 16.4 4H7.6ZM17.25 5.5C17.5815 5.5 17.8995 5.6317 18.1339 5.86612C18.3683 6.10054 18.5 6.41848 18.5 6.75C18.5 7.08152 18.3683 7.39946 18.1339 7.63388C17.8995 7.8683 17.5815 8 17.25 8C16.9185 8 16.6005 7.8683 16.3661 7.63388C16.1317 7.39946 16 7.08152 16 6.75C16 6.41848 16.1317 6.10054 16.3661 5.86612C16.6005 5.6317 16.9185 5.5 17.25 5.5ZM12 7C13.3261 7 14.5979 7.52678 15.5355 8.46447C16.4732 9.40215 17 10.6739 17 12C17 13.3261 16.4732 14.5979 15.5355 15.5355C14.5979 16.4732 13.3261 17 12 17C10.6739 17 9.40215 16.4732 8.46447 15.5355C7.52678 14.5979 7 13.3261 7 12C7 10.6739 7.52678 9.40215 8.46447 8.46447C9.40215 7.52678 10.6739 7 12 7ZM12 9C11.2044 9 10.4413 9.31607 9.87868 9.87868C9.31607 10.4413 9 11.2044 9 12C9 12.7956 9.31607 13.5587 9.87868 14.1213C10.4413 14.6839 11.2044 15 12 15C12.7956 15 13.5587 14.6839 14.1213 14.1213C14.6839 13.5587 15 12.7956 15 12C15 11.2044 14.6839 10.4413 14.1213 9.87868C13.5587 9.31607 12.7956 9 12 9Z",
        fill: "auto",
      }),
    }),
  kw = ({ className: e }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "22",
      height: "22",
      viewBox: "0 0 22 22",
      className: e,
      fill: "none",
      children: _.jsx("path", {
        d: "M19.2502 2.75V14.2083C19.2502 15.0592 18.9121 15.8753 18.3105 16.477C17.7088 17.0786 16.8927 17.4167 16.0418 17.4167C15.1909 17.4167 14.3749 17.0786 13.7732 16.477C13.1715 15.8753 12.8335 15.0592 12.8335 14.2083C12.8335 13.3574 13.1715 12.5414 13.7732 11.9397C14.3749 11.338 15.1909 11 16.0418 11C16.5368 11 17.0043 11.11 17.4168 11.3117V5.93083L8.25016 7.88333V16.0417C8.25016 16.8926 7.91214 17.7086 7.31046 18.3103C6.70878 18.912 5.89273 19.25 5.04183 19.25C4.19093 19.25 3.37487 18.912 2.7732 18.3103C2.17152 17.7086 1.8335 16.8926 1.8335 16.0417C1.8335 15.1908 2.17152 14.3747 2.7732 13.773C3.37487 13.1714 4.19093 12.8333 5.04183 12.8333C5.53683 12.8333 6.00433 12.9433 6.41683 13.145V5.5L19.2502 2.75Z",
        fill: "auto",
      }),
    }),
  Mw = ({ className: e }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "28",
      height: "28",
      viewBox: "0 0 28 28",
      fill: "none",
      className: e,
      children: _.jsx("path", {
        d: "M4.66683 22.1666C4.02516 22.1666 3.47605 21.9384 3.0195 21.4818C2.56294 21.0253 2.33427 20.4758 2.3335 19.8333V8.16665C2.3335 7.52498 2.56216 6.97587 3.0195 6.51931C3.47683 6.06276 4.02594 5.83409 4.66683 5.83331H23.3335C23.9752 5.83331 24.5247 6.06198 24.982 6.51931C25.4393 6.97665 25.6676 7.52576 25.6668 8.16665V19.8333C25.6668 20.475 25.4386 21.0245 24.982 21.4818C24.5254 21.9391 23.9759 22.1674 23.3335 22.1666H4.66683ZM9.3335 18.6666H18.6668V16.3333H9.3335V18.6666ZM5.8335 15.1666H8.16683V12.8333H5.8335V15.1666ZM9.3335 15.1666H11.6668V12.8333H9.3335V15.1666ZM12.8335 15.1666H15.1668V12.8333H12.8335V15.1666ZM16.3335 15.1666H18.6668V12.8333H16.3335V15.1666ZM19.8335 15.1666H22.1668V12.8333H19.8335V15.1666ZM5.8335 11.6666H8.16683V9.33331H5.8335V11.6666ZM9.3335 11.6666H11.6668V9.33331H9.3335V11.6666ZM12.8335 11.6666H15.1668V9.33331H12.8335V11.6666ZM16.3335 11.6666H18.6668V9.33331H16.3335V11.6666ZM19.8335 11.6666H22.1668V9.33331H19.8335V11.6666Z",
        fill: "auto",
      }),
    }),
  bw = ({ className: e }) =>
    _.jsxs("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "22",
      height: "22",
      viewBox: "0 0 22 22",
      fill: "none",
      className: e,
      children: [
        _.jsx("path", {
          d: "M11 13.75C12.5188 13.75 13.75 12.5188 13.75 11C13.75 9.48122 12.5188 8.25 11 8.25C9.48122 8.25 8.25 9.48122 8.25 11C8.25 12.5188 9.48122 13.75 11 13.75Z",
          fill: "auto",
        }),
        _.jsx("path", {
          d: "M21.271 10.7662C20.4623 8.67463 19.0586 6.8658 17.2331 5.56331C15.4077 4.26082 13.2406 3.52177 10.9997 3.4375C8.75881 3.52177 6.59172 4.26082 4.76628 5.56331C2.94084 6.8658 1.53707 8.67463 0.728458 10.7662C0.673847 10.9173 0.673847 11.0827 0.728458 11.2338C1.53707 13.3254 2.94084 15.1342 4.76628 16.4367C6.59172 17.7392 8.75881 18.4782 10.9997 18.5625C13.2406 18.4782 15.4077 17.7392 17.2331 16.4367C19.0586 15.1342 20.4623 13.3254 21.271 11.2338C21.3256 11.0827 21.3256 10.9173 21.271 10.7662ZM10.9997 15.4688C10.1159 15.4687 9.25189 15.2067 8.517 14.7156C7.78212 14.2246 7.20935 13.5267 6.87112 12.7101C6.53289 11.8936 6.4444 10.995 6.61682 10.1282C6.78925 9.26134 7.21486 8.46508 7.83982 7.84012C8.46479 7.21515 9.26104 6.78954 10.1279 6.61712C10.9948 6.44469 11.8933 6.53318 12.7098 6.87141C13.5264 7.20964 14.2243 7.78241 14.7153 8.5173C15.2064 9.25218 15.4685 10.1162 15.4685 11C15.4666 12.1846 14.9952 13.3202 14.1576 14.1579C13.3199 14.9955 12.1843 15.4669 10.9997 15.4688Z",
          fill: "auto",
        }),
      ],
    }),
  Lw = ({ className: e = "fill-white" }) =>
    _.jsxs("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "22",
      height: "22",
      viewBox: "0 0 22 22",
      fill: "none",
      className: e,
      children: [
        _.jsx("path", {
          d: "M16.4997 7.33333C16.4997 7.81956 16.3065 8.28588 15.9627 8.6297C15.6189 8.97351 15.1526 9.16667 14.6663 9.16667C14.1801 9.16667 13.7138 8.97351 13.37 8.6297C13.0262 8.28588 12.833 7.81956 12.833 7.33333C12.833 6.8471 13.0262 6.38079 13.37 6.03697C13.7138 5.69315 14.1801 5.5 14.6663 5.5C15.1526 5.5 15.6189 5.69315 15.9627 6.03697C16.3065 6.38079 16.4997 6.8471 16.4997 7.33333Z",
          fill: "auto",
        }),
        _.jsx("path", {
          "fill-rule": "evenodd",
          "clip-rule": "evenodd",
          d: "M10.9474 1.14581H11.0519C13.1685 1.14581 14.8268 1.14581 16.1211 1.31998C17.4448 1.49781 18.4898 1.86998 19.3102 2.68948C20.1306 3.5099 20.5018 4.5549 20.6797 5.87948C20.8538 7.1729 20.8538 8.83115 20.8538 10.9477V11.0284C20.8538 12.7783 20.8538 14.2101 20.7585 15.3761C20.6632 16.5495 20.4679 17.5276 20.0298 18.3416C19.8379 18.6997 19.598 19.0226 19.3102 19.3105C18.4898 20.1309 17.4448 20.5021 16.1202 20.68C14.8268 20.8541 13.1685 20.8541 11.0519 20.8541H10.9474C8.83084 20.8541 7.17259 20.8541 5.87826 20.68C4.55459 20.5021 3.50959 20.13 2.68917 19.3105C1.96226 18.5836 1.58642 17.6788 1.38751 16.555C1.19042 15.4522 1.15467 14.08 1.14734 12.3768C1.14612 11.9429 1.14551 11.484 1.14551 11V10.9468C1.14551 8.83023 1.14551 7.17198 1.31967 5.87765C1.49751 4.55398 1.86967 3.50898 2.68917 2.68856C3.50959 1.86815 4.55459 1.4969 5.87917 1.31906C7.17259 1.1449 8.83084 1.1449 10.9474 1.1449M6.06159 2.68123C4.89009 2.8389 4.18334 3.13956 3.66176 3.66115C3.13926 4.18365 2.83951 4.88948 2.68184 6.0619C2.52234 7.25356 2.52051 8.81923 2.52051 10.9991V11.7727L3.43809 10.9697C3.84057 10.6174 4.36193 10.4312 4.89654 10.4489C5.43115 10.4666 5.93905 10.6869 6.31734 11.0651L10.2498 14.9976C10.555 15.3027 10.958 15.4903 11.3879 15.5276C11.8178 15.5648 12.2471 15.4492 12.6002 15.2011L12.8733 15.0086C13.3827 14.6506 13.9985 14.4761 14.6199 14.5136C15.2413 14.5511 15.8317 14.7983 16.2943 15.2148L18.8885 17.5496C19.1507 17.0014 19.3056 16.2809 19.3881 15.2643C19.4779 14.1597 19.4788 12.7829 19.4788 10.9991C19.4788 8.81923 19.477 7.25356 19.3175 6.0619C19.1598 4.88948 18.8592 4.18273 18.3376 3.66023C17.8151 3.13865 17.1093 2.8389 15.9368 2.68123C14.7452 2.52173 13.1795 2.5199 10.9997 2.5199C8.81984 2.5199 7.25326 2.52173 6.06159 2.68123Z",
          fill: "auto",
        }),
      ],
    }),
  Ow = ({ className: e = "fill-white" }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "22",
      height: "22",
      viewBox: "0 0 22 22",
      fill: "none",
      className: e,
      children: _.jsx("path", {
        d: "M6.5 18.5L10.5 16L6.5 13.5V18.5ZM12 6.75H16V5.25H12V6.75ZM2 22C1.45 22 0.979333 21.8043 0.588 21.413C0.196667 21.0217 0.000666667 20.5507 0 20V12C0 11.45 0.196 10.9793 0.588 10.588C0.98 10.1967 1.45067 10.0007 2 10H14C14.55 10 15.021 10.196 15.413 10.588C15.805 10.98 16.0007 11.4507 16 12V20C16 20.55 15.8043 21.021 15.413 21.413C15.0217 21.805 14.5507 22.0007 14 22H2ZM17.5 13V12C17.5 11.3667 17.346 10.7833 17.038 10.25C16.73 9.71667 16.3173 9.3 15.8 9H16C16.8333 9 17.5417 8.70833 18.125 8.125C18.7083 7.54167 19 6.83333 19 6C19 5.16667 18.7083 4.45833 18.125 3.875C17.5417 3.29167 16.8333 3 16 3H14.75V4.5H16C16.4167 4.5 16.771 4.646 17.063 4.938C17.355 5.23 17.5007 5.584 17.5 6C17.4993 6.416 17.3537 6.77033 17.063 7.063C16.7723 7.35567 16.418 7.50133 16 7.5H14.75V9C14.6167 9 14.4917 8.91667 14.375 8.75C14.2583 8.58333 14.1333 8.5 14 8.5H13.25V7.5H12C11.5833 7.5 11.2293 7.35433 10.938 7.063C10.6467 6.77167 10.5007 6.41733 10.5 6C10.4993 5.58267 10.6453 5.22867 10.938 4.938C11.2307 4.64733 11.5847 4.50133 12 4.5H13.25V3H12C11.1667 3 10.4583 3.29167 9.875 3.875C9.29167 4.45833 9 5.16667 9 6C9 6.53333 9.125 7.01267 9.375 7.438C9.625 7.86333 9.95 8.21733 10.35 8.5H6V2C6 1.45 6.196 0.979333 6.588 0.588C6.98 0.196667 7.45067 0.000666667 8 0H20C20.55 0 21.021 0.196 21.413 0.588C21.805 0.98 22.0007 1.45067 22 2V11C22 11.55 21.8043 12.021 21.413 12.413C21.0217 12.805 20.5507 13.0007 20 13H17.5Z",
        fill: "auto",
      }),
    }),
  Dw = ({ className: e = "fill-white" }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "20",
      height: "18",
      viewBox: "0 0 20 18",
      fill: "none",
      className: e,
      children: _.jsx("path", {
        d: "M12.9494 6.64289C13.7084 6.64289 14.3244 7.25889 14.3244 8.01789V13.3207C14.3244 14.467 13.8691 15.5664 13.0585 16.3769C12.2479 17.1875 11.1485 17.6429 10.0022 17.6429C8.8559 17.6429 7.75652 17.1875 6.94595 16.3769C6.13538 15.5664 5.68 14.467 5.68 13.3207V8.01789C5.68 7.25889 6.29522 6.64289 7.055 6.64289H12.9494ZM1.94629 6.64289L5.38929 6.64132C5.10616 6.98249 4.9357 7.40301 4.90136 7.84504L4.8935 8.01789V13.3207C4.8935 14.2109 5.12215 15.0485 5.52208 15.7776C4.98381 16.0127 4.39545 16.11 3.81017 16.0606C3.22488 16.0113 2.6611 15.817 2.16975 15.4952C1.6784 15.1733 1.27496 14.7342 0.995886 14.2174C0.716809 13.7005 0.570883 13.1223 0.57129 12.535V8.01789C0.57129 7.83726 0.606881 7.6584 0.676031 7.49152C0.74518 7.32465 0.846532 7.17303 0.974296 7.04534C1.10206 6.91765 1.25373 6.81639 1.42064 6.74733C1.58756 6.67828 1.76566 6.64279 1.94629 6.64289ZM14.6159 6.64132L18.0534 6.64289C18.8124 6.64289 19.4284 7.25889 19.4284 8.01789V12.5357C19.4287 13.1228 19.2827 13.7007 19.0038 14.2172C18.7248 14.7338 18.3216 15.1727 17.8306 15.4945C17.3396 15.8163 16.7762 16.0107 16.1912 16.0603C15.6063 16.1098 15.0182 16.013 14.48 15.7784L14.524 15.6982C14.8611 15.0595 15.0661 14.3398 15.1039 13.5768L15.1101 13.3207V8.01789C15.1101 7.49461 14.9247 7.01532 14.6159 6.64132ZM9.99986 0.357178C10.361 0.357178 10.7186 0.428309 11.0522 0.566509C11.3859 0.704709 11.689 0.907273 11.9444 1.16263C12.1998 1.418 12.4023 1.72115 12.5405 2.0548C12.6787 2.38844 12.7499 2.74604 12.7499 3.10718C12.7499 3.46831 12.6787 3.82591 12.5405 4.15956C12.4023 4.4932 12.1998 4.79636 11.9444 5.05172C11.689 5.30708 11.3859 5.50965 11.0522 5.64785C10.7186 5.78605 10.361 5.85718 9.99986 5.85718C9.27052 5.85718 8.57104 5.56745 8.05532 5.05172C7.53959 4.536 7.24986 3.83652 7.24986 3.10718C7.24986 2.37783 7.53959 1.67836 8.05532 1.16263C8.57104 0.646909 9.27052 0.357178 9.99986 0.357178ZM16.2879 1.14289C16.5975 1.14289 16.904 1.20386 17.19 1.32232C17.476 1.44078 17.7358 1.6144 17.9547 1.83328C18.1736 2.05216 18.3472 2.31201 18.4657 2.598C18.5841 2.88398 18.6451 3.19049 18.6451 3.50004C18.6451 3.80958 18.5841 4.11609 18.4657 4.40207C18.3472 4.68806 18.1736 4.94791 17.9547 5.16679C17.7358 5.38567 17.476 5.55929 17.19 5.67775C16.904 5.79621 16.5975 5.85718 16.2879 5.85718C15.6628 5.85718 15.0632 5.60884 14.6212 5.16679C14.1791 4.72474 13.9308 4.12519 13.9308 3.50004C13.9308 2.87488 14.1791 2.27533 14.6212 1.83328C15.0632 1.39123 15.6628 1.14289 16.2879 1.14289ZM3.71179 1.14289C4.02133 1.14289 4.32785 1.20386 4.61383 1.32232C4.89981 1.44078 5.15966 1.6144 5.37854 1.83328C5.59742 2.05216 5.77105 2.31201 5.88951 2.598C6.00796 2.88398 6.06893 3.19049 6.06893 3.50004C6.06893 3.80958 6.00796 4.11609 5.88951 4.40207C5.77105 4.68806 5.59742 4.94791 5.37854 5.16679C5.15966 5.38567 4.89981 5.55929 4.61383 5.67775C4.32785 5.79621 4.02133 5.85718 3.71179 5.85718C3.08664 5.85718 2.48709 5.60884 2.04504 5.16679C1.60299 4.72474 1.35465 4.12519 1.35465 3.50004C1.35465 2.87488 1.60299 2.27533 2.04504 1.83328C2.48709 1.39123 3.08664 1.14289 3.71179 1.14289Z",
        fill: "auto",
      }),
    }),
  Rw = ({ className: e = "fill-white" }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "18",
      height: "20",
      viewBox: "0 0 18 20",
      fill: "none",
      className: e,
      children: _.jsx("path", {
        d: "M15.875 0.375H2.12501C1.76033 0.375 1.4106 0.519866 1.15273 0.777728C0.894871 1.03559 0.750005 1.38533 0.750005 1.75V10.6875C0.748398 12.0586 1.12027 13.4043 1.82569 14.5801C2.53111 15.7558 3.54345 16.7172 4.75401 17.3611L9.00001 19.625L13.246 17.3611C14.4566 16.7172 15.4689 15.7558 16.1743 14.5801C16.8797 13.4043 17.2516 12.0586 17.25 10.6875V1.75C17.25 1.38533 17.1051 1.03559 16.8473 0.777728C16.5894 0.519866 16.2397 0.375 15.875 0.375ZM13.8125 11.375H4.18751V10H13.8125V11.375ZM13.8125 7.25H4.18751V5.875H13.8125V7.25Z",
        fill: "auto",
      }),
    }),
  Vw = ({ className: e = "fill-white" }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "20",
      height: "17",
      viewBox: "0 0 20 17",
      fill: "none",
      className: e,
      children: _.jsx("path", {
        d: "M9.99988 0.75C10.2244 0.75003 10.4411 0.83246 10.6089 0.981656C10.7767 1.13085 10.8839 1.33644 10.9101 1.55942L10.9165 1.66667V2.58333H12.2915C14.0953 2.58379 15.8266 3.29312 17.1122 4.55836C18.3978 5.82361 19.1347 7.54341 19.1639 9.34694C19.1931 11.1505 18.5124 12.8932 17.2685 14.1995C16.0245 15.5057 14.3171 16.2708 12.5143 16.3297L12.2915 16.3333H7.70821C5.90444 16.3329 4.17311 15.6235 2.88752 14.3583C1.60194 13.0931 0.865089 11.3733 0.835864 9.56972C0.806639 7.76619 1.48738 6.02342 2.73129 4.71718C3.97521 3.41095 5.68266 2.6459 7.48546 2.587L7.70821 2.58333H9.08321V1.66667C9.08321 1.42355 9.17979 1.19039 9.3517 1.01849C9.52361 0.846577 9.75676 0.75 9.99988 0.75ZM13.2082 7.16667C12.9651 7.16667 12.7319 7.26324 12.56 7.43515C12.3881 7.60706 12.2915 7.84022 12.2915 8.08333V8.54167H11.8332C11.5901 8.54167 11.3569 8.63824 11.185 8.81015C11.0131 8.98206 10.9165 9.21522 10.9165 9.45833C10.9165 9.70145 11.0131 9.93461 11.185 10.1065C11.3569 10.2784 11.5901 10.375 11.8332 10.375H12.2915V10.8333C12.2915 11.0764 12.3881 11.3096 12.56 11.4815C12.7319 11.6534 12.9651 11.75 13.2082 11.75C13.4513 11.75 13.6845 11.6534 13.8564 11.4815C14.0283 11.3096 14.1249 11.0764 14.1249 10.8333V10.375H14.5832C14.8263 10.375 15.0595 10.2784 15.2314 10.1065C15.4033 9.93461 15.4999 9.70145 15.4999 9.45833C15.4999 9.21522 15.4033 8.98206 15.2314 8.81015C15.0595 8.63824 14.8263 8.54167 14.5832 8.54167H14.1249V8.08333C14.1249 7.84022 14.0283 7.60706 13.8564 7.43515C13.6845 7.26324 13.4513 7.16667 13.2082 7.16667ZM6.79155 7.16667C6.18376 7.16667 5.60086 7.40811 5.17109 7.83788C4.74132 8.26765 4.49988 8.85055 4.49988 9.45833C4.49988 10.0661 4.74132 10.649 5.17109 11.0788C5.60086 11.5086 6.18376 11.75 6.79155 11.75C7.39933 11.75 7.98223 11.5086 8.412 11.0788C8.84177 10.649 9.08321 10.0661 9.08321 9.45833C9.08321 8.85055 8.84177 8.26765 8.412 7.83788C7.98223 7.40811 7.39933 7.16667 6.79155 7.16667ZM6.79155 9C6.9131 9 7.02968 9.04829 7.11564 9.13424C7.20159 9.2202 7.24988 9.33678 7.24988 9.45833C7.24988 9.57989 7.20159 9.69647 7.11564 9.78242C7.02968 9.86838 6.9131 9.91667 6.79155 9.91667C6.66999 9.91667 6.55341 9.86838 6.46745 9.78242C6.3815 9.69647 6.33321 9.57989 6.33321 9.45833C6.33321 9.33678 6.3815 9.2202 6.46745 9.13424C6.55341 9.04829 6.66999 9 6.79155 9Z",
        fill: "auto",
      }),
    }),
  Iw = ({ className: e }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "24",
      height: "24",
      className: e,
      viewBox: "0 0 24 24",
      fill: "none",
      children: _.jsx("path", {
        d: "M7 10L12 15L17 10",
        stroke: "white",
        "stroke-opacity": "0.47",
        "stroke-width": "1.5",
        "stroke-linecap": "round",
        "stroke-linejoin": "round",
      }),
    }),
  Nw = ({ className: e }) =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "23",
      height: "23",
      viewBox: "0 0 23 23",
      className: e,
      fill: "none",
      children: _.jsx("path", {
        d: "M13.4167 18.2084V4.79175H17.25V18.2084H13.4167ZM5.75 18.2084V4.79175H9.58333V18.2084H5.75Z",
        fill: "white",
      }),
    }),
  jw = ({ className: e }) =>
    _.jsx("svg", {
      width: "13",
      height: "16",
      viewBox: "0 0 13 16",
      className: e,
      fill: "none",
      xmlns: "http://www.w3.org/2000/svg",
      children: _.jsx("path", {
        "fill-rule": "evenodd",
        "clip-rule": "evenodd",
        d: "M1.03122 0.0200245C0.867013 0.0576974 0.623099 0.18196 0.492102 0.294734C0.340524 0.425199 0.186556 0.691109 0.0860377 0.996159L0 1.25721V7.81101V14.3648L0.0860377 14.6259C0.276586 15.204 0.58112 15.5069 1.07072 15.6053C1.36285 15.664 1.79085 15.571 2.15901 15.3689C2.37982 15.2477 12.0427 9.22285 12.1887 9.11539C12.4249 8.94144 12.6806 8.62982 12.797 8.37403C12.9025 8.14197 12.9057 8.12553 12.9057 7.81101C12.9057 7.49649 12.9025 7.48005 12.797 7.248C12.6806 6.9922 12.4249 6.68058 12.1887 6.50664C12.0427 6.39918 2.37982 0.374327 2.15901 0.25315C1.79588 0.0537865 1.31629 -0.0453607 1.03122 0.0200245Z",
        fill: "white",
      }),
    }),
  Fw = [
    { name: "discord", icon: Tw, url: "https://discord.gg/izzydev" },
    { name: "twitter", icon: Ew, url: "https://twitter.com/izzydev" },
    { name: "instagram", icon: Aw, url: "https://instagram.com/izzydev" },
    { name: "Tiktok", icon: Pw, url: "https://youtube.com/izzydev" },
  ];
function zw() {
  return _.jsx("div", {
    className: "flex items-center gap-[0.625rem] mt-[1.5625rem]",
    children: Fw.map((e, t) => _.jsx(Bw, { data: e }, t)),
  });
}
function Bw({ data: e }) {
  return _.jsxs("div", {
    style: { backdropFilter: "blur(11.949999809265137px)", display: "none" },
    className:
      "w-[3.125rem] group h-[3.125rem] transition-all hover:bg-white  duration-300 cursor-pointer rounded-[0.6875rem] flex items-center justify-center bg-[#07080D80]",
    children: [
      C.createElement(e.icon, {
        className:
          "fill-white group-hover:fill-black transition-all duration-300",
        onClick: () => window.open(e.url),
      }),
      _.jsx("div", {
        className:
          " opacity-0  group-hover:opacity-100 duration-300 transition-all w-[70%] mx-2 h-1 rounded absolute bg-white bottom-0 translate-y-2",
      }),
    ],
  });
}
function Hw() {
  const { update: e, showKeyboard: t, showMusicPlayer: n, lang: r } = je(),
    [i, s] = C.useState(50);
  return (
    C.useEffect(() => {
      const o = function (u) {
        u.data.eventName === "loadProgress" &&
          s(parseInt(u.data.loadFraction * 90));
      };
      return (
        window.addEventListener("message", o),
        () => window.removeEventListener("message", o)
      );
    }, []),
    _.jsxs("div", {
      className: "flex flex-col gap-3",
      children: [
        _.jsxs("div", {
          className: "flex items-center gap-3",
          children: [
            _.jsx(Ni, {
              active: n,
              onClick: () => e("SET_SHOWMUSICPLAYER", !n),
              children: _.jsx(kw, {
                className: `${
                  n && "!fill-black"
                } fill-white/50 group-hover:fill-black transition-all duration-500`,
              }),
            }),
            _.jsxs(Ni, {
              active: t,
              onClick: () => e("SET_SHOWKEYBOARD", !t),
              children: [
                _.jsx(Mw, {
                  className: `${
                    t && "!fill-black"
                  } fill-white/50 group-hover:fill-black transition-all duration-500`,
                }),
                _.jsx("p", {
                  className: `${
                    t && "!text-black"
                  } text-white/50 group-hover:text-black duration-500 font-roboto font-medium`,
                  children: r.keyboard,
                }),
              ],
            }),
            _.jsxs(Ni, {
              onClick: () => {
                e("SET_SHOWKEYBOARD", !1), e("SET_SHOWMUSICPLAYER", !1);
              },
              children: [
                _.jsx(bw, {
                  className:
                    "fill-white/50 group-hover:fill-black transition-all duration-500",
                }),
                _.jsx("p", {
                  className:
                    "text-white/50 group-hover:text-black duration-500 font-roboto font-medium",
                  children: r.closeAll,
                }),
              ],
            }),
          ],
        }),
        _.jsxs("div", {
          className: "flex items-center gap-3",
          children: [
            _.jsx(Ni, {
              children: _.jsx("p", {
                className:
                  "text-white duration-500 group-hover:text-black font-roboto font-medium",
                children: r.loadingAssets,
              }),
            }),
            _.jsxs(Ni, {
              children: [
                _.jsxs("svg", {
                  class:
                    "animate-spin -ml-1 mr-3 h-5 w-5 text-white group-hover:text-black duration-500",
                  xmlns: "http://www.w3.org/2000/svg",
                  fill: "none",
                  viewBox: "0 0 24 24",
                  children: [
                    _.jsx("circle", {
                      class: "opacity-25",
                      cx: "12",
                      cy: "12",
                      r: "10",
                      stroke: "currentColor",
                      "stroke-width": "4",
                    }),
                    _.jsx("path", {
                      class: "opacity-75",
                      fill: "currentColor",
                      d: "M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z",
                    }),
                  ],
                }),
                _.jsx("div", {
                  className:
                    "w-[18.75rem] duration-500 h-[0.1875rem] rounded-full relative bg-white/20 group-hover:bg-black/20",
                  children: _.jsx("div", {
                    className:
                      "h-full bg-white group-hover:bg-black duration-500 transition-all rounded-full",
                    style: { width: `${i}%` },
                  }),
                }),
                _.jsxs("p", {
                  className:
                    "text-white duration-500 group-hover:text-black font-roboto font-medium",
                  children: [i, "%"],
                }),
              ],
            }),
          ],
        }),
      ],
    })
  );
}
function Ni({ children: e, onClick: t, active: n = !1 }) {
  return _.jsx("div", {
    onClick: t,
    style: { backdropFilter: "blur(35.915000915527344px)" },
    className: `rounded-[0.6875rem] group cursor-pointer duration-500 ${
      n && "!bg-white !fill-black"
    } hover:bg-white transition-all gap-2 flex items-center h-[2.75rem] px-[0.6875rem] bg-[#07080D33]`,
    children: e,
  });
}
var W1 = { exports: {} };
/*!
	Copyright (c) 2018 Jed Watson.
	Licensed under the MIT License (MIT), see
	http://jedwatson.github.io/classnames
*/ (function (e) {
  (function () {
    var t = {}.hasOwnProperty;
    function n() {
      for (var s = "", o = 0; o < arguments.length; o++) {
        var u = arguments[o];
        u && (s = i(s, r(u)));
      }
      return s;
    }
    function r(s) {
      if (typeof s == "string" || typeof s == "number") return s;
      if (typeof s != "object") return "";
      if (Array.isArray(s)) return n.apply(null, s);
      if (
        s.toString !== Object.prototype.toString &&
        !s.toString.toString().includes("[native code]")
      )
        return s.toString();
      var o = "";
      for (var u in s) t.call(s, u) && s[u] && (o = i(o, u));
      return o;
    }
    function i(s, o) {
      return o ? (s ? s + " " + o : s + o) : s;
    }
    e.exports ? ((n.default = n), (e.exports = n)) : (window.classNames = n);
  })();
})(W1);
var $w = W1.exports;
const ii = Mh($w);
function Gw({ page: e, open: t, setOpen: n }) {
  const { lang: r } = je();
  return _.jsxs("div", {
    className: "w-full bg-[#07080D66]  p-5 rounded-[0.6875rem] mt-[2.3125rem]",
    style: { backdropFilter: "blur(32.650001525878906px)" },
    children: [
      _.jsxs("div", {
        className:
          "flex items-center justify-between px-[1.125rem] bg-[#07080D66] py-4 rounded-[0.4375rem]",
        children: [
          _.jsxs("div", {
            className: "flex items-center gap-2",
            children: [
              C.createElement(e.icon),
              _.jsx("p", {
                className: "text-[1.25rem] text-white/70 font-roboto",
                children: e.name,
              }),
            ],
          }),
          _.jsx("div", {
            onClick: () => n((i) => !i),
            className:
              "w-9 h-9 flex items-center justify-center rounded-[0.4375rem] cursor-pointer bg-[#07080D66]",
            children: _.jsx(Iw, {
              className: `${
                t ? "rotate-180" : "rotate-0"
              } transition-all duration-500`,
            }),
          }),
        ],
      }),
      _.jsxs("div", {
        className: "mt-4",
        children: [
          _.jsx("p", {
            className: "font-roboto text-white text-[1.125rem] leading-[90%]",
            children: r.information,
          }),
          _.jsx("p", {
            className: "font-roboto text-sm text-white/50 leading-[140%]",
            children: e.description,
          }),
        ],
      }),
    ],
  });
}
function Ww(e) {
  if (typeof Proxy > "u") return e;
  const t = new Map(),
    n = (...r) => e(...r);
  return new Proxy(n, {
    get: (r, i) =>
      i === "create" ? e : (t.has(i) || t.set(i, e(i)), t.get(i)),
  });
}
function Cs(e) {
  return e !== null && typeof e == "object" && typeof e.start == "function";
}
const Ru = (e) => Array.isArray(e);
function U1(e, t) {
  if (!Array.isArray(t)) return !1;
  const n = t.length;
  if (n !== e.length) return !1;
  for (let r = 0; r < n; r++) if (t[r] !== e[r]) return !1;
  return !0;
}
function Ts(e) {
  return typeof e == "string" || Array.isArray(e);
}
function Kf(e) {
  const t = [{}, {}];
  return (
    e == null ||
      e.values.forEach((n, r) => {
        (t[0][r] = n.get()), (t[1][r] = n.getVelocity());
      }),
    t
  );
}
function Qc(e, t, n, r) {
  if (typeof t == "function") {
    const [i, s] = Kf(r);
    t = t(n !== void 0 ? n : e.custom, i, s);
  }
  if (
    (typeof t == "string" && (t = e.variants && e.variants[t]),
    typeof t == "function")
  ) {
    const [i, s] = Kf(r);
    t = t(n !== void 0 ? n : e.custom, i, s);
  }
  return t;
}
function Ll(e, t, n) {
  const r = e.getProps();
  return Qc(r, t, n !== void 0 ? n : r.custom, e);
}
const qc = [
    "animate",
    "whileInView",
    "whileFocus",
    "whileHover",
    "whileTap",
    "whileDrag",
    "exit",
  ],
  Jc = ["initial", ...qc],
  Vs = [
    "transformPerspective",
    "x",
    "y",
    "z",
    "translateX",
    "translateY",
    "translateZ",
    "scale",
    "scaleX",
    "scaleY",
    "rotate",
    "rotateX",
    "rotateY",
    "rotateZ",
    "skew",
    "skewX",
    "skewY",
  ],
  Fn = new Set(Vs),
  It = (e) => e * 1e3,
  Zt = (e) => e / 1e3,
  Uw = { type: "spring", stiffness: 500, damping: 25, restSpeed: 10 },
  Kw = (e) => ({
    type: "spring",
    stiffness: 550,
    damping: e === 0 ? 2 * Math.sqrt(550) : 30,
    restSpeed: 10,
  }),
  Yw = { type: "keyframes", duration: 0.8 },
  Xw = { type: "keyframes", ease: [0.25, 0.1, 0.35, 1], duration: 0.3 },
  Zw = (e, { keyframes: t }) =>
    t.length > 2
      ? Yw
      : Fn.has(e)
      ? e.startsWith("scale")
        ? Kw(t[1])
        : Uw
      : Xw;
function Qw({
  when: e,
  delay: t,
  delayChildren: n,
  staggerChildren: r,
  staggerDirection: i,
  repeat: s,
  repeatType: o,
  repeatDelay: u,
  from: a,
  elapsed: d,
  ...p
}) {
  return !!Object.keys(p).length;
}
function ed(e, t) {
  return e[t] || e.default || e;
}
const qw = { skipAnimations: !1, useManualTiming: !1 },
  Jw = (e) => e !== null;
function Ol(e, { repeat: t, repeatType: n = "loop" }, r) {
  const i = e.filter(Jw),
    s = t && n !== "loop" && t % 2 === 1 ? 0 : i.length - 1;
  return !s || r === void 0 ? i[s] : r;
}
const Ee = (e) => e;
function e2(e) {
  let t = new Set(),
    n = new Set(),
    r = !1,
    i = !1;
  const s = new WeakSet();
  let o = { delta: 0, timestamp: 0, isProcessing: !1 };
  function u(d) {
    s.has(d) && (a.schedule(d), e()), d(o);
  }
  const a = {
    schedule: (d, p = !1, l = !1) => {
      const f = l && r ? t : n;
      return p && s.add(d), f.has(d) || f.add(d), d;
    },
    cancel: (d) => {
      n.delete(d), s.delete(d);
    },
    process: (d) => {
      if (((o = d), r)) {
        i = !0;
        return;
      }
      (r = !0),
        ([t, n] = [n, t]),
        n.clear(),
        t.forEach(u),
        (r = !1),
        i && ((i = !1), a.process(d));
    },
  };
  return a;
}
const uo = [
    "read",
    "resolveKeyframes",
    "update",
    "preRender",
    "render",
    "postRender",
  ],
  t2 = 40;
function K1(e, t) {
  let n = !1,
    r = !0;
  const i = { delta: 0, timestamp: 0, isProcessing: !1 },
    s = () => (n = !0),
    o = uo.reduce((h, g) => ((h[g] = e2(s)), h), {}),
    {
      read: u,
      resolveKeyframes: a,
      update: d,
      preRender: p,
      render: l,
      postRender: c,
    } = o,
    f = () => {
      const h = performance.now();
      (n = !1),
        (i.delta = r ? 1e3 / 60 : Math.max(Math.min(h - i.timestamp, t2), 1)),
        (i.timestamp = h),
        (i.isProcessing = !0),
        u.process(i),
        a.process(i),
        d.process(i),
        p.process(i),
        l.process(i),
        c.process(i),
        (i.isProcessing = !1),
        n && t && ((r = !1), e(f));
    },
    m = () => {
      (n = !0), (r = !0), i.isProcessing || e(f);
    };
  return {
    schedule: uo.reduce((h, g) => {
      const y = o[g];
      return (h[g] = (x, S = !1, T = !1) => (n || m(), y.schedule(x, S, T))), h;
    }, {}),
    cancel: (h) => {
      for (let g = 0; g < uo.length; g++) o[uo[g]].cancel(h);
    },
    state: i,
    steps: o,
  };
}
const {
    schedule: Q,
    cancel: on,
    state: Ce,
    steps: ya,
  } = K1(typeof requestAnimationFrame < "u" ? requestAnimationFrame : Ee, !0),
  Y1 = (e) => /^0[^.\s]+$/u.test(e);
function n2(e) {
  return typeof e == "number"
    ? e === 0
    : e !== null
    ? e === "none" || e === "0" || Y1(e)
    : !0;
}
let r2 = Ee,
  X1 = Ee;
const Z1 = (e) => /^-?(?:\d+(?:\.\d+)?|\.\d+)$/u.test(e),
  Q1 = (e) => (t) => typeof t == "string" && t.startsWith(e),
  q1 = Q1("--"),
  i2 = Q1("var(--"),
  td = (e) => (i2(e) ? s2.test(e.split("/*")[0].trim()) : !1),
  s2 =
    /var\(--(?:[\w-]+\s*|[\w-]+\s*,(?:\s*[^)(\s]|\s*\((?:[^)(]|\([^)(]*\))*\))+\s*)\)$/iu,
  o2 = /^var\(--(?:([\w-]+)|([\w-]+), ?([a-zA-Z\d ()%#.,-]+))\)/u;
function l2(e) {
  const t = o2.exec(e);
  if (!t) return [,];
  const [, n, r, i] = t;
  return [`--${n ?? r}`, i];
}
function J1(e, t, n = 1) {
  const [r, i] = l2(e);
  if (!r) return;
  const s = window.getComputedStyle(t).getPropertyValue(r);
  if (s) {
    const o = s.trim();
    return Z1(o) ? parseFloat(o) : o;
  }
  return td(i) ? J1(i, t, n + 1) : i;
}
const On = (e, t, n) => (n > t ? t : n < e ? e : n),
  pi = {
    test: (e) => typeof e == "number",
    parse: parseFloat,
    transform: (e) => e,
  },
  ts = { ...pi, transform: (e) => On(0, 1, e) },
  co = { ...pi, default: 1 },
  ns = (e) => Math.round(e * 1e5) / 1e5,
  nd = /-?(?:\d+(?:\.\d+)?|\.\d+)/gu,
  a2 =
    /(?:#[\da-f]{3,8}|(?:rgb|hsl)a?\((?:-?[\d.]+%?[,\s]+){2}-?[\d.]+%?\s*(?:[,/]\s*)?(?:\b\d+(?:\.\d+)?|\.\d+)?%?\))/giu,
  u2 =
    /^(?:#[\da-f]{3,8}|(?:rgb|hsl)a?\((?:-?[\d.]+%?[,\s]+){2}-?[\d.]+%?\s*(?:[,/]\s*)?(?:\b\d+(?:\.\d+)?|\.\d+)?%?\))$/iu;
function Is(e) {
  return typeof e == "string";
}
function c2(e) {
  return e == null;
}
const Ns = (e) => ({
    test: (t) => Is(t) && t.endsWith(e) && t.split(" ").length === 1,
    parse: parseFloat,
    transform: (t) => `${t}${e}`,
  }),
  hn = Ns("deg"),
  Nt = Ns("%"),
  F = Ns("px"),
  d2 = Ns("vh"),
  f2 = Ns("vw"),
  Yf = {
    ...Nt,
    parse: (e) => Nt.parse(e) / 100,
    transform: (e) => Nt.transform(e * 100),
  },
  p2 = new Set([
    "width",
    "height",
    "top",
    "left",
    "right",
    "bottom",
    "x",
    "y",
    "translateX",
    "translateY",
  ]),
  Xf = (e) => e === pi || e === F,
  Zf = (e, t) => parseFloat(e.split(", ")[t]),
  Qf =
    (e, t) =>
    (n, { transform: r }) => {
      if (r === "none" || !r) return 0;
      const i = r.match(/^matrix3d\((.+)\)$/u);
      if (i) return Zf(i[1], t);
      {
        const s = r.match(/^matrix\((.+)\)$/u);
        return s ? Zf(s[1], e) : 0;
      }
    },
  h2 = new Set(["x", "y", "z"]),
  m2 = Vs.filter((e) => !h2.has(e));
function g2(e) {
  const t = [];
  return (
    m2.forEach((n) => {
      const r = e.getValue(n);
      r !== void 0 &&
        (t.push([n, r.get()]), r.set(n.startsWith("scale") ? 1 : 0));
    }),
    t
  );
}
const si = {
  width: ({ x: e }, { paddingLeft: t = "0", paddingRight: n = "0" }) =>
    e.max - e.min - parseFloat(t) - parseFloat(n),
  height: ({ y: e }, { paddingTop: t = "0", paddingBottom: n = "0" }) =>
    e.max - e.min - parseFloat(t) - parseFloat(n),
  top: (e, { top: t }) => parseFloat(t),
  left: (e, { left: t }) => parseFloat(t),
  bottom: ({ y: e }, { top: t }) => parseFloat(t) + (e.max - e.min),
  right: ({ x: e }, { left: t }) => parseFloat(t) + (e.max - e.min),
  x: Qf(4, 13),
  y: Qf(5, 14),
};
si.translateX = si.x;
si.translateY = si.y;
const e0 = (e) => (t) => t.test(e),
  v2 = { test: (e) => e === "auto", parse: (e) => e },
  t0 = [pi, F, Nt, hn, f2, d2, v2],
  qf = (e) => t0.find(e0(e)),
  rr = new Set();
let Vu = !1,
  Iu = !1;
function n0() {
  if (Iu) {
    const e = Array.from(rr).filter((r) => r.needsMeasurement),
      t = new Set(e.map((r) => r.element)),
      n = new Map();
    t.forEach((r) => {
      const i = g2(r);
      i.length && (n.set(r, i), r.render());
    }),
      e.forEach((r) => r.measureInitialState()),
      t.forEach((r) => {
        r.render();
        const i = n.get(r);
        i &&
          i.forEach(([s, o]) => {
            var u;
            (u = r.getValue(s)) === null || u === void 0 || u.set(o);
          });
      }),
      e.forEach((r) => r.measureEndState()),
      e.forEach((r) => {
        r.suspendedScrollY !== void 0 && window.scrollTo(0, r.suspendedScrollY);
      });
  }
  (Iu = !1), (Vu = !1), rr.forEach((e) => e.complete()), rr.clear();
}
function r0() {
  rr.forEach((e) => {
    e.readKeyframes(), e.needsMeasurement && (Iu = !0);
  });
}
function y2() {
  r0(), n0();
}
class rd {
  constructor(t, n, r, i, s, o = !1) {
    (this.isComplete = !1),
      (this.isAsync = !1),
      (this.needsMeasurement = !1),
      (this.isScheduled = !1),
      (this.unresolvedKeyframes = [...t]),
      (this.onComplete = n),
      (this.name = r),
      (this.motionValue = i),
      (this.element = s),
      (this.isAsync = o);
  }
  scheduleResolve() {
    (this.isScheduled = !0),
      this.isAsync
        ? (rr.add(this), Vu || ((Vu = !0), Q.read(r0), Q.resolveKeyframes(n0)))
        : (this.readKeyframes(), this.complete());
  }
  readKeyframes() {
    const {
      unresolvedKeyframes: t,
      name: n,
      element: r,
      motionValue: i,
    } = this;
    for (let s = 0; s < t.length; s++)
      if (t[s] === null)
        if (s === 0) {
          const o = i == null ? void 0 : i.get(),
            u = t[t.length - 1];
          if (o !== void 0) t[0] = o;
          else if (r && n) {
            const a = r.readValue(n, u);
            a != null && (t[0] = a);
          }
          t[0] === void 0 && (t[0] = u), i && o === void 0 && i.set(t[0]);
        } else t[s] = t[s - 1];
  }
  setFinalKeyframe() {}
  measureInitialState() {}
  renderEndStyles() {}
  measureEndState() {}
  complete() {
    (this.isComplete = !0),
      this.onComplete(this.unresolvedKeyframes, this.finalKeyframe),
      rr.delete(this);
  }
  cancel() {
    this.isComplete || ((this.isScheduled = !1), rr.delete(this));
  }
  resume() {
    this.isComplete || this.scheduleResolve();
  }
}
const id = (e, t) => (n) =>
    !!(
      (Is(n) && u2.test(n) && n.startsWith(e)) ||
      (t && !c2(n) && Object.prototype.hasOwnProperty.call(n, t))
    ),
  i0 = (e, t, n) => (r) => {
    if (!Is(r)) return r;
    const [i, s, o, u] = r.match(nd);
    return {
      [e]: parseFloat(i),
      [t]: parseFloat(s),
      [n]: parseFloat(o),
      alpha: u !== void 0 ? parseFloat(u) : 1,
    };
  },
  w2 = (e) => On(0, 255, e),
  wa = { ...pi, transform: (e) => Math.round(w2(e)) },
  er = {
    test: id("rgb", "red"),
    parse: i0("red", "green", "blue"),
    transform: ({ red: e, green: t, blue: n, alpha: r = 1 }) =>
      "rgba(" +
      wa.transform(e) +
      ", " +
      wa.transform(t) +
      ", " +
      wa.transform(n) +
      ", " +
      ns(ts.transform(r)) +
      ")",
  };
function x2(e) {
  let t = "",
    n = "",
    r = "",
    i = "";
  return (
    e.length > 5
      ? ((t = e.substring(1, 3)),
        (n = e.substring(3, 5)),
        (r = e.substring(5, 7)),
        (i = e.substring(7, 9)))
      : ((t = e.substring(1, 2)),
        (n = e.substring(2, 3)),
        (r = e.substring(3, 4)),
        (i = e.substring(4, 5)),
        (t += t),
        (n += n),
        (r += r),
        (i += i)),
    {
      red: parseInt(t, 16),
      green: parseInt(n, 16),
      blue: parseInt(r, 16),
      alpha: i ? parseInt(i, 16) / 255 : 1,
    }
  );
}
const Nu = { test: id("#"), parse: x2, transform: er.transform },
  jr = {
    test: id("hsl", "hue"),
    parse: i0("hue", "saturation", "lightness"),
    transform: ({ hue: e, saturation: t, lightness: n, alpha: r = 1 }) =>
      "hsla(" +
      Math.round(e) +
      ", " +
      Nt.transform(ns(t)) +
      ", " +
      Nt.transform(ns(n)) +
      ", " +
      ns(ts.transform(r)) +
      ")",
  },
  be = {
    test: (e) => er.test(e) || Nu.test(e) || jr.test(e),
    parse: (e) =>
      er.test(e) ? er.parse(e) : jr.test(e) ? jr.parse(e) : Nu.parse(e),
    transform: (e) =>
      Is(e) ? e : e.hasOwnProperty("red") ? er.transform(e) : jr.transform(e),
  };
function S2(e) {
  var t, n;
  return (
    isNaN(e) &&
    Is(e) &&
    (((t = e.match(nd)) === null || t === void 0 ? void 0 : t.length) || 0) +
      (((n = e.match(a2)) === null || n === void 0 ? void 0 : n.length) || 0) >
      0
  );
}
const s0 = "number",
  o0 = "color",
  _2 = "var",
  C2 = "var(",
  Jf = "${}",
  T2 =
    /var\s*\(\s*--(?:[\w-]+\s*|[\w-]+\s*,(?:\s*[^)(\s]|\s*\((?:[^)(]|\([^)(]*\))*\))+\s*)\)|#[\da-f]{3,8}|(?:rgb|hsl)a?\((?:-?[\d.]+%?[,\s]+){2}-?[\d.]+%?\s*(?:[,/]\s*)?(?:\b\d+(?:\.\d+)?|\.\d+)?%?\)|-?(?:\d+(?:\.\d+)?|\.\d+)/giu;
function Es(e) {
  const t = e.toString(),
    n = [],
    r = { color: [], number: [], var: [] },
    i = [];
  let s = 0;
  const u = t
    .replace(
      T2,
      (a) => (
        be.test(a)
          ? (r.color.push(s), i.push(o0), n.push(be.parse(a)))
          : a.startsWith(C2)
          ? (r.var.push(s), i.push(_2), n.push(a))
          : (r.number.push(s), i.push(s0), n.push(parseFloat(a))),
        ++s,
        Jf
      )
    )
    .split(Jf);
  return { values: n, split: u, indexes: r, types: i };
}
function l0(e) {
  return Es(e).values;
}
function a0(e) {
  const { split: t, types: n } = Es(e),
    r = t.length;
  return (i) => {
    let s = "";
    for (let o = 0; o < r; o++)
      if (((s += t[o]), i[o] !== void 0)) {
        const u = n[o];
        u === s0
          ? (s += ns(i[o]))
          : u === o0
          ? (s += be.transform(i[o]))
          : (s += i[o]);
      }
    return s;
  };
}
const E2 = (e) => (typeof e == "number" ? 0 : e);
function P2(e) {
  const t = l0(e);
  return a0(e)(t.map(E2));
}
const Dn = {
    test: S2,
    parse: l0,
    createTransformer: a0,
    getAnimatableNone: P2,
  },
  A2 = new Set(["brightness", "contrast", "saturate", "opacity"]);
function k2(e) {
  const [t, n] = e.slice(0, -1).split("(");
  if (t === "drop-shadow") return e;
  const [r] = n.match(nd) || [];
  if (!r) return e;
  const i = n.replace(r, "");
  let s = A2.has(t) ? 1 : 0;
  return r !== n && (s *= 100), t + "(" + s + i + ")";
}
const M2 = /\b([a-z-]*)\(.*?\)/gu,
  ju = {
    ...Dn,
    getAnimatableNone: (e) => {
      const t = e.match(M2);
      return t ? t.map(k2).join(" ") : e;
    },
  },
  ep = { ...pi, transform: Math.round },
  sd = {
    borderWidth: F,
    borderTopWidth: F,
    borderRightWidth: F,
    borderBottomWidth: F,
    borderLeftWidth: F,
    borderRadius: F,
    radius: F,
    borderTopLeftRadius: F,
    borderTopRightRadius: F,
    borderBottomRightRadius: F,
    borderBottomLeftRadius: F,
    width: F,
    maxWidth: F,
    height: F,
    maxHeight: F,
    size: F,
    top: F,
    right: F,
    bottom: F,
    left: F,
    padding: F,
    paddingTop: F,
    paddingRight: F,
    paddingBottom: F,
    paddingLeft: F,
    margin: F,
    marginTop: F,
    marginRight: F,
    marginBottom: F,
    marginLeft: F,
    rotate: hn,
    rotateX: hn,
    rotateY: hn,
    rotateZ: hn,
    scale: co,
    scaleX: co,
    scaleY: co,
    scaleZ: co,
    skew: hn,
    skewX: hn,
    skewY: hn,
    distance: F,
    translateX: F,
    translateY: F,
    translateZ: F,
    x: F,
    y: F,
    z: F,
    perspective: F,
    transformPerspective: F,
    opacity: ts,
    originX: Yf,
    originY: Yf,
    originZ: F,
    zIndex: ep,
    backgroundPositionX: F,
    backgroundPositionY: F,
    fillOpacity: ts,
    strokeOpacity: ts,
    numOctaves: ep,
  },
  b2 = {
    ...sd,
    color: be,
    backgroundColor: be,
    outlineColor: be,
    fill: be,
    stroke: be,
    borderColor: be,
    borderTopColor: be,
    borderRightColor: be,
    borderBottomColor: be,
    borderLeftColor: be,
    filter: ju,
    WebkitFilter: ju,
  },
  od = (e) => b2[e];
function u0(e, t) {
  let n = od(e);
  return (
    n !== ju && (n = Dn), n.getAnimatableNone ? n.getAnimatableNone(t) : void 0
  );
}
const L2 = new Set(["auto", "none", "0"]);
function O2(e, t, n) {
  let r = 0,
    i;
  for (; r < e.length && !i; ) {
    const s = e[r];
    typeof s == "string" && !L2.has(s) && Es(s).values.length && (i = e[r]),
      r++;
  }
  if (i && n) for (const s of t) e[s] = u0(n, i);
}
class c0 extends rd {
  constructor(t, n, r, i, s) {
    super(t, n, r, i, s, !0);
  }
  readKeyframes() {
    const { unresolvedKeyframes: t, element: n, name: r } = this;
    if (!n || !n.current) return;
    super.readKeyframes();
    for (let a = 0; a < t.length; a++) {
      let d = t[a];
      if (typeof d == "string" && ((d = d.trim()), td(d))) {
        const p = J1(d, n.current);
        p !== void 0 && (t[a] = p),
          a === t.length - 1 && (this.finalKeyframe = d);
      }
    }
    if ((this.resolveNoneKeyframes(), !p2.has(r) || t.length !== 2)) return;
    const [i, s] = t,
      o = qf(i),
      u = qf(s);
    if (o !== u)
      if (Xf(o) && Xf(u))
        for (let a = 0; a < t.length; a++) {
          const d = t[a];
          typeof d == "string" && (t[a] = parseFloat(d));
        }
      else this.needsMeasurement = !0;
  }
  resolveNoneKeyframes() {
    const { unresolvedKeyframes: t, name: n } = this,
      r = [];
    for (let i = 0; i < t.length; i++) n2(t[i]) && r.push(i);
    r.length && O2(t, r, n);
  }
  measureInitialState() {
    const { element: t, unresolvedKeyframes: n, name: r } = this;
    if (!t || !t.current) return;
    r === "height" && (this.suspendedScrollY = window.pageYOffset),
      (this.measuredOrigin = si[r](
        t.measureViewportBox(),
        window.getComputedStyle(t.current)
      )),
      (n[0] = this.measuredOrigin);
    const i = n[n.length - 1];
    i !== void 0 && t.getValue(r, i).jump(i, !1);
  }
  measureEndState() {
    var t;
    const { element: n, name: r, unresolvedKeyframes: i } = this;
    if (!n || !n.current) return;
    const s = n.getValue(r);
    s && s.jump(this.measuredOrigin, !1);
    const o = i.length - 1,
      u = i[o];
    (i[o] = si[r](n.measureViewportBox(), window.getComputedStyle(n.current))),
      u !== null && this.finalKeyframe === void 0 && (this.finalKeyframe = u),
      !((t = this.removedTransforms) === null || t === void 0) &&
        t.length &&
        this.removedTransforms.forEach(([a, d]) => {
          n.getValue(a).set(d);
        }),
      this.resolveNoneKeyframes();
  }
}
function d0(e) {
  let t;
  return () => (t === void 0 && (t = e()), t);
}
let Mo;
function D2() {
  Mo = void 0;
}
const Qt = {
    now: () => (
      Mo === void 0 &&
        Qt.set(
          Ce.isProcessing || qw.useManualTiming
            ? Ce.timestamp
            : performance.now()
        ),
      Mo
    ),
    set: (e) => {
      (Mo = e), queueMicrotask(D2);
    },
  },
  tp = (e, t) =>
    t === "zIndex"
      ? !1
      : !!(
          typeof e == "number" ||
          Array.isArray(e) ||
          (typeof e == "string" &&
            (Dn.test(e) || e === "0") &&
            !e.startsWith("url("))
        );
function R2(e) {
  const t = e[0];
  if (e.length === 1) return !0;
  for (let n = 0; n < e.length; n++) if (e[n] !== t) return !0;
}
function V2(e, t, n, r) {
  const i = e[0];
  if (i === null) return !1;
  if (t === "display" || t === "visibility") return !0;
  const s = e[e.length - 1],
    o = tp(i, t),
    u = tp(s, t);
  return !o || !u ? !1 : R2(e) || (n === "spring" && r);
}
const I2 = 40;
class f0 {
  constructor({
    autoplay: t = !0,
    delay: n = 0,
    type: r = "keyframes",
    repeat: i = 0,
    repeatDelay: s = 0,
    repeatType: o = "loop",
    ...u
  }) {
    (this.isStopped = !1),
      (this.hasAttemptedResolve = !1),
      (this.createdAt = Qt.now()),
      (this.options = {
        autoplay: t,
        delay: n,
        type: r,
        repeat: i,
        repeatDelay: s,
        repeatType: o,
        ...u,
      }),
      this.updateFinishedPromise();
  }
  calcStartTime() {
    return this.resolvedAt
      ? this.resolvedAt - this.createdAt > I2
        ? this.resolvedAt
        : this.createdAt
      : this.createdAt;
  }
  get resolved() {
    return !this._resolved && !this.hasAttemptedResolve && y2(), this._resolved;
  }
  onKeyframesResolved(t, n) {
    (this.resolvedAt = Qt.now()), (this.hasAttemptedResolve = !0);
    const {
      name: r,
      type: i,
      velocity: s,
      delay: o,
      onComplete: u,
      onUpdate: a,
      isGenerator: d,
    } = this.options;
    if (!d && !V2(t, r, i, s))
      if (o) this.options.duration = 0;
      else {
        a == null || a(Ol(t, this.options, n)),
          u == null || u(),
          this.resolveFinishedPromise();
        return;
      }
    const p = this.initPlayback(t, n);
    p !== !1 &&
      ((this._resolved = { keyframes: t, finalKeyframe: n, ...p }),
      this.onPostResolved());
  }
  onPostResolved() {}
  then(t, n) {
    return this.currentFinishedPromise.then(t, n);
  }
  updateFinishedPromise() {
    this.currentFinishedPromise = new Promise((t) => {
      this.resolveFinishedPromise = t;
    });
  }
}
function p0(e, t) {
  return t ? e * (1e3 / t) : 0;
}
const N2 = 5;
function h0(e, t, n) {
  const r = Math.max(t - N2, 0);
  return p0(n - e(r), t - r);
}
const xa = 0.001,
  j2 = 0.01,
  np = 10,
  F2 = 0.05,
  z2 = 1;
function B2({
  duration: e = 800,
  bounce: t = 0.25,
  velocity: n = 0,
  mass: r = 1,
}) {
  let i, s;
  r2(e <= It(np));
  let o = 1 - t;
  (o = On(F2, z2, o)),
    (e = On(j2, np, Zt(e))),
    o < 1
      ? ((i = (d) => {
          const p = d * o,
            l = p * e,
            c = p - n,
            f = Fu(d, o),
            m = Math.exp(-l);
          return xa - (c / f) * m;
        }),
        (s = (d) => {
          const l = d * o * e,
            c = l * n + n,
            f = Math.pow(o, 2) * Math.pow(d, 2) * e,
            m = Math.exp(-l),
            v = Fu(Math.pow(d, 2), o);
          return ((-i(d) + xa > 0 ? -1 : 1) * ((c - f) * m)) / v;
        }))
      : ((i = (d) => {
          const p = Math.exp(-d * e),
            l = (d - n) * e + 1;
          return -xa + p * l;
        }),
        (s = (d) => {
          const p = Math.exp(-d * e),
            l = (n - d) * (e * e);
          return p * l;
        }));
  const u = 5 / e,
    a = $2(i, s, u);
  if (((e = It(e)), isNaN(a)))
    return { stiffness: 100, damping: 10, duration: e };
  {
    const d = Math.pow(a, 2) * r;
    return { stiffness: d, damping: o * 2 * Math.sqrt(r * d), duration: e };
  }
}
const H2 = 12;
function $2(e, t, n) {
  let r = n;
  for (let i = 1; i < H2; i++) r = r - e(r) / t(r);
  return r;
}
function Fu(e, t) {
  return e * Math.sqrt(1 - t * t);
}
const G2 = ["duration", "bounce"],
  W2 = ["stiffness", "damping", "mass"];
function rp(e, t) {
  return t.some((n) => e[n] !== void 0);
}
function U2(e) {
  let t = {
    velocity: 0,
    stiffness: 100,
    damping: 10,
    mass: 1,
    isResolvedFromDuration: !1,
    ...e,
  };
  if (!rp(e, W2) && rp(e, G2)) {
    const n = B2(e);
    (t = { ...t, ...n, mass: 1 }), (t.isResolvedFromDuration = !0);
  }
  return t;
}
function m0({ keyframes: e, restDelta: t, restSpeed: n, ...r }) {
  const i = e[0],
    s = e[e.length - 1],
    o = { done: !1, value: i },
    {
      stiffness: u,
      damping: a,
      mass: d,
      duration: p,
      velocity: l,
      isResolvedFromDuration: c,
    } = U2({ ...r, velocity: -Zt(r.velocity || 0) }),
    f = l || 0,
    m = a / (2 * Math.sqrt(u * d)),
    v = s - i,
    w = Zt(Math.sqrt(u / d)),
    h = Math.abs(v) < 5;
  n || (n = h ? 0.01 : 2), t || (t = h ? 0.005 : 0.5);
  let g;
  if (m < 1) {
    const y = Fu(w, m);
    g = (x) => {
      const S = Math.exp(-m * w * x);
      return (
        s - S * (((f + m * w * v) / y) * Math.sin(y * x) + v * Math.cos(y * x))
      );
    };
  } else if (m === 1) g = (y) => s - Math.exp(-w * y) * (v + (f + w * v) * y);
  else {
    const y = w * Math.sqrt(m * m - 1);
    g = (x) => {
      const S = Math.exp(-m * w * x),
        T = Math.min(y * x, 300);
      return (
        s - (S * ((f + m * w * v) * Math.sinh(T) + y * v * Math.cosh(T))) / y
      );
    };
  }
  return {
    calculatedDuration: (c && p) || null,
    next: (y) => {
      const x = g(y);
      if (c) o.done = y >= p;
      else {
        let S = 0;
        m < 1 && (S = y === 0 ? It(f) : h0(g, y, x));
        const T = Math.abs(S) <= n,
          M = Math.abs(s - x) <= t;
        o.done = T && M;
      }
      return (o.value = o.done ? s : x), o;
    },
  };
}
function ip({
  keyframes: e,
  velocity: t = 0,
  power: n = 0.8,
  timeConstant: r = 325,
  bounceDamping: i = 10,
  bounceStiffness: s = 500,
  modifyTarget: o,
  min: u,
  max: a,
  restDelta: d = 0.5,
  restSpeed: p,
}) {
  const l = e[0],
    c = { done: !1, value: l },
    f = (E) => (u !== void 0 && E < u) || (a !== void 0 && E > a),
    m = (E) =>
      u === void 0
        ? a
        : a === void 0 || Math.abs(u - E) < Math.abs(a - E)
        ? u
        : a;
  let v = n * t;
  const w = l + v,
    h = o === void 0 ? w : o(w);
  h !== w && (v = h - l);
  const g = (E) => -v * Math.exp(-E / r),
    y = (E) => h + g(E),
    x = (E) => {
      const k = g(E),
        P = y(E);
      (c.done = Math.abs(k) <= d), (c.value = c.done ? h : P);
    };
  let S, T;
  const M = (E) => {
    f(c.value) &&
      ((S = E),
      (T = m0({
        keyframes: [c.value, m(c.value)],
        velocity: h0(y, E, c.value),
        damping: i,
        stiffness: s,
        restDelta: d,
        restSpeed: p,
      })));
  };
  return (
    M(0),
    {
      calculatedDuration: null,
      next: (E) => {
        let k = !1;
        return (
          !T && S === void 0 && ((k = !0), x(E), M(E)),
          S !== void 0 && E >= S ? T.next(E - S) : (!k && x(E), c)
        );
      },
    }
  );
}
const g0 = (e, t, n) =>
    (((1 - 3 * n + 3 * t) * e + (3 * n - 6 * t)) * e + 3 * t) * e,
  K2 = 1e-7,
  Y2 = 12;
function X2(e, t, n, r, i) {
  let s,
    o,
    u = 0;
  do (o = t + (n - t) / 2), (s = g0(o, r, i) - e), s > 0 ? (n = o) : (t = o);
  while (Math.abs(s) > K2 && ++u < Y2);
  return o;
}
function js(e, t, n, r) {
  if (e === t && n === r) return Ee;
  const i = (s) => X2(s, 0, 1, e, n);
  return (s) => (s === 0 || s === 1 ? s : g0(i(s), t, r));
}
const Z2 = js(0.42, 0, 1, 1),
  Q2 = js(0, 0, 0.58, 1),
  v0 = js(0.42, 0, 0.58, 1),
  q2 = (e) => Array.isArray(e) && typeof e[0] != "number",
  y0 = (e) => (t) => t <= 0.5 ? e(2 * t) / 2 : (2 - e(2 * (1 - t))) / 2,
  w0 = (e) => (t) => 1 - e(1 - t),
  ld = (e) => 1 - Math.sin(Math.acos(e)),
  x0 = w0(ld),
  J2 = y0(ld),
  S0 = js(0.33, 1.53, 0.69, 0.99),
  ad = w0(S0),
  e5 = y0(ad),
  t5 = (e) =>
    (e *= 2) < 1 ? 0.5 * ad(e) : 0.5 * (2 - Math.pow(2, -10 * (e - 1))),
  n5 = {
    linear: Ee,
    easeIn: Z2,
    easeInOut: v0,
    easeOut: Q2,
    circIn: ld,
    circInOut: J2,
    circOut: x0,
    backIn: ad,
    backInOut: e5,
    backOut: S0,
    anticipate: t5,
  },
  sp = (e) => {
    if (Array.isArray(e)) {
      X1(e.length === 4);
      const [t, n, r, i] = e;
      return js(t, n, r, i);
    } else if (typeof e == "string") return n5[e];
    return e;
  },
  r5 = (e, t) => (n) => t(e(n)),
  qt = (...e) => e.reduce(r5),
  Ps = (e, t, n) => {
    const r = t - e;
    return r === 0 ? 1 : (n - e) / r;
  },
  ae = (e, t, n) => e + (t - e) * n;
function Sa(e, t, n) {
  return (
    n < 0 && (n += 1),
    n > 1 && (n -= 1),
    n < 1 / 6
      ? e + (t - e) * 6 * n
      : n < 1 / 2
      ? t
      : n < 2 / 3
      ? e + (t - e) * (2 / 3 - n) * 6
      : e
  );
}
function i5({ hue: e, saturation: t, lightness: n, alpha: r }) {
  (e /= 360), (t /= 100), (n /= 100);
  let i = 0,
    s = 0,
    o = 0;
  if (!t) i = s = o = n;
  else {
    const u = n < 0.5 ? n * (1 + t) : n + t - n * t,
      a = 2 * n - u;
    (i = Sa(a, u, e + 1 / 3)), (s = Sa(a, u, e)), (o = Sa(a, u, e - 1 / 3));
  }
  return {
    red: Math.round(i * 255),
    green: Math.round(s * 255),
    blue: Math.round(o * 255),
    alpha: r,
  };
}
function rl(e, t) {
  return (n) => (n > 0 ? t : e);
}
const _a = (e, t, n) => {
    const r = e * e,
      i = n * (t * t - r) + r;
    return i < 0 ? 0 : Math.sqrt(i);
  },
  s5 = [Nu, er, jr],
  o5 = (e) => s5.find((t) => t.test(e));
function op(e) {
  const t = o5(e);
  if (!t) return !1;
  let n = t.parse(e);
  return t === jr && (n = i5(n)), n;
}
const lp = (e, t) => {
    const n = op(e),
      r = op(t);
    if (!n || !r) return rl(e, t);
    const i = { ...n };
    return (s) => (
      (i.red = _a(n.red, r.red, s)),
      (i.green = _a(n.green, r.green, s)),
      (i.blue = _a(n.blue, r.blue, s)),
      (i.alpha = ae(n.alpha, r.alpha, s)),
      er.transform(i)
    );
  },
  zu = new Set(["none", "hidden"]);
function l5(e, t) {
  return zu.has(e) ? (n) => (n <= 0 ? e : t) : (n) => (n >= 1 ? t : e);
}
function a5(e, t) {
  return (n) => ae(e, t, n);
}
function ud(e) {
  return typeof e == "number"
    ? a5
    : typeof e == "string"
    ? td(e)
      ? rl
      : be.test(e)
      ? lp
      : d5
    : Array.isArray(e)
    ? _0
    : typeof e == "object"
    ? be.test(e)
      ? lp
      : u5
    : rl;
}
function _0(e, t) {
  const n = [...e],
    r = n.length,
    i = e.map((s, o) => ud(s)(s, t[o]));
  return (s) => {
    for (let o = 0; o < r; o++) n[o] = i[o](s);
    return n;
  };
}
function u5(e, t) {
  const n = { ...e, ...t },
    r = {};
  for (const i in n)
    e[i] !== void 0 && t[i] !== void 0 && (r[i] = ud(e[i])(e[i], t[i]));
  return (i) => {
    for (const s in r) n[s] = r[s](i);
    return n;
  };
}
function c5(e, t) {
  var n;
  const r = [],
    i = { color: 0, var: 0, number: 0 };
  for (let s = 0; s < t.values.length; s++) {
    const o = t.types[s],
      u = e.indexes[o][i[o]],
      a = (n = e.values[u]) !== null && n !== void 0 ? n : 0;
    (r[s] = a), i[o]++;
  }
  return r;
}
const d5 = (e, t) => {
  const n = Dn.createTransformer(t),
    r = Es(e),
    i = Es(t);
  return r.indexes.var.length === i.indexes.var.length &&
    r.indexes.color.length === i.indexes.color.length &&
    r.indexes.number.length >= i.indexes.number.length
    ? (zu.has(e) && !i.values.length) || (zu.has(t) && !r.values.length)
      ? l5(e, t)
      : qt(_0(c5(r, i), i.values), n)
    : rl(e, t);
};
function C0(e, t, n) {
  return typeof e == "number" && typeof t == "number" && typeof n == "number"
    ? ae(e, t, n)
    : ud(e)(e, t);
}
function f5(e, t, n) {
  const r = [],
    i = n || C0,
    s = e.length - 1;
  for (let o = 0; o < s; o++) {
    let u = i(e[o], e[o + 1]);
    if (t) {
      const a = Array.isArray(t) ? t[o] || Ee : t;
      u = qt(a, u);
    }
    r.push(u);
  }
  return r;
}
function p5(e, t, { clamp: n = !0, ease: r, mixer: i } = {}) {
  const s = e.length;
  if ((X1(s === t.length), s === 1)) return () => t[0];
  if (s === 2 && e[0] === e[1]) return () => t[1];
  e[0] > e[s - 1] && ((e = [...e].reverse()), (t = [...t].reverse()));
  const o = f5(t, r, i),
    u = o.length,
    a = (d) => {
      let p = 0;
      if (u > 1) for (; p < e.length - 2 && !(d < e[p + 1]); p++);
      const l = Ps(e[p], e[p + 1], d);
      return o[p](l);
    };
  return n ? (d) => a(On(e[0], e[s - 1], d)) : a;
}
function h5(e, t) {
  const n = e[e.length - 1];
  for (let r = 1; r <= t; r++) {
    const i = Ps(0, t, r);
    e.push(ae(n, 1, i));
  }
}
function m5(e) {
  const t = [0];
  return h5(t, e.length - 1), t;
}
function g5(e, t) {
  return e.map((n) => n * t);
}
function v5(e, t) {
  return e.map(() => t || v0).splice(0, e.length - 1);
}
function il({
  duration: e = 300,
  keyframes: t,
  times: n,
  ease: r = "easeInOut",
}) {
  const i = q2(r) ? r.map(sp) : sp(r),
    s = { done: !1, value: t[0] },
    o = g5(n && n.length === t.length ? n : m5(t), e),
    u = p5(o, t, { ease: Array.isArray(i) ? i : v5(t, i) });
  return {
    calculatedDuration: e,
    next: (a) => ((s.value = u(a)), (s.done = a >= e), s),
  };
}
const ap = 2e4;
function y5(e) {
  let t = 0;
  const n = 50;
  let r = e.next(t);
  for (; !r.done && t < ap; ) (t += n), (r = e.next(t));
  return t >= ap ? 1 / 0 : t;
}
const w5 = (e) => {
    const t = ({ timestamp: n }) => e(n);
    return {
      start: () => Q.update(t, !0),
      stop: () => on(t),
      now: () => (Ce.isProcessing ? Ce.timestamp : Qt.now()),
    };
  },
  x5 = { decay: ip, inertia: ip, tween: il, keyframes: il, spring: m0 },
  S5 = (e) => e / 100;
class cd extends f0 {
  constructor(t) {
    super(t),
      (this.holdTime = null),
      (this.cancelTime = null),
      (this.currentTime = 0),
      (this.playbackSpeed = 1),
      (this.pendingPlayState = "running"),
      (this.startTime = null),
      (this.state = "idle"),
      (this.stop = () => {
        if (
          (this.resolver.cancel(), (this.isStopped = !0), this.state === "idle")
        )
          return;
        this.teardown();
        const { onStop: a } = this.options;
        a && a();
      });
    const { name: n, motionValue: r, element: i, keyframes: s } = this.options,
      o = (i == null ? void 0 : i.KeyframeResolver) || rd,
      u = (a, d) => this.onKeyframesResolved(a, d);
    (this.resolver = new o(s, u, n, r, i)), this.resolver.scheduleResolve();
  }
  initPlayback(t) {
    const {
        type: n = "keyframes",
        repeat: r = 0,
        repeatDelay: i = 0,
        repeatType: s,
        velocity: o = 0,
      } = this.options,
      u = x5[n] || il;
    let a, d;
    u !== il &&
      typeof t[0] != "number" &&
      ((a = qt(S5, C0(t[0], t[1]))), (t = [0, 100]));
    const p = u({ ...this.options, keyframes: t });
    s === "mirror" &&
      (d = u({ ...this.options, keyframes: [...t].reverse(), velocity: -o })),
      p.calculatedDuration === null && (p.calculatedDuration = y5(p));
    const { calculatedDuration: l } = p,
      c = l + i,
      f = c * (r + 1) - i;
    return {
      generator: p,
      mirroredGenerator: d,
      mapPercentToKeyframes: a,
      calculatedDuration: l,
      resolvedDuration: c,
      totalDuration: f,
    };
  }
  onPostResolved() {
    const { autoplay: t = !0 } = this.options;
    this.play(),
      this.pendingPlayState === "paused" || !t
        ? this.pause()
        : (this.state = this.pendingPlayState);
  }
  tick(t, n = !1) {
    const { resolved: r } = this;
    if (!r) {
      const { keyframes: E } = this.options;
      return { done: !0, value: E[E.length - 1] };
    }
    const {
      finalKeyframe: i,
      generator: s,
      mirroredGenerator: o,
      mapPercentToKeyframes: u,
      keyframes: a,
      calculatedDuration: d,
      totalDuration: p,
      resolvedDuration: l,
    } = r;
    if (this.startTime === null) return s.next(0);
    const {
      delay: c,
      repeat: f,
      repeatType: m,
      repeatDelay: v,
      onUpdate: w,
    } = this.options;
    this.speed > 0
      ? (this.startTime = Math.min(this.startTime, t))
      : this.speed < 0 &&
        (this.startTime = Math.min(t - p / this.speed, this.startTime)),
      n
        ? (this.currentTime = t)
        : this.holdTime !== null
        ? (this.currentTime = this.holdTime)
        : (this.currentTime = Math.round(t - this.startTime) * this.speed);
    const h = this.currentTime - c * (this.speed >= 0 ? 1 : -1),
      g = this.speed >= 0 ? h < 0 : h > p;
    (this.currentTime = Math.max(h, 0)),
      this.state === "finished" &&
        this.holdTime === null &&
        (this.currentTime = p);
    let y = this.currentTime,
      x = s;
    if (f) {
      const E = Math.min(this.currentTime, p) / l;
      let k = Math.floor(E),
        P = E % 1;
      !P && E >= 1 && (P = 1),
        P === 1 && k--,
        (k = Math.min(k, f + 1)),
        !!(k % 2) &&
          (m === "reverse"
            ? ((P = 1 - P), v && (P -= v / l))
            : m === "mirror" && (x = o)),
        (y = On(0, 1, P) * l);
    }
    const S = g ? { done: !1, value: a[0] } : x.next(y);
    u && (S.value = u(S.value));
    let { done: T } = S;
    !g &&
      d !== null &&
      (T = this.speed >= 0 ? this.currentTime >= p : this.currentTime <= 0);
    const M =
      this.holdTime === null &&
      (this.state === "finished" || (this.state === "running" && T));
    return (
      M && i !== void 0 && (S.value = Ol(a, this.options, i)),
      w && w(S.value),
      M && this.finish(),
      S
    );
  }
  get duration() {
    const { resolved: t } = this;
    return t ? Zt(t.calculatedDuration) : 0;
  }
  get time() {
    return Zt(this.currentTime);
  }
  set time(t) {
    (t = It(t)),
      (this.currentTime = t),
      this.holdTime !== null || this.speed === 0
        ? (this.holdTime = t)
        : this.driver && (this.startTime = this.driver.now() - t / this.speed);
  }
  get speed() {
    return this.playbackSpeed;
  }
  set speed(t) {
    const n = this.playbackSpeed !== t;
    (this.playbackSpeed = t), n && (this.time = Zt(this.currentTime));
  }
  play() {
    if (
      (this.resolver.isScheduled || this.resolver.resume(), !this._resolved)
    ) {
      this.pendingPlayState = "running";
      return;
    }
    if (this.isStopped) return;
    const { driver: t = w5, onPlay: n, startTime: r } = this.options;
    this.driver || (this.driver = t((s) => this.tick(s))), n && n();
    const i = this.driver.now();
    this.holdTime !== null
      ? (this.startTime = i - this.holdTime)
      : this.startTime
      ? this.state === "finished" && (this.startTime = i)
      : (this.startTime = r ?? this.calcStartTime()),
      this.state === "finished" && this.updateFinishedPromise(),
      (this.cancelTime = this.startTime),
      (this.holdTime = null),
      (this.state = "running"),
      this.driver.start();
  }
  pause() {
    var t;
    if (!this._resolved) {
      this.pendingPlayState = "paused";
      return;
    }
    (this.state = "paused"),
      (this.holdTime = (t = this.currentTime) !== null && t !== void 0 ? t : 0);
  }
  complete() {
    this.state !== "running" && this.play(),
      (this.pendingPlayState = this.state = "finished"),
      (this.holdTime = null);
  }
  finish() {
    this.teardown(), (this.state = "finished");
    const { onComplete: t } = this.options;
    t && t();
  }
  cancel() {
    this.cancelTime !== null && this.tick(this.cancelTime),
      this.teardown(),
      this.updateFinishedPromise();
  }
  teardown() {
    (this.state = "idle"),
      this.stopDriver(),
      this.resolveFinishedPromise(),
      this.updateFinishedPromise(),
      (this.startTime = this.cancelTime = null),
      this.resolver.cancel();
  }
  stopDriver() {
    this.driver && (this.driver.stop(), (this.driver = void 0));
  }
  sample(t) {
    return (this.startTime = 0), this.tick(t, !0);
  }
}
const T0 = new Set(["opacity", "clipPath", "filter", "transform"]),
  E0 = (e) => Array.isArray(e) && typeof e[0] == "number";
function P0(e) {
  return !!(
    !e ||
    (typeof e == "string" && e in dd) ||
    E0(e) ||
    (Array.isArray(e) && e.every(P0))
  );
}
const Gi = ([e, t, n, r]) => `cubic-bezier(${e}, ${t}, ${n}, ${r})`,
  dd = {
    linear: "linear",
    ease: "ease",
    easeIn: "ease-in",
    easeOut: "ease-out",
    easeInOut: "ease-in-out",
    circIn: Gi([0, 0.65, 0.55, 1]),
    circOut: Gi([0.55, 0, 1, 0.45]),
    backIn: Gi([0.31, 0.01, 0.66, -0.59]),
    backOut: Gi([0.33, 1.53, 0.69, 0.99]),
  };
function _5(e) {
  return A0(e) || dd.easeOut;
}
function A0(e) {
  if (e) return E0(e) ? Gi(e) : Array.isArray(e) ? e.map(_5) : dd[e];
}
function C5(
  e,
  t,
  n,
  {
    delay: r = 0,
    duration: i = 300,
    repeat: s = 0,
    repeatType: o = "loop",
    ease: u,
    times: a,
  } = {}
) {
  const d = { [t]: n };
  a && (d.offset = a);
  const p = A0(u);
  return (
    Array.isArray(p) && (d.easing = p),
    e.animate(d, {
      delay: r,
      duration: i,
      easing: Array.isArray(p) ? "linear" : p,
      fill: "both",
      iterations: s + 1,
      direction: o === "reverse" ? "alternate" : "normal",
    })
  );
}
const T5 = d0(() => Object.hasOwnProperty.call(Element.prototype, "animate")),
  sl = 10,
  E5 = 2e4;
function P5(e) {
  return e.type === "spring" || !P0(e.ease);
}
function A5(e, t) {
  const n = new cd({
    ...t,
    keyframes: e,
    repeat: 0,
    delay: 0,
    isGenerator: !0,
  });
  let r = { done: !1, value: e[0] };
  const i = [];
  let s = 0;
  for (; !r.done && s < E5; ) (r = n.sample(s)), i.push(r.value), (s += sl);
  return { times: void 0, keyframes: i, duration: s - sl, ease: "linear" };
}
class up extends f0 {
  constructor(t) {
    super(t);
    const { name: n, motionValue: r, element: i, keyframes: s } = this.options;
    (this.resolver = new c0(
      s,
      (o, u) => this.onKeyframesResolved(o, u),
      n,
      r,
      i
    )),
      this.resolver.scheduleResolve();
  }
  initPlayback(t, n) {
    var r;
    let {
      duration: i = 300,
      times: s,
      ease: o,
      type: u,
      motionValue: a,
      name: d,
      startTime: p,
    } = this.options;
    if (!(!((r = a.owner) === null || r === void 0) && r.current)) return !1;
    if (P5(this.options)) {
      const {
          onComplete: c,
          onUpdate: f,
          motionValue: m,
          element: v,
          ...w
        } = this.options,
        h = A5(t, w);
      (t = h.keyframes),
        t.length === 1 && (t[1] = t[0]),
        (i = h.duration),
        (s = h.times),
        (o = h.ease),
        (u = "keyframes");
    }
    const l = C5(a.owner.current, d, t, {
      ...this.options,
      duration: i,
      times: s,
      ease: o,
    });
    return (
      (l.startTime = p ?? this.calcStartTime()),
      this.pendingTimeline
        ? ((l.timeline = this.pendingTimeline), (this.pendingTimeline = void 0))
        : (l.onfinish = () => {
            const { onComplete: c } = this.options;
            a.set(Ol(t, this.options, n)),
              c && c(),
              this.cancel(),
              this.resolveFinishedPromise();
          }),
      { animation: l, duration: i, times: s, type: u, ease: o, keyframes: t }
    );
  }
  get duration() {
    const { resolved: t } = this;
    if (!t) return 0;
    const { duration: n } = t;
    return Zt(n);
  }
  get time() {
    const { resolved: t } = this;
    if (!t) return 0;
    const { animation: n } = t;
    return Zt(n.currentTime || 0);
  }
  set time(t) {
    const { resolved: n } = this;
    if (!n) return;
    const { animation: r } = n;
    r.currentTime = It(t);
  }
  get speed() {
    const { resolved: t } = this;
    if (!t) return 1;
    const { animation: n } = t;
    return n.playbackRate;
  }
  set speed(t) {
    const { resolved: n } = this;
    if (!n) return;
    const { animation: r } = n;
    r.playbackRate = t;
  }
  get state() {
    const { resolved: t } = this;
    if (!t) return "idle";
    const { animation: n } = t;
    return n.playState;
  }
  get startTime() {
    const { resolved: t } = this;
    if (!t) return null;
    const { animation: n } = t;
    return n.startTime;
  }
  attachTimeline(t) {
    if (!this._resolved) this.pendingTimeline = t;
    else {
      const { resolved: n } = this;
      if (!n) return Ee;
      const { animation: r } = n;
      (r.timeline = t), (r.onfinish = null);
    }
    return Ee;
  }
  play() {
    if (this.isStopped) return;
    const { resolved: t } = this;
    if (!t) return;
    const { animation: n } = t;
    n.playState === "finished" && this.updateFinishedPromise(), n.play();
  }
  pause() {
    const { resolved: t } = this;
    if (!t) return;
    const { animation: n } = t;
    n.pause();
  }
  stop() {
    if ((this.resolver.cancel(), (this.isStopped = !0), this.state === "idle"))
      return;
    this.resolveFinishedPromise(), this.updateFinishedPromise();
    const { resolved: t } = this;
    if (!t) return;
    const {
      animation: n,
      keyframes: r,
      duration: i,
      type: s,
      ease: o,
      times: u,
    } = t;
    if (n.playState === "idle" || n.playState === "finished") return;
    if (this.time) {
      const {
          motionValue: d,
          onUpdate: p,
          onComplete: l,
          element: c,
          ...f
        } = this.options,
        m = new cd({
          ...f,
          keyframes: r,
          duration: i,
          type: s,
          ease: o,
          times: u,
          isGenerator: !0,
        }),
        v = It(this.time);
      d.setWithVelocity(m.sample(v - sl).value, m.sample(v).value, sl);
    }
    const { onStop: a } = this.options;
    a && a(), this.cancel();
  }
  complete() {
    const { resolved: t } = this;
    t && t.animation.finish();
  }
  cancel() {
    const { resolved: t } = this;
    t && t.animation.cancel();
  }
  static supports(t) {
    const {
      motionValue: n,
      name: r,
      repeatDelay: i,
      repeatType: s,
      damping: o,
      type: u,
    } = t;
    return (
      T5() &&
      r &&
      T0.has(r) &&
      n &&
      n.owner &&
      n.owner.current instanceof HTMLElement &&
      !n.owner.getProps().onUpdate &&
      !i &&
      s !== "mirror" &&
      o !== 0 &&
      u !== "inertia"
    );
  }
}
function k5(e, t) {
  let n;
  const r = () => {
    const { currentTime: i } = t,
      o = (i === null ? 0 : i.value) / 100;
    n !== o && e(o), (n = o);
  };
  return Q.update(r, !0), () => on(r);
}
const M5 = d0(() => window.ScrollTimeline !== void 0);
class b5 {
  constructor(t) {
    (this.stop = () => this.runAll("stop")),
      (this.animations = t.filter(Boolean));
  }
  then(t, n) {
    return Promise.all(this.animations).then(t).catch(n);
  }
  getAll(t) {
    return this.animations[0][t];
  }
  setAll(t, n) {
    for (let r = 0; r < this.animations.length; r++) this.animations[r][t] = n;
  }
  attachTimeline(t) {
    const n = this.animations.map((r) => {
      if (M5() && r.attachTimeline) r.attachTimeline(t);
      else
        return (
          r.pause(),
          k5((i) => {
            r.time = r.duration * i;
          }, t)
        );
    });
    return () => {
      n.forEach((r, i) => {
        r && r(), this.animations[i].stop();
      });
    };
  }
  get time() {
    return this.getAll("time");
  }
  set time(t) {
    this.setAll("time", t);
  }
  get speed() {
    return this.getAll("speed");
  }
  set speed(t) {
    this.setAll("speed", t);
  }
  get startTime() {
    return this.getAll("startTime");
  }
  get duration() {
    let t = 0;
    for (let n = 0; n < this.animations.length; n++)
      t = Math.max(t, this.animations[n].duration);
    return t;
  }
  runAll(t) {
    this.animations.forEach((n) => n[t]());
  }
  play() {
    this.runAll("play");
  }
  pause() {
    this.runAll("pause");
  }
  cancel() {
    this.runAll("cancel");
  }
  complete() {
    this.runAll("complete");
  }
}
const fd =
    (e, t, n, r = {}, i, s, o) =>
    (u) => {
      const a = ed(r, e) || {},
        d = a.delay || r.delay || 0;
      let { elapsed: p = 0 } = r;
      p = p - It(d);
      let l = {
        keyframes: Array.isArray(n) ? n : [null, n],
        ease: "easeOut",
        velocity: t.getVelocity(),
        ...a,
        delay: -p,
        onUpdate: (f) => {
          t.set(f), a.onUpdate && a.onUpdate(f);
        },
        onComplete: () => {
          u(), a.onComplete && a.onComplete(), o && o();
        },
        onStop: o,
        name: e,
        motionValue: t,
        element: s ? void 0 : i,
      };
      Qw(a) || (l = { ...l, ...Zw(e, l) }),
        l.duration && (l.duration = It(l.duration)),
        l.repeatDelay && (l.repeatDelay = It(l.repeatDelay)),
        l.from !== void 0 && (l.keyframes[0] = l.from);
      let c = !1;
      if (
        ((l.type === !1 || (l.duration === 0 && !l.repeatDelay)) &&
          ((l.duration = 0), l.delay === 0 && (c = !0)),
        c && !s && t.get() !== void 0)
      ) {
        const f = Ol(l.keyframes, a);
        if (f !== void 0)
          return (
            Q.update(() => {
              l.onUpdate(f), l.onComplete();
            }),
            new b5([])
          );
      }
      return !s && up.supports(l) ? new up(l) : new cd(l);
    },
  L5 = (e) => !!(e && typeof e == "object" && e.mix && e.toValue),
  O5 = (e) => (Ru(e) ? e[e.length - 1] || 0 : e);
function Dl(e, t) {
  e.indexOf(t) === -1 && e.push(t);
}
function Rl(e, t) {
  const n = e.indexOf(t);
  n > -1 && e.splice(n, 1);
}
class pd {
  constructor() {
    this.subscriptions = [];
  }
  add(t) {
    return Dl(this.subscriptions, t), () => Rl(this.subscriptions, t);
  }
  notify(t, n, r) {
    const i = this.subscriptions.length;
    if (i)
      if (i === 1) this.subscriptions[0](t, n, r);
      else
        for (let s = 0; s < i; s++) {
          const o = this.subscriptions[s];
          o && o(t, n, r);
        }
  }
  getSize() {
    return this.subscriptions.length;
  }
  clear() {
    this.subscriptions.length = 0;
  }
}
const cp = 30,
  D5 = (e) => !isNaN(parseFloat(e));
class k0 {
  constructor(t, n = {}) {
    (this.version = "11.5.5"),
      (this.canTrackVelocity = null),
      (this.events = {}),
      (this.updateAndNotify = (r, i = !0) => {
        const s = Qt.now();
        this.updatedAt !== s && this.setPrevFrameValue(),
          (this.prev = this.current),
          this.setCurrent(r),
          this.current !== this.prev &&
            this.events.change &&
            this.events.change.notify(this.current),
          i &&
            this.events.renderRequest &&
            this.events.renderRequest.notify(this.current);
      }),
      (this.hasAnimated = !1),
      this.setCurrent(t),
      (this.owner = n.owner);
  }
  setCurrent(t) {
    (this.current = t),
      (this.updatedAt = Qt.now()),
      this.canTrackVelocity === null &&
        t !== void 0 &&
        (this.canTrackVelocity = D5(this.current));
  }
  setPrevFrameValue(t = this.current) {
    (this.prevFrameValue = t), (this.prevUpdatedAt = this.updatedAt);
  }
  onChange(t) {
    return this.on("change", t);
  }
  on(t, n) {
    this.events[t] || (this.events[t] = new pd());
    const r = this.events[t].add(n);
    return t === "change"
      ? () => {
          r(),
            Q.read(() => {
              this.events.change.getSize() || this.stop();
            });
        }
      : r;
  }
  clearListeners() {
    for (const t in this.events) this.events[t].clear();
  }
  attach(t, n) {
    (this.passiveEffect = t), (this.stopPassiveEffect = n);
  }
  set(t, n = !0) {
    !n || !this.passiveEffect
      ? this.updateAndNotify(t, n)
      : this.passiveEffect(t, this.updateAndNotify);
  }
  setWithVelocity(t, n, r) {
    this.set(n),
      (this.prev = void 0),
      (this.prevFrameValue = t),
      (this.prevUpdatedAt = this.updatedAt - r);
  }
  jump(t, n = !0) {
    this.updateAndNotify(t),
      (this.prev = t),
      (this.prevUpdatedAt = this.prevFrameValue = void 0),
      n && this.stop(),
      this.stopPassiveEffect && this.stopPassiveEffect();
  }
  get() {
    return this.current;
  }
  getPrevious() {
    return this.prev;
  }
  getVelocity() {
    const t = Qt.now();
    if (
      !this.canTrackVelocity ||
      this.prevFrameValue === void 0 ||
      t - this.updatedAt > cp
    )
      return 0;
    const n = Math.min(this.updatedAt - this.prevUpdatedAt, cp);
    return p0(parseFloat(this.current) - parseFloat(this.prevFrameValue), n);
  }
  start(t) {
    return (
      this.stop(),
      new Promise((n) => {
        (this.hasAnimated = !0),
          (this.animation = t(n)),
          this.events.animationStart && this.events.animationStart.notify();
      }).then(() => {
        this.events.animationComplete && this.events.animationComplete.notify(),
          this.clearAnimation();
      })
    );
  }
  stop() {
    this.animation &&
      (this.animation.stop(),
      this.events.animationCancel && this.events.animationCancel.notify()),
      this.clearAnimation();
  }
  isAnimating() {
    return !!this.animation;
  }
  clearAnimation() {
    delete this.animation;
  }
  destroy() {
    this.clearListeners(),
      this.stop(),
      this.stopPassiveEffect && this.stopPassiveEffect();
  }
}
function As(e, t) {
  return new k0(e, t);
}
function R5(e, t, n) {
  e.hasValue(t) ? e.getValue(t).set(n) : e.addValue(t, As(n));
}
function V5(e, t) {
  const n = Ll(e, t);
  let { transitionEnd: r = {}, transition: i = {}, ...s } = n || {};
  s = { ...s, ...r };
  for (const o in s) {
    const u = O5(s[o]);
    R5(e, o, u);
  }
}
const Vl = (e) => e.replace(/([a-z])([A-Z])/gu, "$1-$2").toLowerCase(),
  I5 = "framerAppearId",
  M0 = "data-" + Vl(I5);
function b0(e) {
  return e.props[M0];
}
function L0(e) {
  if (Fn.has(e)) return "transform";
  if (T0.has(e)) return Vl(e);
}
class N5 extends k0 {
  constructor() {
    super(...arguments), (this.output = []), (this.counts = new Map());
  }
  add(t) {
    const n = L0(t);
    if (!n) return;
    const r = this.counts.get(n) || 0;
    this.counts.set(n, r + 1), r === 0 && (this.output.push(n), this.update());
    let i = !1;
    return () => {
      if (i) return;
      i = !0;
      const s = this.counts.get(n) - 1;
      this.counts.set(n, s), s === 0 && (Rl(this.output, n), this.update());
    };
  }
  update() {
    this.set(this.output.length ? this.output.join(", ") : "auto");
  }
}
const Oe = (e) => !!(e && e.getVelocity);
function j5(e) {
  return !!(Oe(e) && e.add);
}
function Bu(e, t) {
  var n;
  if (!e.applyWillChange) return;
  let r = e.getValue("willChange");
  if (
    (!r &&
      !(!((n = e.props.style) === null || n === void 0) && n.willChange) &&
      ((r = new N5("auto")), e.addValue("willChange", r)),
    j5(r))
  )
    return r.add(t);
}
function F5({ protectedKeys: e, needsAnimating: t }, n) {
  const r = e.hasOwnProperty(n) && t[n] !== !0;
  return (t[n] = !1), r;
}
function O0(e, t, { delay: n = 0, transitionOverride: r, type: i } = {}) {
  var s;
  let { transition: o = e.getDefaultTransition(), transitionEnd: u, ...a } = t;
  r && (o = r);
  const d = [],
    p = i && e.animationState && e.animationState.getState()[i];
  for (const l in a) {
    const c = e.getValue(
        l,
        (s = e.latestValues[l]) !== null && s !== void 0 ? s : null
      ),
      f = a[l];
    if (f === void 0 || (p && F5(p, l))) continue;
    const m = { delay: n, ...ed(o || {}, l) };
    let v = !1;
    if (window.MotionHandoffAnimation) {
      const h = b0(e);
      if (h) {
        const g = window.MotionHandoffAnimation(h, l, Q);
        g !== null && ((m.startTime = g), (v = !0));
      }
    }
    c.start(
      fd(
        l,
        c,
        f,
        e.shouldReduceMotion && Fn.has(l) ? { type: !1 } : m,
        e,
        v,
        Bu(e, l)
      )
    );
    const w = c.animation;
    w && d.push(w);
  }
  return (
    u &&
      Promise.all(d).then(() => {
        Q.update(() => {
          u && V5(e, u);
        });
      }),
    d
  );
}
function Hu(e, t, n = {}) {
  var r;
  const i = Ll(
    e,
    t,
    n.type === "exit"
      ? (r = e.presenceContext) === null || r === void 0
        ? void 0
        : r.custom
      : void 0
  );
  let { transition: s = e.getDefaultTransition() || {} } = i || {};
  n.transitionOverride && (s = n.transitionOverride);
  const o = i ? () => Promise.all(O0(e, i, n)) : () => Promise.resolve(),
    u =
      e.variantChildren && e.variantChildren.size
        ? (d = 0) => {
            const {
              delayChildren: p = 0,
              staggerChildren: l,
              staggerDirection: c,
            } = s;
            return z5(e, t, p + d, l, c, n);
          }
        : () => Promise.resolve(),
    { when: a } = s;
  if (a) {
    const [d, p] = a === "beforeChildren" ? [o, u] : [u, o];
    return d().then(() => p());
  } else return Promise.all([o(), u(n.delay)]);
}
function z5(e, t, n = 0, r = 0, i = 1, s) {
  const o = [],
    u = (e.variantChildren.size - 1) * r,
    a = i === 1 ? (d = 0) => d * r : (d = 0) => u - d * r;
  return (
    Array.from(e.variantChildren)
      .sort(B5)
      .forEach((d, p) => {
        d.notify("AnimationStart", t),
          o.push(
            Hu(d, t, { ...s, delay: n + a(p) }).then(() =>
              d.notify("AnimationComplete", t)
            )
          );
      }),
    Promise.all(o)
  );
}
function B5(e, t) {
  return e.sortNodePosition(t);
}
function H5(e, t, n = {}) {
  e.notify("AnimationStart", t);
  let r;
  if (Array.isArray(t)) {
    const i = t.map((s) => Hu(e, s, n));
    r = Promise.all(i);
  } else if (typeof t == "string") r = Hu(e, t, n);
  else {
    const i = typeof t == "function" ? Ll(e, t, n.custom) : t;
    r = Promise.all(O0(e, i, n));
  }
  return r.then(() => {
    e.notify("AnimationComplete", t);
  });
}
const $5 = Jc.length;
function D0(e) {
  if (!e) return;
  if (!e.isControllingVariants) {
    const n = e.parent ? D0(e.parent) || {} : {};
    return e.props.initial !== void 0 && (n.initial = e.props.initial), n;
  }
  const t = {};
  for (let n = 0; n < $5; n++) {
    const r = Jc[n],
      i = e.props[r];
    (Ts(i) || i === !1) && (t[r] = i);
  }
  return t;
}
const G5 = [...qc].reverse(),
  W5 = qc.length;
function U5(e) {
  return (t) =>
    Promise.all(t.map(({ animation: n, options: r }) => H5(e, n, r)));
}
function K5(e) {
  let t = U5(e),
    n = dp(),
    r = !0;
  const i = (a) => (d, p) => {
    var l;
    const c = Ll(
      e,
      p,
      a === "exit"
        ? (l = e.presenceContext) === null || l === void 0
          ? void 0
          : l.custom
        : void 0
    );
    if (c) {
      const { transition: f, transitionEnd: m, ...v } = c;
      d = { ...d, ...v, ...m };
    }
    return d;
  };
  function s(a) {
    t = a(e);
  }
  function o(a) {
    const { props: d } = e,
      p = D0(e.parent) || {},
      l = [],
      c = new Set();
    let f = {},
      m = 1 / 0;
    for (let w = 0; w < W5; w++) {
      const h = G5[w],
        g = n[h],
        y = d[h] !== void 0 ? d[h] : p[h],
        x = Ts(y),
        S = h === a ? g.isActive : null;
      S === !1 && (m = w);
      let T = y === p[h] && y !== d[h] && x;
      if (
        (T && r && e.manuallyAnimateOnMount && (T = !1),
        (g.protectedKeys = { ...f }),
        (!g.isActive && S === null) ||
          (!y && !g.prevProp) ||
          Cs(y) ||
          typeof y == "boolean")
      )
        continue;
      const M = Y5(g.prevProp, y);
      let E = M || (h === a && g.isActive && !T && x) || (w > m && x),
        k = !1;
      const P = Array.isArray(y) ? y : [y];
      let O = P.reduce(i(h), {});
      S === !1 && (O = {});
      const { prevResolvedValues: V = {} } = g,
        R = { ...V, ...O },
        N = ($) => {
          (E = !0),
            c.has($) && ((k = !0), c.delete($)),
            (g.needsAnimating[$] = !0);
          const A = e.getValue($);
          A && (A.liveStyle = !1);
        };
      for (const $ in R) {
        const A = O[$],
          L = V[$];
        if (f.hasOwnProperty($)) continue;
        let D = !1;
        Ru(A) && Ru(L) ? (D = !U1(A, L)) : (D = A !== L),
          D
            ? A != null
              ? N($)
              : c.add($)
            : A !== void 0 && c.has($)
            ? N($)
            : (g.protectedKeys[$] = !0);
      }
      (g.prevProp = y),
        (g.prevResolvedValues = O),
        g.isActive && (f = { ...f, ...O }),
        r && e.blockInitialAnimation && (E = !1),
        E &&
          (!(T && M) || k) &&
          l.push(...P.map(($) => ({ animation: $, options: { type: h } })));
    }
    if (c.size) {
      const w = {};
      c.forEach((h) => {
        const g = e.getBaseTarget(h),
          y = e.getValue(h);
        y && (y.liveStyle = !0), (w[h] = g ?? null);
      }),
        l.push({ animation: w });
    }
    let v = !!l.length;
    return (
      r &&
        (d.initial === !1 || d.initial === d.animate) &&
        !e.manuallyAnimateOnMount &&
        (v = !1),
      (r = !1),
      v ? t(l) : Promise.resolve()
    );
  }
  function u(a, d) {
    var p;
    if (n[a].isActive === d) return Promise.resolve();
    (p = e.variantChildren) === null ||
      p === void 0 ||
      p.forEach((c) => {
        var f;
        return (f = c.animationState) === null || f === void 0
          ? void 0
          : f.setActive(a, d);
      }),
      (n[a].isActive = d);
    const l = o(a);
    for (const c in n) n[c].protectedKeys = {};
    return l;
  }
  return {
    animateChanges: o,
    setActive: u,
    setAnimateFunction: s,
    getState: () => n,
    reset: () => {
      (n = dp()), (r = !0);
    },
  };
}
function Y5(e, t) {
  return typeof t == "string" ? t !== e : Array.isArray(t) ? !U1(t, e) : !1;
}
function Un(e = !1) {
  return {
    isActive: e,
    protectedKeys: {},
    needsAnimating: {},
    prevResolvedValues: {},
  };
}
function dp() {
  return {
    animate: Un(!0),
    whileInView: Un(),
    whileHover: Un(),
    whileTap: Un(),
    whileDrag: Un(),
    whileFocus: Un(),
    exit: Un(),
  };
}
class zn {
  constructor(t) {
    (this.isMounted = !1), (this.node = t);
  }
  update() {}
}
class X5 extends zn {
  constructor(t) {
    super(t), t.animationState || (t.animationState = K5(t));
  }
  updateAnimationControlsSubscription() {
    const { animate: t } = this.node.getProps();
    Cs(t) && (this.unmountControls = t.subscribe(this.node));
  }
  mount() {
    this.updateAnimationControlsSubscription();
  }
  update() {
    const { animate: t } = this.node.getProps(),
      { animate: n } = this.node.prevProps || {};
    t !== n && this.updateAnimationControlsSubscription();
  }
  unmount() {
    var t;
    this.node.animationState.reset(),
      (t = this.unmountControls) === null || t === void 0 || t.call(this);
  }
}
let Z5 = 0;
class Q5 extends zn {
  constructor() {
    super(...arguments), (this.id = Z5++);
  }
  update() {
    if (!this.node.presenceContext) return;
    const { isPresent: t, onExitComplete: n } = this.node.presenceContext,
      { isPresent: r } = this.node.prevPresenceContext || {};
    if (!this.node.animationState || t === r) return;
    const i = this.node.animationState.setActive("exit", !t);
    n && !t && i.then(() => n(this.id));
  }
  mount() {
    const { register: t } = this.node.presenceContext || {};
    t && (this.unmount = t(this.id));
  }
  unmount() {}
}
const q5 = { animation: { Feature: X5 }, exit: { Feature: Q5 } },
  R0 = (e) =>
    e.pointerType === "mouse"
      ? typeof e.button != "number" || e.button <= 0
      : e.isPrimary !== !1;
function Il(e, t = "page") {
  return { point: { x: e[`${t}X`], y: e[`${t}Y`] } };
}
const J5 = (e) => (t) => R0(t) && e(t, Il(t));
function Kt(e, t, n, r = { passive: !0 }) {
  return e.addEventListener(t, n, r), () => e.removeEventListener(t, n);
}
function Jt(e, t, n, r) {
  return Kt(e, t, J5(n), r);
}
const fp = (e, t) => Math.abs(e - t);
function ex(e, t) {
  const n = fp(e.x, t.x),
    r = fp(e.y, t.y);
  return Math.sqrt(n ** 2 + r ** 2);
}
class V0 {
  constructor(
    t,
    n,
    { transformPagePoint: r, contextWindow: i, dragSnapToOrigin: s = !1 } = {}
  ) {
    if (
      ((this.startEvent = null),
      (this.lastMoveEvent = null),
      (this.lastMoveEventInfo = null),
      (this.handlers = {}),
      (this.contextWindow = window),
      (this.updatePoint = () => {
        if (!(this.lastMoveEvent && this.lastMoveEventInfo)) return;
        const l = Ta(this.lastMoveEventInfo, this.history),
          c = this.startEvent !== null,
          f = ex(l.offset, { x: 0, y: 0 }) >= 3;
        if (!c && !f) return;
        const { point: m } = l,
          { timestamp: v } = Ce;
        this.history.push({ ...m, timestamp: v });
        const { onStart: w, onMove: h } = this.handlers;
        c ||
          (w && w(this.lastMoveEvent, l),
          (this.startEvent = this.lastMoveEvent)),
          h && h(this.lastMoveEvent, l);
      }),
      (this.handlePointerMove = (l, c) => {
        (this.lastMoveEvent = l),
          (this.lastMoveEventInfo = Ca(c, this.transformPagePoint)),
          Q.update(this.updatePoint, !0);
      }),
      (this.handlePointerUp = (l, c) => {
        this.end();
        const { onEnd: f, onSessionEnd: m, resumeAnimation: v } = this.handlers;
        if (
          (this.dragSnapToOrigin && v && v(),
          !(this.lastMoveEvent && this.lastMoveEventInfo))
        )
          return;
        const w = Ta(
          l.type === "pointercancel"
            ? this.lastMoveEventInfo
            : Ca(c, this.transformPagePoint),
          this.history
        );
        this.startEvent && f && f(l, w), m && m(l, w);
      }),
      !R0(t))
    )
      return;
    (this.dragSnapToOrigin = s),
      (this.handlers = n),
      (this.transformPagePoint = r),
      (this.contextWindow = i || window);
    const o = Il(t),
      u = Ca(o, this.transformPagePoint),
      { point: a } = u,
      { timestamp: d } = Ce;
    this.history = [{ ...a, timestamp: d }];
    const { onSessionStart: p } = n;
    p && p(t, Ta(u, this.history)),
      (this.removeListeners = qt(
        Jt(this.contextWindow, "pointermove", this.handlePointerMove),
        Jt(this.contextWindow, "pointerup", this.handlePointerUp),
        Jt(this.contextWindow, "pointercancel", this.handlePointerUp)
      ));
  }
  updateHandlers(t) {
    this.handlers = t;
  }
  end() {
    this.removeListeners && this.removeListeners(), on(this.updatePoint);
  }
}
function Ca(e, t) {
  return t ? { point: t(e.point) } : e;
}
function pp(e, t) {
  return { x: e.x - t.x, y: e.y - t.y };
}
function Ta({ point: e }, t) {
  return {
    point: e,
    delta: pp(e, I0(t)),
    offset: pp(e, tx(t)),
    velocity: nx(t, 0.1),
  };
}
function tx(e) {
  return e[0];
}
function I0(e) {
  return e[e.length - 1];
}
function nx(e, t) {
  if (e.length < 2) return { x: 0, y: 0 };
  let n = e.length - 1,
    r = null;
  const i = I0(e);
  for (; n >= 0 && ((r = e[n]), !(i.timestamp - r.timestamp > It(t))); ) n--;
  if (!r) return { x: 0, y: 0 };
  const s = Zt(i.timestamp - r.timestamp);
  if (s === 0) return { x: 0, y: 0 };
  const o = { x: (i.x - r.x) / s, y: (i.y - r.y) / s };
  return o.x === 1 / 0 && (o.x = 0), o.y === 1 / 0 && (o.y = 0), o;
}
function N0(e) {
  let t = null;
  return () => {
    const n = () => {
      t = null;
    };
    return t === null ? ((t = e), n) : !1;
  };
}
const hp = N0("dragHorizontal"),
  mp = N0("dragVertical");
function j0(e) {
  let t = !1;
  if (e === "y") t = mp();
  else if (e === "x") t = hp();
  else {
    const n = hp(),
      r = mp();
    n && r
      ? (t = () => {
          n(), r();
        })
      : (n && n(), r && r());
  }
  return t;
}
function F0() {
  const e = j0(!0);
  return e ? (e(), !1) : !0;
}
function Fr(e) {
  return (
    e &&
    typeof e == "object" &&
    Object.prototype.hasOwnProperty.call(e, "current")
  );
}
const z0 = 1e-4,
  rx = 1 - z0,
  ix = 1 + z0,
  B0 = 0.01,
  sx = 0 - B0,
  ox = 0 + B0;
function et(e) {
  return e.max - e.min;
}
function lx(e, t, n) {
  return Math.abs(e - t) <= n;
}
function gp(e, t, n, r = 0.5) {
  (e.origin = r),
    (e.originPoint = ae(t.min, t.max, e.origin)),
    (e.scale = et(n) / et(t)),
    (e.translate = ae(n.min, n.max, e.origin) - e.originPoint),
    ((e.scale >= rx && e.scale <= ix) || isNaN(e.scale)) && (e.scale = 1),
    ((e.translate >= sx && e.translate <= ox) || isNaN(e.translate)) &&
      (e.translate = 0);
}
function rs(e, t, n, r) {
  gp(e.x, t.x, n.x, r ? r.originX : void 0),
    gp(e.y, t.y, n.y, r ? r.originY : void 0);
}
function vp(e, t, n) {
  (e.min = n.min + t.min), (e.max = e.min + et(t));
}
function ax(e, t, n) {
  vp(e.x, t.x, n.x), vp(e.y, t.y, n.y);
}
function yp(e, t, n) {
  (e.min = t.min - n.min), (e.max = e.min + et(t));
}
function is(e, t, n) {
  yp(e.x, t.x, n.x), yp(e.y, t.y, n.y);
}
function ux(e, { min: t, max: n }, r) {
  return (
    t !== void 0 && e < t
      ? (e = r ? ae(t, e, r.min) : Math.max(e, t))
      : n !== void 0 && e > n && (e = r ? ae(n, e, r.max) : Math.min(e, n)),
    e
  );
}
function wp(e, t, n) {
  return {
    min: t !== void 0 ? e.min + t : void 0,
    max: n !== void 0 ? e.max + n - (e.max - e.min) : void 0,
  };
}
function cx(e, { top: t, left: n, bottom: r, right: i }) {
  return { x: wp(e.x, n, i), y: wp(e.y, t, r) };
}
function xp(e, t) {
  let n = t.min - e.min,
    r = t.max - e.max;
  return t.max - t.min < e.max - e.min && ([n, r] = [r, n]), { min: n, max: r };
}
function dx(e, t) {
  return { x: xp(e.x, t.x), y: xp(e.y, t.y) };
}
function fx(e, t) {
  let n = 0.5;
  const r = et(e),
    i = et(t);
  return (
    i > r
      ? (n = Ps(t.min, t.max - r, e.min))
      : r > i && (n = Ps(e.min, e.max - i, t.min)),
    On(0, 1, n)
  );
}
function px(e, t) {
  const n = {};
  return (
    t.min !== void 0 && (n.min = t.min - e.min),
    t.max !== void 0 && (n.max = t.max - e.min),
    n
  );
}
const $u = 0.35;
function hx(e = $u) {
  return (
    e === !1 ? (e = 0) : e === !0 && (e = $u),
    { x: Sp(e, "left", "right"), y: Sp(e, "top", "bottom") }
  );
}
function Sp(e, t, n) {
  return { min: _p(e, t), max: _p(e, n) };
}
function _p(e, t) {
  return typeof e == "number" ? e : e[t] || 0;
}
const Cp = () => ({ translate: 0, scale: 1, origin: 0, originPoint: 0 }),
  zr = () => ({ x: Cp(), y: Cp() }),
  Tp = () => ({ min: 0, max: 0 }),
  fe = () => ({ x: Tp(), y: Tp() });
function ut(e) {
  return [e("x"), e("y")];
}
function H0({ top: e, left: t, right: n, bottom: r }) {
  return { x: { min: t, max: n }, y: { min: e, max: r } };
}
function mx({ x: e, y: t }) {
  return { top: t.min, right: e.max, bottom: t.max, left: e.min };
}
function gx(e, t) {
  if (!t) return e;
  const n = t({ x: e.left, y: e.top }),
    r = t({ x: e.right, y: e.bottom });
  return { top: n.y, left: n.x, bottom: r.y, right: r.x };
}
function Ea(e) {
  return e === void 0 || e === 1;
}
function Gu({ scale: e, scaleX: t, scaleY: n }) {
  return !Ea(e) || !Ea(t) || !Ea(n);
}
function Xn(e) {
  return (
    Gu(e) ||
    $0(e) ||
    e.z ||
    e.rotate ||
    e.rotateX ||
    e.rotateY ||
    e.skewX ||
    e.skewY
  );
}
function $0(e) {
  return Ep(e.x) || Ep(e.y);
}
function Ep(e) {
  return e && e !== "0%";
}
function ol(e, t, n) {
  const r = e - n,
    i = t * r;
  return n + i;
}
function Pp(e, t, n, r, i) {
  return i !== void 0 && (e = ol(e, i, r)), ol(e, n, r) + t;
}
function Wu(e, t = 0, n = 1, r, i) {
  (e.min = Pp(e.min, t, n, r, i)), (e.max = Pp(e.max, t, n, r, i));
}
function G0(e, { x: t, y: n }) {
  Wu(e.x, t.translate, t.scale, t.originPoint),
    Wu(e.y, n.translate, n.scale, n.originPoint);
}
const Ap = 0.999999999999,
  kp = 1.0000000000001;
function vx(e, t, n, r = !1) {
  const i = n.length;
  if (!i) return;
  t.x = t.y = 1;
  let s, o;
  for (let u = 0; u < i; u++) {
    (s = n[u]), (o = s.projectionDelta);
    const { visualElement: a } = s.options;
    (a && a.props.style && a.props.style.display === "contents") ||
      (r &&
        s.options.layoutScroll &&
        s.scroll &&
        s !== s.root &&
        Hr(e, { x: -s.scroll.offset.x, y: -s.scroll.offset.y }),
      o && ((t.x *= o.x.scale), (t.y *= o.y.scale), G0(e, o)),
      r && Xn(s.latestValues) && Hr(e, s.latestValues));
  }
  t.x < kp && t.x > Ap && (t.x = 1), t.y < kp && t.y > Ap && (t.y = 1);
}
function Br(e, t) {
  (e.min = e.min + t), (e.max = e.max + t);
}
function Mp(e, t, n, r, i = 0.5) {
  const s = ae(e.min, e.max, i);
  Wu(e, t, n, s, r);
}
function Hr(e, t) {
  Mp(e.x, t.x, t.scaleX, t.scale, t.originX),
    Mp(e.y, t.y, t.scaleY, t.scale, t.originY);
}
function W0(e, t) {
  return H0(gx(e.getBoundingClientRect(), t));
}
function yx(e, t, n) {
  const r = W0(e, n),
    { scroll: i } = t;
  return i && (Br(r.x, i.offset.x), Br(r.y, i.offset.y)), r;
}
const U0 = ({ current: e }) => (e ? e.ownerDocument.defaultView : null),
  wx = new WeakMap();
class xx {
  constructor(t) {
    (this.openGlobalLock = null),
      (this.isDragging = !1),
      (this.currentDirection = null),
      (this.originPoint = { x: 0, y: 0 }),
      (this.constraints = !1),
      (this.hasMutatedConstraints = !1),
      (this.elastic = fe()),
      (this.visualElement = t);
  }
  start(t, { snapToCursor: n = !1 } = {}) {
    const { presenceContext: r } = this.visualElement;
    if (r && r.isPresent === !1) return;
    const i = (p) => {
        const { dragSnapToOrigin: l } = this.getProps();
        l ? this.pauseAnimation() : this.stopAnimation(),
          n && this.snapToCursor(Il(p, "page").point);
      },
      s = (p, l) => {
        var c;
        const { drag: f, dragPropagation: m, onDragStart: v } = this.getProps();
        if (
          f &&
          !m &&
          (this.openGlobalLock && this.openGlobalLock(),
          (this.openGlobalLock = j0(f)),
          !this.openGlobalLock)
        )
          return;
        (this.isDragging = !0),
          (this.currentDirection = null),
          this.resolveConstraints(),
          this.visualElement.projection &&
            ((this.visualElement.projection.isAnimationBlocked = !0),
            (this.visualElement.projection.target = void 0)),
          ut((h) => {
            let g = this.getAxisMotionValue(h).get() || 0;
            if (Nt.test(g)) {
              const { projection: y } = this.visualElement;
              if (y && y.layout) {
                const x = y.layout.layoutBox[h];
                x && (g = et(x) * (parseFloat(g) / 100));
              }
            }
            this.originPoint[h] = g;
          }),
          v && Q.postRender(() => v(p, l)),
          (c = this.removeWillChange) === null || c === void 0 || c.call(this),
          (this.removeWillChange = Bu(this.visualElement, "transform"));
        const { animationState: w } = this.visualElement;
        w && w.setActive("whileDrag", !0);
      },
      o = (p, l) => {
        const {
          dragPropagation: c,
          dragDirectionLock: f,
          onDirectionLock: m,
          onDrag: v,
        } = this.getProps();
        if (!c && !this.openGlobalLock) return;
        const { offset: w } = l;
        if (f && this.currentDirection === null) {
          (this.currentDirection = Sx(w)),
            this.currentDirection !== null && m && m(this.currentDirection);
          return;
        }
        this.updateAxis("x", l.point, w),
          this.updateAxis("y", l.point, w),
          this.visualElement.render(),
          v && v(p, l);
      },
      u = (p, l) => this.stop(p, l),
      a = () =>
        ut((p) => {
          var l;
          return (
            this.getAnimationState(p) === "paused" &&
            ((l = this.getAxisMotionValue(p).animation) === null || l === void 0
              ? void 0
              : l.play())
          );
        }),
      { dragSnapToOrigin: d } = this.getProps();
    this.panSession = new V0(
      t,
      {
        onSessionStart: i,
        onStart: s,
        onMove: o,
        onSessionEnd: u,
        resumeAnimation: a,
      },
      {
        transformPagePoint: this.visualElement.getTransformPagePoint(),
        dragSnapToOrigin: d,
        contextWindow: U0(this.visualElement),
      }
    );
  }
  stop(t, n) {
    var r;
    (r = this.removeWillChange) === null || r === void 0 || r.call(this);
    const i = this.isDragging;
    if ((this.cancel(), !i)) return;
    const { velocity: s } = n;
    this.startAnimation(s);
    const { onDragEnd: o } = this.getProps();
    o && Q.postRender(() => o(t, n));
  }
  cancel() {
    this.isDragging = !1;
    const { projection: t, animationState: n } = this.visualElement;
    t && (t.isAnimationBlocked = !1),
      this.panSession && this.panSession.end(),
      (this.panSession = void 0);
    const { dragPropagation: r } = this.getProps();
    !r &&
      this.openGlobalLock &&
      (this.openGlobalLock(), (this.openGlobalLock = null)),
      n && n.setActive("whileDrag", !1);
  }
  updateAxis(t, n, r) {
    const { drag: i } = this.getProps();
    if (!r || !fo(t, i, this.currentDirection)) return;
    const s = this.getAxisMotionValue(t);
    let o = this.originPoint[t] + r[t];
    this.constraints &&
      this.constraints[t] &&
      (o = ux(o, this.constraints[t], this.elastic[t])),
      s.set(o);
  }
  resolveConstraints() {
    var t;
    const { dragConstraints: n, dragElastic: r } = this.getProps(),
      i =
        this.visualElement.projection && !this.visualElement.projection.layout
          ? this.visualElement.projection.measure(!1)
          : (t = this.visualElement.projection) === null || t === void 0
          ? void 0
          : t.layout,
      s = this.constraints;
    n && Fr(n)
      ? this.constraints || (this.constraints = this.resolveRefConstraints())
      : n && i
      ? (this.constraints = cx(i.layoutBox, n))
      : (this.constraints = !1),
      (this.elastic = hx(r)),
      s !== this.constraints &&
        i &&
        this.constraints &&
        !this.hasMutatedConstraints &&
        ut((o) => {
          this.constraints !== !1 &&
            this.getAxisMotionValue(o) &&
            (this.constraints[o] = px(i.layoutBox[o], this.constraints[o]));
        });
  }
  resolveRefConstraints() {
    const { dragConstraints: t, onMeasureDragConstraints: n } = this.getProps();
    if (!t || !Fr(t)) return !1;
    const r = t.current,
      { projection: i } = this.visualElement;
    if (!i || !i.layout) return !1;
    const s = yx(r, i.root, this.visualElement.getTransformPagePoint());
    let o = dx(i.layout.layoutBox, s);
    if (n) {
      const u = n(mx(o));
      (this.hasMutatedConstraints = !!u), u && (o = H0(u));
    }
    return o;
  }
  startAnimation(t) {
    const {
        drag: n,
        dragMomentum: r,
        dragElastic: i,
        dragTransition: s,
        dragSnapToOrigin: o,
        onDragTransitionEnd: u,
      } = this.getProps(),
      a = this.constraints || {},
      d = ut((p) => {
        if (!fo(p, n, this.currentDirection)) return;
        let l = (a && a[p]) || {};
        o && (l = { min: 0, max: 0 });
        const c = i ? 200 : 1e6,
          f = i ? 40 : 1e7,
          m = {
            type: "inertia",
            velocity: r ? t[p] : 0,
            bounceStiffness: c,
            bounceDamping: f,
            timeConstant: 750,
            restDelta: 1,
            restSpeed: 10,
            ...s,
            ...l,
          };
        return this.startAxisValueAnimation(p, m);
      });
    return Promise.all(d).then(u);
  }
  startAxisValueAnimation(t, n) {
    const r = this.getAxisMotionValue(t);
    return r.start(
      fd(t, r, 0, n, this.visualElement, !1, Bu(this.visualElement, t))
    );
  }
  stopAnimation() {
    ut((t) => this.getAxisMotionValue(t).stop());
  }
  pauseAnimation() {
    ut((t) => {
      var n;
      return (n = this.getAxisMotionValue(t).animation) === null || n === void 0
        ? void 0
        : n.pause();
    });
  }
  getAnimationState(t) {
    var n;
    return (n = this.getAxisMotionValue(t).animation) === null || n === void 0
      ? void 0
      : n.state;
  }
  getAxisMotionValue(t) {
    const n = `_drag${t.toUpperCase()}`,
      r = this.visualElement.getProps(),
      i = r[n];
    return (
      i ||
      this.visualElement.getValue(t, (r.initial ? r.initial[t] : void 0) || 0)
    );
  }
  snapToCursor(t) {
    ut((n) => {
      const { drag: r } = this.getProps();
      if (!fo(n, r, this.currentDirection)) return;
      const { projection: i } = this.visualElement,
        s = this.getAxisMotionValue(n);
      if (i && i.layout) {
        const { min: o, max: u } = i.layout.layoutBox[n];
        s.set(t[n] - ae(o, u, 0.5));
      }
    });
  }
  scalePositionWithinConstraints() {
    if (!this.visualElement.current) return;
    const { drag: t, dragConstraints: n } = this.getProps(),
      { projection: r } = this.visualElement;
    if (!Fr(n) || !r || !this.constraints) return;
    this.stopAnimation();
    const i = { x: 0, y: 0 };
    ut((o) => {
      const u = this.getAxisMotionValue(o);
      if (u && this.constraints !== !1) {
        const a = u.get();
        i[o] = fx({ min: a, max: a }, this.constraints[o]);
      }
    });
    const { transformTemplate: s } = this.visualElement.getProps();
    (this.visualElement.current.style.transform = s ? s({}, "") : "none"),
      r.root && r.root.updateScroll(),
      r.updateLayout(),
      this.resolveConstraints(),
      ut((o) => {
        if (!fo(o, t, null)) return;
        const u = this.getAxisMotionValue(o),
          { min: a, max: d } = this.constraints[o];
        u.set(ae(a, d, i[o]));
      });
  }
  addListeners() {
    if (!this.visualElement.current) return;
    wx.set(this.visualElement, this);
    const t = this.visualElement.current,
      n = Jt(t, "pointerdown", (a) => {
        const { drag: d, dragListener: p = !0 } = this.getProps();
        d && p && this.start(a);
      }),
      r = () => {
        const { dragConstraints: a } = this.getProps();
        Fr(a) && a.current && (this.constraints = this.resolveRefConstraints());
      },
      { projection: i } = this.visualElement,
      s = i.addEventListener("measure", r);
    i && !i.layout && (i.root && i.root.updateScroll(), i.updateLayout()),
      Q.read(r);
    const o = Kt(window, "resize", () => this.scalePositionWithinConstraints()),
      u = i.addEventListener(
        "didUpdate",
        ({ delta: a, hasLayoutChanged: d }) => {
          this.isDragging &&
            d &&
            (ut((p) => {
              const l = this.getAxisMotionValue(p);
              l &&
                ((this.originPoint[p] += a[p].translate),
                l.set(l.get() + a[p].translate));
            }),
            this.visualElement.render());
        }
      );
    return () => {
      o(), n(), s(), u && u();
    };
  }
  getProps() {
    const t = this.visualElement.getProps(),
      {
        drag: n = !1,
        dragDirectionLock: r = !1,
        dragPropagation: i = !1,
        dragConstraints: s = !1,
        dragElastic: o = $u,
        dragMomentum: u = !0,
      } = t;
    return {
      ...t,
      drag: n,
      dragDirectionLock: r,
      dragPropagation: i,
      dragConstraints: s,
      dragElastic: o,
      dragMomentum: u,
    };
  }
}
function fo(e, t, n) {
  return (t === !0 || t === e) && (n === null || n === e);
}
function Sx(e, t = 10) {
  let n = null;
  return Math.abs(e.y) > t ? (n = "y") : Math.abs(e.x) > t && (n = "x"), n;
}
class _x extends zn {
  constructor(t) {
    super(t),
      (this.removeGroupControls = Ee),
      (this.removeListeners = Ee),
      (this.controls = new xx(t));
  }
  mount() {
    const { dragControls: t } = this.node.getProps();
    t && (this.removeGroupControls = t.subscribe(this.controls)),
      (this.removeListeners = this.controls.addListeners() || Ee);
  }
  unmount() {
    this.removeGroupControls(), this.removeListeners();
  }
}
const bp = (e) => (t, n) => {
  e && Q.postRender(() => e(t, n));
};
class Cx extends zn {
  constructor() {
    super(...arguments), (this.removePointerDownListener = Ee);
  }
  onPointerDown(t) {
    this.session = new V0(t, this.createPanHandlers(), {
      transformPagePoint: this.node.getTransformPagePoint(),
      contextWindow: U0(this.node),
    });
  }
  createPanHandlers() {
    const {
      onPanSessionStart: t,
      onPanStart: n,
      onPan: r,
      onPanEnd: i,
    } = this.node.getProps();
    return {
      onSessionStart: bp(t),
      onStart: bp(n),
      onMove: r,
      onEnd: (s, o) => {
        delete this.session, i && Q.postRender(() => i(s, o));
      },
    };
  }
  mount() {
    this.removePointerDownListener = Jt(this.node.current, "pointerdown", (t) =>
      this.onPointerDown(t)
    );
  }
  update() {
    this.session && this.session.updateHandlers(this.createPanHandlers());
  }
  unmount() {
    this.removePointerDownListener(), this.session && this.session.end();
  }
}
const Nl = C.createContext(null);
function Tx() {
  const e = C.useContext(Nl);
  if (e === null) return [!0, null];
  const { isPresent: t, onExitComplete: n, register: r } = e,
    i = C.useId();
  C.useEffect(() => r(i), []);
  const s = C.useCallback(() => n && n(i), [i, n]);
  return !t && n ? [!1, s] : [!0];
}
const hd = C.createContext({}),
  K0 = C.createContext({}),
  bo = { hasAnimatedSinceResize: !0, hasEverUpdated: !1 };
function Lp(e, t) {
  return t.max === t.min ? 0 : (e / (t.max - t.min)) * 100;
}
const ji = {
    correct: (e, t) => {
      if (!t.target) return e;
      if (typeof e == "string")
        if (F.test(e)) e = parseFloat(e);
        else return e;
      const n = Lp(e, t.target.x),
        r = Lp(e, t.target.y);
      return `${n}% ${r}%`;
    },
  },
  Ex = {
    correct: (e, { treeScale: t, projectionDelta: n }) => {
      const r = e,
        i = Dn.parse(e);
      if (i.length > 5) return r;
      const s = Dn.createTransformer(e),
        o = typeof i[0] != "number" ? 1 : 0,
        u = n.x.scale * t.x,
        a = n.y.scale * t.y;
      (i[0 + o] /= u), (i[1 + o] /= a);
      const d = ae(u, a, 0.5);
      return (
        typeof i[2 + o] == "number" && (i[2 + o] /= d),
        typeof i[3 + o] == "number" && (i[3 + o] /= d),
        s(i)
      );
    },
  },
  ll = {};
function Px(e) {
  Object.assign(ll, e);
}
const { schedule: md, cancel: i7 } = K1(queueMicrotask, !1);
class Ax extends C.Component {
  componentDidMount() {
    const {
        visualElement: t,
        layoutGroup: n,
        switchLayoutGroup: r,
        layoutId: i,
      } = this.props,
      { projection: s } = t;
    Px(kx),
      s &&
        (n.group && n.group.add(s),
        r && r.register && i && r.register(s),
        s.root.didUpdate(),
        s.addEventListener("animationComplete", () => {
          this.safeToRemove();
        }),
        s.setOptions({
          ...s.options,
          onExitComplete: () => this.safeToRemove(),
        })),
      (bo.hasEverUpdated = !0);
  }
  getSnapshotBeforeUpdate(t) {
    const {
        layoutDependency: n,
        visualElement: r,
        drag: i,
        isPresent: s,
      } = this.props,
      o = r.projection;
    return (
      o &&
        ((o.isPresent = s),
        i || t.layoutDependency !== n || n === void 0
          ? o.willUpdate()
          : this.safeToRemove(),
        t.isPresent !== s &&
          (s
            ? o.promote()
            : o.relegate() ||
              Q.postRender(() => {
                const u = o.getStack();
                (!u || !u.members.length) && this.safeToRemove();
              }))),
      null
    );
  }
  componentDidUpdate() {
    const { projection: t } = this.props.visualElement;
    t &&
      (t.root.didUpdate(),
      md.postRender(() => {
        !t.currentAnimation && t.isLead() && this.safeToRemove();
      }));
  }
  componentWillUnmount() {
    const {
        visualElement: t,
        layoutGroup: n,
        switchLayoutGroup: r,
      } = this.props,
      { projection: i } = t;
    i &&
      (i.scheduleCheckAfterUnmount(),
      n && n.group && n.group.remove(i),
      r && r.deregister && r.deregister(i));
  }
  safeToRemove() {
    const { safeToRemove: t } = this.props;
    t && t();
  }
  render() {
    return null;
  }
}
function Y0(e) {
  const [t, n] = Tx(),
    r = C.useContext(hd);
  return _.jsx(Ax, {
    ...e,
    layoutGroup: r,
    switchLayoutGroup: C.useContext(K0),
    isPresent: t,
    safeToRemove: n,
  });
}
const kx = {
    borderRadius: {
      ...ji,
      applyTo: [
        "borderTopLeftRadius",
        "borderTopRightRadius",
        "borderBottomLeftRadius",
        "borderBottomRightRadius",
      ],
    },
    borderTopLeftRadius: ji,
    borderTopRightRadius: ji,
    borderBottomLeftRadius: ji,
    borderBottomRightRadius: ji,
    boxShadow: Ex,
  },
  X0 = ["TopLeft", "TopRight", "BottomLeft", "BottomRight"],
  Mx = X0.length,
  Op = (e) => (typeof e == "string" ? parseFloat(e) : e),
  Dp = (e) => typeof e == "number" || F.test(e);
function bx(e, t, n, r, i, s) {
  i
    ? ((e.opacity = ae(0, n.opacity !== void 0 ? n.opacity : 1, Lx(r))),
      (e.opacityExit = ae(t.opacity !== void 0 ? t.opacity : 1, 0, Ox(r))))
    : s &&
      (e.opacity = ae(
        t.opacity !== void 0 ? t.opacity : 1,
        n.opacity !== void 0 ? n.opacity : 1,
        r
      ));
  for (let o = 0; o < Mx; o++) {
    const u = `border${X0[o]}Radius`;
    let a = Rp(t, u),
      d = Rp(n, u);
    if (a === void 0 && d === void 0) continue;
    a || (a = 0),
      d || (d = 0),
      a === 0 || d === 0 || Dp(a) === Dp(d)
        ? ((e[u] = Math.max(ae(Op(a), Op(d), r), 0)),
          (Nt.test(d) || Nt.test(a)) && (e[u] += "%"))
        : (e[u] = d);
  }
  (t.rotate || n.rotate) && (e.rotate = ae(t.rotate || 0, n.rotate || 0, r));
}
function Rp(e, t) {
  return e[t] !== void 0 ? e[t] : e.borderRadius;
}
const Lx = Z0(0, 0.5, x0),
  Ox = Z0(0.5, 0.95, Ee);
function Z0(e, t, n) {
  return (r) => (r < e ? 0 : r > t ? 1 : n(Ps(e, t, r)));
}
function Vp(e, t) {
  (e.min = t.min), (e.max = t.max);
}
function lt(e, t) {
  Vp(e.x, t.x), Vp(e.y, t.y);
}
function Ip(e, t) {
  (e.translate = t.translate),
    (e.scale = t.scale),
    (e.originPoint = t.originPoint),
    (e.origin = t.origin);
}
function Np(e, t, n, r, i) {
  return (
    (e -= t), (e = ol(e, 1 / n, r)), i !== void 0 && (e = ol(e, 1 / i, r)), e
  );
}
function Dx(e, t = 0, n = 1, r = 0.5, i, s = e, o = e) {
  if (
    (Nt.test(t) &&
      ((t = parseFloat(t)), (t = ae(o.min, o.max, t / 100) - o.min)),
    typeof t != "number")
  )
    return;
  let u = ae(s.min, s.max, r);
  e === s && (u -= t),
    (e.min = Np(e.min, t, n, u, i)),
    (e.max = Np(e.max, t, n, u, i));
}
function jp(e, t, [n, r, i], s, o) {
  Dx(e, t[n], t[r], t[i], t.scale, s, o);
}
const Rx = ["x", "scaleX", "originX"],
  Vx = ["y", "scaleY", "originY"];
function Fp(e, t, n, r) {
  jp(e.x, t, Rx, n ? n.x : void 0, r ? r.x : void 0),
    jp(e.y, t, Vx, n ? n.y : void 0, r ? r.y : void 0);
}
function zp(e) {
  return e.translate === 0 && e.scale === 1;
}
function Q0(e) {
  return zp(e.x) && zp(e.y);
}
function Bp(e, t) {
  return e.min === t.min && e.max === t.max;
}
function Ix(e, t) {
  return Bp(e.x, t.x) && Bp(e.y, t.y);
}
function Hp(e, t) {
  return (
    Math.round(e.min) === Math.round(t.min) &&
    Math.round(e.max) === Math.round(t.max)
  );
}
function q0(e, t) {
  return Hp(e.x, t.x) && Hp(e.y, t.y);
}
function $p(e) {
  return et(e.x) / et(e.y);
}
function Gp(e, t) {
  return (
    e.translate === t.translate &&
    e.scale === t.scale &&
    e.originPoint === t.originPoint
  );
}
class Nx {
  constructor() {
    this.members = [];
  }
  add(t) {
    Dl(this.members, t), t.scheduleRender();
  }
  remove(t) {
    if (
      (Rl(this.members, t),
      t === this.prevLead && (this.prevLead = void 0),
      t === this.lead)
    ) {
      const n = this.members[this.members.length - 1];
      n && this.promote(n);
    }
  }
  relegate(t) {
    const n = this.members.findIndex((i) => t === i);
    if (n === 0) return !1;
    let r;
    for (let i = n; i >= 0; i--) {
      const s = this.members[i];
      if (s.isPresent !== !1) {
        r = s;
        break;
      }
    }
    return r ? (this.promote(r), !0) : !1;
  }
  promote(t, n) {
    const r = this.lead;
    if (t !== r && ((this.prevLead = r), (this.lead = t), t.show(), r)) {
      r.instance && r.scheduleRender(),
        t.scheduleRender(),
        (t.resumeFrom = r),
        n && (t.resumeFrom.preserveOpacity = !0),
        r.snapshot &&
          ((t.snapshot = r.snapshot),
          (t.snapshot.latestValues = r.animationValues || r.latestValues)),
        t.root && t.root.isUpdating && (t.isLayoutDirty = !0);
      const { crossfade: i } = t.options;
      i === !1 && r.hide();
    }
  }
  exitAnimationComplete() {
    this.members.forEach((t) => {
      const { options: n, resumingFrom: r } = t;
      n.onExitComplete && n.onExitComplete(),
        r && r.options.onExitComplete && r.options.onExitComplete();
    });
  }
  scheduleRender() {
    this.members.forEach((t) => {
      t.instance && t.scheduleRender(!1);
    });
  }
  removeLeadSnapshot() {
    this.lead && this.lead.snapshot && (this.lead.snapshot = void 0);
  }
}
function jx(e, t, n) {
  let r = "";
  const i = e.x.translate / t.x,
    s = e.y.translate / t.y,
    o = (n == null ? void 0 : n.z) || 0;
  if (
    ((i || s || o) && (r = `translate3d(${i}px, ${s}px, ${o}px) `),
    (t.x !== 1 || t.y !== 1) && (r += `scale(${1 / t.x}, ${1 / t.y}) `),
    n)
  ) {
    const {
      transformPerspective: d,
      rotate: p,
      rotateX: l,
      rotateY: c,
      skewX: f,
      skewY: m,
    } = n;
    d && (r = `perspective(${d}px) ${r}`),
      p && (r += `rotate(${p}deg) `),
      l && (r += `rotateX(${l}deg) `),
      c && (r += `rotateY(${c}deg) `),
      f && (r += `skewX(${f}deg) `),
      m && (r += `skewY(${m}deg) `);
  }
  const u = e.x.scale * t.x,
    a = e.y.scale * t.y;
  return (u !== 1 || a !== 1) && (r += `scale(${u}, ${a})`), r || "none";
}
const Fx = (e, t) => e.depth - t.depth;
class zx {
  constructor() {
    (this.children = []), (this.isDirty = !1);
  }
  add(t) {
    Dl(this.children, t), (this.isDirty = !0);
  }
  remove(t) {
    Rl(this.children, t), (this.isDirty = !0);
  }
  forEach(t) {
    this.isDirty && this.children.sort(Fx),
      (this.isDirty = !1),
      this.children.forEach(t);
  }
}
function Lo(e) {
  const t = Oe(e) ? e.get() : e;
  return L5(t) ? t.toValue() : t;
}
function Bx(e, t) {
  const n = Qt.now(),
    r = ({ timestamp: i }) => {
      const s = i - n;
      s >= t && (on(r), e(s - t));
    };
  return Q.read(r, !0), () => on(r);
}
function Hx(e) {
  return e instanceof SVGElement && e.tagName !== "svg";
}
function $x(e, t, n) {
  const r = Oe(e) ? e : As(e);
  return r.start(fd("", r, t, n)), r.animation;
}
const Zn = {
    type: "projectionFrame",
    totalNodes: 0,
    resolvedTargetDeltas: 0,
    recalculatedProjection: 0,
  },
  Wi = typeof window < "u" && window.MotionDebug !== void 0,
  Pa = ["", "X", "Y", "Z"],
  Gx = { visibility: "hidden" },
  Wp = 1e3;
let Wx = 0;
function Aa(e, t, n, r) {
  const { latestValues: i } = t;
  i[e] && ((n[e] = i[e]), t.setStaticValue(e, 0), r && (r[e] = 0));
}
function J0(e) {
  if (((e.hasCheckedOptimisedAppear = !0), e.root === e)) return;
  const { visualElement: t } = e.options;
  if (!t) return;
  const n = b0(t);
  if (window.MotionHasOptimisedAnimation(n, "transform")) {
    const { layout: i, layoutId: s } = e.options;
    window.MotionCancelOptimisedAnimation(n, "transform", Q, !(i || s));
  }
  const { parent: r } = e;
  r && !r.hasCheckedOptimisedAppear && J0(r);
}
function eg({
  attachResizeListener: e,
  defaultParent: t,
  measureScroll: n,
  checkIsScrollRoot: r,
  resetTransform: i,
}) {
  return class {
    constructor(o = {}, u = t == null ? void 0 : t()) {
      (this.id = Wx++),
        (this.animationId = 0),
        (this.children = new Set()),
        (this.options = {}),
        (this.isTreeAnimating = !1),
        (this.isAnimationBlocked = !1),
        (this.isLayoutDirty = !1),
        (this.isProjectionDirty = !1),
        (this.isSharedProjectionDirty = !1),
        (this.isTransformDirty = !1),
        (this.updateManuallyBlocked = !1),
        (this.updateBlockedByResize = !1),
        (this.isUpdating = !1),
        (this.isSVG = !1),
        (this.needsReset = !1),
        (this.shouldResetTransform = !1),
        (this.hasCheckedOptimisedAppear = !1),
        (this.treeScale = { x: 1, y: 1 }),
        (this.eventHandlers = new Map()),
        (this.hasTreeAnimated = !1),
        (this.updateScheduled = !1),
        (this.scheduleUpdate = () => this.update()),
        (this.projectionUpdateScheduled = !1),
        (this.checkUpdateFailed = () => {
          this.isUpdating && ((this.isUpdating = !1), this.clearAllSnapshots());
        }),
        (this.updateProjection = () => {
          (this.projectionUpdateScheduled = !1),
            Wi &&
              (Zn.totalNodes =
                Zn.resolvedTargetDeltas =
                Zn.recalculatedProjection =
                  0),
            this.nodes.forEach(Yx),
            this.nodes.forEach(Jx),
            this.nodes.forEach(e3),
            this.nodes.forEach(Xx),
            Wi && window.MotionDebug.record(Zn);
        }),
        (this.resolvedRelativeTargetAt = 0),
        (this.hasProjected = !1),
        (this.isVisible = !0),
        (this.animationProgress = 0),
        (this.sharedNodes = new Map()),
        (this.latestValues = o),
        (this.root = u ? u.root || u : this),
        (this.path = u ? [...u.path, u] : []),
        (this.parent = u),
        (this.depth = u ? u.depth + 1 : 0);
      for (let a = 0; a < this.path.length; a++)
        this.path[a].shouldResetTransform = !0;
      this.root === this && (this.nodes = new zx());
    }
    addEventListener(o, u) {
      return (
        this.eventHandlers.has(o) || this.eventHandlers.set(o, new pd()),
        this.eventHandlers.get(o).add(u)
      );
    }
    notifyListeners(o, ...u) {
      const a = this.eventHandlers.get(o);
      a && a.notify(...u);
    }
    hasListeners(o) {
      return this.eventHandlers.has(o);
    }
    mount(o, u = this.root.hasTreeAnimated) {
      if (this.instance) return;
      (this.isSVG = Hx(o)), (this.instance = o);
      const { layoutId: a, layout: d, visualElement: p } = this.options;
      if (
        (p && !p.current && p.mount(o),
        this.root.nodes.add(this),
        this.parent && this.parent.children.add(this),
        u && (d || a) && (this.isLayoutDirty = !0),
        e)
      ) {
        let l;
        const c = () => (this.root.updateBlockedByResize = !1);
        e(o, () => {
          (this.root.updateBlockedByResize = !0),
            l && l(),
            (l = Bx(c, 250)),
            bo.hasAnimatedSinceResize &&
              ((bo.hasAnimatedSinceResize = !1), this.nodes.forEach(Kp));
        });
      }
      a && this.root.registerSharedNode(a, this),
        this.options.animate !== !1 &&
          p &&
          (a || d) &&
          this.addEventListener(
            "didUpdate",
            ({
              delta: l,
              hasLayoutChanged: c,
              hasRelativeTargetChanged: f,
              layout: m,
            }) => {
              if (this.isTreeAnimationBlocked()) {
                (this.target = void 0), (this.relativeTarget = void 0);
                return;
              }
              const v =
                  this.options.transition || p.getDefaultTransition() || s3,
                { onLayoutAnimationStart: w, onLayoutAnimationComplete: h } =
                  p.getProps(),
                g = !this.targetLayout || !q0(this.targetLayout, m) || f,
                y = !c && f;
              if (
                this.options.layoutRoot ||
                (this.resumeFrom && this.resumeFrom.instance) ||
                y ||
                (c && (g || !this.currentAnimation))
              ) {
                this.resumeFrom &&
                  ((this.resumingFrom = this.resumeFrom),
                  (this.resumingFrom.resumingFrom = void 0)),
                  this.setAnimationOrigin(l, y);
                const x = { ...ed(v, "layout"), onPlay: w, onComplete: h };
                (p.shouldReduceMotion || this.options.layoutRoot) &&
                  ((x.delay = 0), (x.type = !1)),
                  this.startAnimation(x);
              } else
                c || Kp(this),
                  this.isLead() &&
                    this.options.onExitComplete &&
                    this.options.onExitComplete();
              this.targetLayout = m;
            }
          );
    }
    unmount() {
      this.options.layoutId && this.willUpdate(), this.root.nodes.remove(this);
      const o = this.getStack();
      o && o.remove(this),
        this.parent && this.parent.children.delete(this),
        (this.instance = void 0),
        on(this.updateProjection);
    }
    blockUpdate() {
      this.updateManuallyBlocked = !0;
    }
    unblockUpdate() {
      this.updateManuallyBlocked = !1;
    }
    isUpdateBlocked() {
      return this.updateManuallyBlocked || this.updateBlockedByResize;
    }
    isTreeAnimationBlocked() {
      return (
        this.isAnimationBlocked ||
        (this.parent && this.parent.isTreeAnimationBlocked()) ||
        !1
      );
    }
    startUpdate() {
      this.isUpdateBlocked() ||
        ((this.isUpdating = !0),
        this.nodes && this.nodes.forEach(t3),
        this.animationId++);
    }
    getTransformTemplate() {
      const { visualElement: o } = this.options;
      return o && o.getProps().transformTemplate;
    }
    willUpdate(o = !0) {
      if (((this.root.hasTreeAnimated = !0), this.root.isUpdateBlocked())) {
        this.options.onExitComplete && this.options.onExitComplete();
        return;
      }
      if (
        (window.MotionCancelOptimisedAnimation &&
          !this.hasCheckedOptimisedAppear &&
          J0(this),
        !this.root.isUpdating && this.root.startUpdate(),
        this.isLayoutDirty)
      )
        return;
      this.isLayoutDirty = !0;
      for (let p = 0; p < this.path.length; p++) {
        const l = this.path[p];
        (l.shouldResetTransform = !0),
          l.updateScroll("snapshot"),
          l.options.layoutRoot && l.willUpdate(!1);
      }
      const { layoutId: u, layout: a } = this.options;
      if (u === void 0 && !a) return;
      const d = this.getTransformTemplate();
      (this.prevTransformTemplateValue = d ? d(this.latestValues, "") : void 0),
        this.updateSnapshot(),
        o && this.notifyListeners("willUpdate");
    }
    update() {
      if (((this.updateScheduled = !1), this.isUpdateBlocked())) {
        this.unblockUpdate(), this.clearAllSnapshots(), this.nodes.forEach(Up);
        return;
      }
      this.isUpdating || this.nodes.forEach(Qx),
        (this.isUpdating = !1),
        this.nodes.forEach(qx),
        this.nodes.forEach(Ux),
        this.nodes.forEach(Kx),
        this.clearAllSnapshots();
      const u = Qt.now();
      (Ce.delta = On(0, 1e3 / 60, u - Ce.timestamp)),
        (Ce.timestamp = u),
        (Ce.isProcessing = !0),
        ya.update.process(Ce),
        ya.preRender.process(Ce),
        ya.render.process(Ce),
        (Ce.isProcessing = !1);
    }
    didUpdate() {
      this.updateScheduled ||
        ((this.updateScheduled = !0), md.read(this.scheduleUpdate));
    }
    clearAllSnapshots() {
      this.nodes.forEach(Zx), this.sharedNodes.forEach(n3);
    }
    scheduleUpdateProjection() {
      this.projectionUpdateScheduled ||
        ((this.projectionUpdateScheduled = !0),
        Q.preRender(this.updateProjection, !1, !0));
    }
    scheduleCheckAfterUnmount() {
      Q.postRender(() => {
        this.isLayoutDirty
          ? this.root.didUpdate()
          : this.root.checkUpdateFailed();
      });
    }
    updateSnapshot() {
      this.snapshot || !this.instance || (this.snapshot = this.measure());
    }
    updateLayout() {
      if (
        !this.instance ||
        (this.updateScroll(),
        !(this.options.alwaysMeasureLayout && this.isLead()) &&
          !this.isLayoutDirty)
      )
        return;
      if (this.resumeFrom && !this.resumeFrom.instance)
        for (let a = 0; a < this.path.length; a++) this.path[a].updateScroll();
      const o = this.layout;
      (this.layout = this.measure(!1)),
        (this.layoutCorrected = fe()),
        (this.isLayoutDirty = !1),
        (this.projectionDelta = void 0),
        this.notifyListeners("measure", this.layout.layoutBox);
      const { visualElement: u } = this.options;
      u &&
        u.notify(
          "LayoutMeasure",
          this.layout.layoutBox,
          o ? o.layoutBox : void 0
        );
    }
    updateScroll(o = "measure") {
      let u = !!(this.options.layoutScroll && this.instance);
      if (
        (this.scroll &&
          this.scroll.animationId === this.root.animationId &&
          this.scroll.phase === o &&
          (u = !1),
        u)
      ) {
        const a = r(this.instance);
        this.scroll = {
          animationId: this.root.animationId,
          phase: o,
          isRoot: a,
          offset: n(this.instance),
          wasRoot: this.scroll ? this.scroll.isRoot : a,
        };
      }
    }
    resetTransform() {
      if (!i) return;
      const o =
          this.isLayoutDirty ||
          this.shouldResetTransform ||
          this.options.alwaysMeasureLayout,
        u = this.projectionDelta && !Q0(this.projectionDelta),
        a = this.getTransformTemplate(),
        d = a ? a(this.latestValues, "") : void 0,
        p = d !== this.prevTransformTemplateValue;
      o &&
        (u || Xn(this.latestValues) || p) &&
        (i(this.instance, d),
        (this.shouldResetTransform = !1),
        this.scheduleRender());
    }
    measure(o = !0) {
      const u = this.measurePageBox();
      let a = this.removeElementScroll(u);
      return (
        o && (a = this.removeTransform(a)),
        o3(a),
        {
          animationId: this.root.animationId,
          measuredBox: u,
          layoutBox: a,
          latestValues: {},
          source: this.id,
        }
      );
    }
    measurePageBox() {
      var o;
      const { visualElement: u } = this.options;
      if (!u) return fe();
      const a = u.measureViewportBox();
      if (
        !(
          ((o = this.scroll) === null || o === void 0 ? void 0 : o.wasRoot) ||
          this.path.some(l3)
        )
      ) {
        const { scroll: p } = this.root;
        p && (Br(a.x, p.offset.x), Br(a.y, p.offset.y));
      }
      return a;
    }
    removeElementScroll(o) {
      var u;
      const a = fe();
      if (
        (lt(a, o), !((u = this.scroll) === null || u === void 0) && u.wasRoot)
      )
        return a;
      for (let d = 0; d < this.path.length; d++) {
        const p = this.path[d],
          { scroll: l, options: c } = p;
        p !== this.root &&
          l &&
          c.layoutScroll &&
          (l.wasRoot && lt(a, o), Br(a.x, l.offset.x), Br(a.y, l.offset.y));
      }
      return a;
    }
    applyTransform(o, u = !1) {
      const a = fe();
      lt(a, o);
      for (let d = 0; d < this.path.length; d++) {
        const p = this.path[d];
        !u &&
          p.options.layoutScroll &&
          p.scroll &&
          p !== p.root &&
          Hr(a, { x: -p.scroll.offset.x, y: -p.scroll.offset.y }),
          Xn(p.latestValues) && Hr(a, p.latestValues);
      }
      return Xn(this.latestValues) && Hr(a, this.latestValues), a;
    }
    removeTransform(o) {
      const u = fe();
      lt(u, o);
      for (let a = 0; a < this.path.length; a++) {
        const d = this.path[a];
        if (!d.instance || !Xn(d.latestValues)) continue;
        Gu(d.latestValues) && d.updateSnapshot();
        const p = fe(),
          l = d.measurePageBox();
        lt(p, l),
          Fp(u, d.latestValues, d.snapshot ? d.snapshot.layoutBox : void 0, p);
      }
      return Xn(this.latestValues) && Fp(u, this.latestValues), u;
    }
    setTargetDelta(o) {
      (this.targetDelta = o),
        this.root.scheduleUpdateProjection(),
        (this.isProjectionDirty = !0);
    }
    setOptions(o) {
      this.options = {
        ...this.options,
        ...o,
        crossfade: o.crossfade !== void 0 ? o.crossfade : !0,
      };
    }
    clearMeasurements() {
      (this.scroll = void 0),
        (this.layout = void 0),
        (this.snapshot = void 0),
        (this.prevTransformTemplateValue = void 0),
        (this.targetDelta = void 0),
        (this.target = void 0),
        (this.isLayoutDirty = !1);
    }
    forceRelativeParentToResolveTarget() {
      this.relativeParent &&
        this.relativeParent.resolvedRelativeTargetAt !== Ce.timestamp &&
        this.relativeParent.resolveTargetDelta(!0);
    }
    resolveTargetDelta(o = !1) {
      var u;
      const a = this.getLead();
      this.isProjectionDirty || (this.isProjectionDirty = a.isProjectionDirty),
        this.isTransformDirty || (this.isTransformDirty = a.isTransformDirty),
        this.isSharedProjectionDirty ||
          (this.isSharedProjectionDirty = a.isSharedProjectionDirty);
      const d = !!this.resumingFrom || this !== a;
      if (
        !(
          o ||
          (d && this.isSharedProjectionDirty) ||
          this.isProjectionDirty ||
          (!((u = this.parent) === null || u === void 0) &&
            u.isProjectionDirty) ||
          this.attemptToResolveRelativeTarget ||
          this.root.updateBlockedByResize
        )
      )
        return;
      const { layout: l, layoutId: c } = this.options;
      if (!(!this.layout || !(l || c))) {
        if (
          ((this.resolvedRelativeTargetAt = Ce.timestamp),
          !this.targetDelta && !this.relativeTarget)
        ) {
          const f = this.getClosestProjectingParent();
          f && f.layout && this.animationProgress !== 1
            ? ((this.relativeParent = f),
              this.forceRelativeParentToResolveTarget(),
              (this.relativeTarget = fe()),
              (this.relativeTargetOrigin = fe()),
              is(
                this.relativeTargetOrigin,
                this.layout.layoutBox,
                f.layout.layoutBox
              ),
              lt(this.relativeTarget, this.relativeTargetOrigin))
            : (this.relativeParent = this.relativeTarget = void 0);
        }
        if (!(!this.relativeTarget && !this.targetDelta)) {
          if (
            (this.target ||
              ((this.target = fe()), (this.targetWithTransforms = fe())),
            this.relativeTarget &&
            this.relativeTargetOrigin &&
            this.relativeParent &&
            this.relativeParent.target
              ? (this.forceRelativeParentToResolveTarget(),
                ax(
                  this.target,
                  this.relativeTarget,
                  this.relativeParent.target
                ))
              : this.targetDelta
              ? (this.resumingFrom
                  ? (this.target = this.applyTransform(this.layout.layoutBox))
                  : lt(this.target, this.layout.layoutBox),
                G0(this.target, this.targetDelta))
              : lt(this.target, this.layout.layoutBox),
            this.attemptToResolveRelativeTarget)
          ) {
            this.attemptToResolveRelativeTarget = !1;
            const f = this.getClosestProjectingParent();
            f &&
            !!f.resumingFrom == !!this.resumingFrom &&
            !f.options.layoutScroll &&
            f.target &&
            this.animationProgress !== 1
              ? ((this.relativeParent = f),
                this.forceRelativeParentToResolveTarget(),
                (this.relativeTarget = fe()),
                (this.relativeTargetOrigin = fe()),
                is(this.relativeTargetOrigin, this.target, f.target),
                lt(this.relativeTarget, this.relativeTargetOrigin))
              : (this.relativeParent = this.relativeTarget = void 0);
          }
          Wi && Zn.resolvedTargetDeltas++;
        }
      }
    }
    getClosestProjectingParent() {
      if (
        !(
          !this.parent ||
          Gu(this.parent.latestValues) ||
          $0(this.parent.latestValues)
        )
      )
        return this.parent.isProjecting()
          ? this.parent
          : this.parent.getClosestProjectingParent();
    }
    isProjecting() {
      return !!(
        (this.relativeTarget || this.targetDelta || this.options.layoutRoot) &&
        this.layout
      );
    }
    calcProjection() {
      var o;
      const u = this.getLead(),
        a = !!this.resumingFrom || this !== u;
      let d = !0;
      if (
        ((this.isProjectionDirty ||
          (!((o = this.parent) === null || o === void 0) &&
            o.isProjectionDirty)) &&
          (d = !1),
        a &&
          (this.isSharedProjectionDirty || this.isTransformDirty) &&
          (d = !1),
        this.resolvedRelativeTargetAt === Ce.timestamp && (d = !1),
        d)
      )
        return;
      const { layout: p, layoutId: l } = this.options;
      if (
        ((this.isTreeAnimating = !!(
          (this.parent && this.parent.isTreeAnimating) ||
          this.currentAnimation ||
          this.pendingAnimation
        )),
        this.isTreeAnimating ||
          (this.targetDelta = this.relativeTarget = void 0),
        !this.layout || !(p || l))
      )
        return;
      lt(this.layoutCorrected, this.layout.layoutBox);
      const c = this.treeScale.x,
        f = this.treeScale.y;
      vx(this.layoutCorrected, this.treeScale, this.path, a),
        u.layout &&
          !u.target &&
          (this.treeScale.x !== 1 || this.treeScale.y !== 1) &&
          ((u.target = u.layout.layoutBox), (u.targetWithTransforms = fe()));
      const { target: m } = u;
      if (!m) {
        this.prevProjectionDelta &&
          (this.createProjectionDeltas(), this.scheduleRender());
        return;
      }
      !this.projectionDelta || !this.prevProjectionDelta
        ? this.createProjectionDeltas()
        : (Ip(this.prevProjectionDelta.x, this.projectionDelta.x),
          Ip(this.prevProjectionDelta.y, this.projectionDelta.y)),
        rs(this.projectionDelta, this.layoutCorrected, m, this.latestValues),
        (this.treeScale.x !== c ||
          this.treeScale.y !== f ||
          !Gp(this.projectionDelta.x, this.prevProjectionDelta.x) ||
          !Gp(this.projectionDelta.y, this.prevProjectionDelta.y)) &&
          ((this.hasProjected = !0),
          this.scheduleRender(),
          this.notifyListeners("projectionUpdate", m)),
        Wi && Zn.recalculatedProjection++;
    }
    hide() {
      this.isVisible = !1;
    }
    show() {
      this.isVisible = !0;
    }
    scheduleRender(o = !0) {
      var u;
      if (
        ((u = this.options.visualElement) === null ||
          u === void 0 ||
          u.scheduleRender(),
        o)
      ) {
        const a = this.getStack();
        a && a.scheduleRender();
      }
      this.resumingFrom &&
        !this.resumingFrom.instance &&
        (this.resumingFrom = void 0);
    }
    createProjectionDeltas() {
      (this.prevProjectionDelta = zr()),
        (this.projectionDelta = zr()),
        (this.projectionDeltaWithTransform = zr());
    }
    setAnimationOrigin(o, u = !1) {
      const a = this.snapshot,
        d = a ? a.latestValues : {},
        p = { ...this.latestValues },
        l = zr();
      (!this.relativeParent || !this.relativeParent.options.layoutRoot) &&
        (this.relativeTarget = this.relativeTargetOrigin = void 0),
        (this.attemptToResolveRelativeTarget = !u);
      const c = fe(),
        f = a ? a.source : void 0,
        m = this.layout ? this.layout.source : void 0,
        v = f !== m,
        w = this.getStack(),
        h = !w || w.members.length <= 1,
        g = !!(v && !h && this.options.crossfade === !0 && !this.path.some(i3));
      this.animationProgress = 0;
      let y;
      (this.mixTargetDelta = (x) => {
        const S = x / 1e3;
        Yp(l.x, o.x, S),
          Yp(l.y, o.y, S),
          this.setTargetDelta(l),
          this.relativeTarget &&
            this.relativeTargetOrigin &&
            this.layout &&
            this.relativeParent &&
            this.relativeParent.layout &&
            (is(c, this.layout.layoutBox, this.relativeParent.layout.layoutBox),
            r3(this.relativeTarget, this.relativeTargetOrigin, c, S),
            y && Ix(this.relativeTarget, y) && (this.isProjectionDirty = !1),
            y || (y = fe()),
            lt(y, this.relativeTarget)),
          v &&
            ((this.animationValues = p), bx(p, d, this.latestValues, S, g, h)),
          this.root.scheduleUpdateProjection(),
          this.scheduleRender(),
          (this.animationProgress = S);
      }),
        this.mixTargetDelta(this.options.layoutRoot ? 1e3 : 0);
    }
    startAnimation(o) {
      this.notifyListeners("animationStart"),
        this.currentAnimation && this.currentAnimation.stop(),
        this.resumingFrom &&
          this.resumingFrom.currentAnimation &&
          this.resumingFrom.currentAnimation.stop(),
        this.pendingAnimation &&
          (on(this.pendingAnimation), (this.pendingAnimation = void 0)),
        (this.pendingAnimation = Q.update(() => {
          (bo.hasAnimatedSinceResize = !0),
            (this.currentAnimation = $x(0, Wp, {
              ...o,
              onUpdate: (u) => {
                this.mixTargetDelta(u), o.onUpdate && o.onUpdate(u);
              },
              onComplete: () => {
                o.onComplete && o.onComplete(), this.completeAnimation();
              },
            })),
            this.resumingFrom &&
              (this.resumingFrom.currentAnimation = this.currentAnimation),
            (this.pendingAnimation = void 0);
        }));
    }
    completeAnimation() {
      this.resumingFrom &&
        ((this.resumingFrom.currentAnimation = void 0),
        (this.resumingFrom.preserveOpacity = void 0));
      const o = this.getStack();
      o && o.exitAnimationComplete(),
        (this.resumingFrom =
          this.currentAnimation =
          this.animationValues =
            void 0),
        this.notifyListeners("animationComplete");
    }
    finishAnimation() {
      this.currentAnimation &&
        (this.mixTargetDelta && this.mixTargetDelta(Wp),
        this.currentAnimation.stop()),
        this.completeAnimation();
    }
    applyTransformsToTarget() {
      const o = this.getLead();
      let {
        targetWithTransforms: u,
        target: a,
        layout: d,
        latestValues: p,
      } = o;
      if (!(!u || !a || !d)) {
        if (
          this !== o &&
          this.layout &&
          d &&
          tg(this.options.animationType, this.layout.layoutBox, d.layoutBox)
        ) {
          a = this.target || fe();
          const l = et(this.layout.layoutBox.x);
          (a.x.min = o.target.x.min), (a.x.max = a.x.min + l);
          const c = et(this.layout.layoutBox.y);
          (a.y.min = o.target.y.min), (a.y.max = a.y.min + c);
        }
        lt(u, a),
          Hr(u, p),
          rs(this.projectionDeltaWithTransform, this.layoutCorrected, u, p);
      }
    }
    registerSharedNode(o, u) {
      this.sharedNodes.has(o) || this.sharedNodes.set(o, new Nx()),
        this.sharedNodes.get(o).add(u);
      const d = u.options.initialPromotionConfig;
      u.promote({
        transition: d ? d.transition : void 0,
        preserveFollowOpacity:
          d && d.shouldPreserveFollowOpacity
            ? d.shouldPreserveFollowOpacity(u)
            : void 0,
      });
    }
    isLead() {
      const o = this.getStack();
      return o ? o.lead === this : !0;
    }
    getLead() {
      var o;
      const { layoutId: u } = this.options;
      return u
        ? ((o = this.getStack()) === null || o === void 0 ? void 0 : o.lead) ||
            this
        : this;
    }
    getPrevLead() {
      var o;
      const { layoutId: u } = this.options;
      return u
        ? (o = this.getStack()) === null || o === void 0
          ? void 0
          : o.prevLead
        : void 0;
    }
    getStack() {
      const { layoutId: o } = this.options;
      if (o) return this.root.sharedNodes.get(o);
    }
    promote({ needsReset: o, transition: u, preserveFollowOpacity: a } = {}) {
      const d = this.getStack();
      d && d.promote(this, a),
        o && ((this.projectionDelta = void 0), (this.needsReset = !0)),
        u && this.setOptions({ transition: u });
    }
    relegate() {
      const o = this.getStack();
      return o ? o.relegate(this) : !1;
    }
    resetSkewAndRotation() {
      const { visualElement: o } = this.options;
      if (!o) return;
      let u = !1;
      const { latestValues: a } = o;
      if (
        ((a.z ||
          a.rotate ||
          a.rotateX ||
          a.rotateY ||
          a.rotateZ ||
          a.skewX ||
          a.skewY) &&
          (u = !0),
        !u)
      )
        return;
      const d = {};
      a.z && Aa("z", o, d, this.animationValues);
      for (let p = 0; p < Pa.length; p++)
        Aa(`rotate${Pa[p]}`, o, d, this.animationValues),
          Aa(`skew${Pa[p]}`, o, d, this.animationValues);
      o.render();
      for (const p in d)
        o.setStaticValue(p, d[p]),
          this.animationValues && (this.animationValues[p] = d[p]);
      o.scheduleRender();
    }
    getProjectionStyles(o) {
      var u, a;
      if (!this.instance || this.isSVG) return;
      if (!this.isVisible) return Gx;
      const d = { visibility: "" },
        p = this.getTransformTemplate();
      if (this.needsReset)
        return (
          (this.needsReset = !1),
          (d.opacity = ""),
          (d.pointerEvents = Lo(o == null ? void 0 : o.pointerEvents) || ""),
          (d.transform = p ? p(this.latestValues, "") : "none"),
          d
        );
      const l = this.getLead();
      if (!this.projectionDelta || !this.layout || !l.target) {
        const v = {};
        return (
          this.options.layoutId &&
            ((v.opacity =
              this.latestValues.opacity !== void 0
                ? this.latestValues.opacity
                : 1),
            (v.pointerEvents = Lo(o == null ? void 0 : o.pointerEvents) || "")),
          this.hasProjected &&
            !Xn(this.latestValues) &&
            ((v.transform = p ? p({}, "") : "none"), (this.hasProjected = !1)),
          v
        );
      }
      const c = l.animationValues || l.latestValues;
      this.applyTransformsToTarget(),
        (d.transform = jx(
          this.projectionDeltaWithTransform,
          this.treeScale,
          c
        )),
        p && (d.transform = p(c, d.transform));
      const { x: f, y: m } = this.projectionDelta;
      (d.transformOrigin = `${f.origin * 100}% ${m.origin * 100}% 0`),
        l.animationValues
          ? (d.opacity =
              l === this
                ? (a =
                    (u = c.opacity) !== null && u !== void 0
                      ? u
                      : this.latestValues.opacity) !== null && a !== void 0
                  ? a
                  : 1
                : this.preserveOpacity
                ? this.latestValues.opacity
                : c.opacityExit)
          : (d.opacity =
              l === this
                ? c.opacity !== void 0
                  ? c.opacity
                  : ""
                : c.opacityExit !== void 0
                ? c.opacityExit
                : 0);
      for (const v in ll) {
        if (c[v] === void 0) continue;
        const { correct: w, applyTo: h } = ll[v],
          g = d.transform === "none" ? c[v] : w(c[v], l);
        if (h) {
          const y = h.length;
          for (let x = 0; x < y; x++) d[h[x]] = g;
        } else d[v] = g;
      }
      return (
        this.options.layoutId &&
          (d.pointerEvents =
            l === this
              ? Lo(o == null ? void 0 : o.pointerEvents) || ""
              : "none"),
        d
      );
    }
    clearSnapshot() {
      this.resumeFrom = this.snapshot = void 0;
    }
    resetTree() {
      this.root.nodes.forEach((o) => {
        var u;
        return (u = o.currentAnimation) === null || u === void 0
          ? void 0
          : u.stop();
      }),
        this.root.nodes.forEach(Up),
        this.root.sharedNodes.clear();
    }
  };
}
function Ux(e) {
  e.updateLayout();
}
function Kx(e) {
  var t;
  const n =
    ((t = e.resumeFrom) === null || t === void 0 ? void 0 : t.snapshot) ||
    e.snapshot;
  if (e.isLead() && e.layout && n && e.hasListeners("didUpdate")) {
    const { layoutBox: r, measuredBox: i } = e.layout,
      { animationType: s } = e.options,
      o = n.source !== e.layout.source;
    s === "size"
      ? ut((l) => {
          const c = o ? n.measuredBox[l] : n.layoutBox[l],
            f = et(c);
          (c.min = r[l].min), (c.max = c.min + f);
        })
      : tg(s, n.layoutBox, r) &&
        ut((l) => {
          const c = o ? n.measuredBox[l] : n.layoutBox[l],
            f = et(r[l]);
          (c.max = c.min + f),
            e.relativeTarget &&
              !e.currentAnimation &&
              ((e.isProjectionDirty = !0),
              (e.relativeTarget[l].max = e.relativeTarget[l].min + f));
        });
    const u = zr();
    rs(u, r, n.layoutBox);
    const a = zr();
    o ? rs(a, e.applyTransform(i, !0), n.measuredBox) : rs(a, r, n.layoutBox);
    const d = !Q0(u);
    let p = !1;
    if (!e.resumeFrom) {
      const l = e.getClosestProjectingParent();
      if (l && !l.resumeFrom) {
        const { snapshot: c, layout: f } = l;
        if (c && f) {
          const m = fe();
          is(m, n.layoutBox, c.layoutBox);
          const v = fe();
          is(v, r, f.layoutBox),
            q0(m, v) || (p = !0),
            l.options.layoutRoot &&
              ((e.relativeTarget = v),
              (e.relativeTargetOrigin = m),
              (e.relativeParent = l));
        }
      }
    }
    e.notifyListeners("didUpdate", {
      layout: r,
      snapshot: n,
      delta: a,
      layoutDelta: u,
      hasLayoutChanged: d,
      hasRelativeTargetChanged: p,
    });
  } else if (e.isLead()) {
    const { onExitComplete: r } = e.options;
    r && r();
  }
  e.options.transition = void 0;
}
function Yx(e) {
  Wi && Zn.totalNodes++,
    e.parent &&
      (e.isProjecting() || (e.isProjectionDirty = e.parent.isProjectionDirty),
      e.isSharedProjectionDirty ||
        (e.isSharedProjectionDirty = !!(
          e.isProjectionDirty ||
          e.parent.isProjectionDirty ||
          e.parent.isSharedProjectionDirty
        )),
      e.isTransformDirty || (e.isTransformDirty = e.parent.isTransformDirty));
}
function Xx(e) {
  e.isProjectionDirty = e.isSharedProjectionDirty = e.isTransformDirty = !1;
}
function Zx(e) {
  e.clearSnapshot();
}
function Up(e) {
  e.clearMeasurements();
}
function Qx(e) {
  e.isLayoutDirty = !1;
}
function qx(e) {
  const { visualElement: t } = e.options;
  t && t.getProps().onBeforeLayoutMeasure && t.notify("BeforeLayoutMeasure"),
    e.resetTransform();
}
function Kp(e) {
  e.finishAnimation(),
    (e.targetDelta = e.relativeTarget = e.target = void 0),
    (e.isProjectionDirty = !0);
}
function Jx(e) {
  e.resolveTargetDelta();
}
function e3(e) {
  e.calcProjection();
}
function t3(e) {
  e.resetSkewAndRotation();
}
function n3(e) {
  e.removeLeadSnapshot();
}
function Yp(e, t, n) {
  (e.translate = ae(t.translate, 0, n)),
    (e.scale = ae(t.scale, 1, n)),
    (e.origin = t.origin),
    (e.originPoint = t.originPoint);
}
function Xp(e, t, n, r) {
  (e.min = ae(t.min, n.min, r)), (e.max = ae(t.max, n.max, r));
}
function r3(e, t, n, r) {
  Xp(e.x, t.x, n.x, r), Xp(e.y, t.y, n.y, r);
}
function i3(e) {
  return e.animationValues && e.animationValues.opacityExit !== void 0;
}
const s3 = { duration: 0.45, ease: [0.4, 0, 0.1, 1] },
  Zp = (e) =>
    typeof navigator < "u" &&
    navigator.userAgent &&
    navigator.userAgent.toLowerCase().includes(e),
  Qp = Zp("applewebkit/") && !Zp("chrome/") ? Math.round : Ee;
function qp(e) {
  (e.min = Qp(e.min)), (e.max = Qp(e.max));
}
function o3(e) {
  qp(e.x), qp(e.y);
}
function tg(e, t, n) {
  return (
    e === "position" || (e === "preserve-aspect" && !lx($p(t), $p(n), 0.2))
  );
}
function l3(e) {
  var t;
  return (
    e !== e.root &&
    ((t = e.scroll) === null || t === void 0 ? void 0 : t.wasRoot)
  );
}
const a3 = eg({
    attachResizeListener: (e, t) => Kt(e, "resize", t),
    measureScroll: () => ({
      x: document.documentElement.scrollLeft || document.body.scrollLeft,
      y: document.documentElement.scrollTop || document.body.scrollTop,
    }),
    checkIsScrollRoot: () => !0,
  }),
  ka = { current: void 0 },
  ng = eg({
    measureScroll: (e) => ({ x: e.scrollLeft, y: e.scrollTop }),
    defaultParent: () => {
      if (!ka.current) {
        const e = new a3({});
        e.mount(window), e.setOptions({ layoutScroll: !0 }), (ka.current = e);
      }
      return ka.current;
    },
    resetTransform: (e, t) => {
      e.style.transform = t !== void 0 ? t : "none";
    },
    checkIsScrollRoot: (e) => window.getComputedStyle(e).position === "fixed",
  }),
  u3 = {
    pan: { Feature: Cx },
    drag: { Feature: _x, ProjectionNode: ng, MeasureLayout: Y0 },
  };
function Jp(e, t) {
  const n = t ? "pointerenter" : "pointerleave",
    r = t ? "onHoverStart" : "onHoverEnd",
    i = (s, o) => {
      if (s.pointerType === "touch" || F0()) return;
      const u = e.getProps();
      e.animationState &&
        u.whileHover &&
        e.animationState.setActive("whileHover", t);
      const a = u[r];
      a && Q.postRender(() => a(s, o));
    };
  return Jt(e.current, n, i, { passive: !e.getProps()[r] });
}
class c3 extends zn {
  mount() {
    this.unmount = qt(Jp(this.node, !0), Jp(this.node, !1));
  }
  unmount() {}
}
class d3 extends zn {
  constructor() {
    super(...arguments), (this.isActive = !1);
  }
  onFocus() {
    let t = !1;
    try {
      t = this.node.current.matches(":focus-visible");
    } catch {
      t = !0;
    }
    !t ||
      !this.node.animationState ||
      (this.node.animationState.setActive("whileFocus", !0),
      (this.isActive = !0));
  }
  onBlur() {
    !this.isActive ||
      !this.node.animationState ||
      (this.node.animationState.setActive("whileFocus", !1),
      (this.isActive = !1));
  }
  mount() {
    this.unmount = qt(
      Kt(this.node.current, "focus", () => this.onFocus()),
      Kt(this.node.current, "blur", () => this.onBlur())
    );
  }
  unmount() {}
}
const rg = (e, t) => (t ? (e === t ? !0 : rg(e, t.parentElement)) : !1);
function Ma(e, t) {
  if (!t) return;
  const n = new PointerEvent("pointer" + e);
  t(n, Il(n));
}
class f3 extends zn {
  constructor() {
    super(...arguments),
      (this.removeStartListeners = Ee),
      (this.removeEndListeners = Ee),
      (this.removeAccessibleListeners = Ee),
      (this.startPointerPress = (t, n) => {
        if (this.isPressing) return;
        this.removeEndListeners();
        const r = this.node.getProps(),
          s = Jt(
            window,
            "pointerup",
            (u, a) => {
              if (!this.checkPressEnd()) return;
              const {
                  onTap: d,
                  onTapCancel: p,
                  globalTapTarget: l,
                } = this.node.getProps(),
                c = !l && !rg(this.node.current, u.target) ? p : d;
              c && Q.update(() => c(u, a));
            },
            { passive: !(r.onTap || r.onPointerUp) }
          ),
          o = Jt(window, "pointercancel", (u, a) => this.cancelPress(u, a), {
            passive: !(r.onTapCancel || r.onPointerCancel),
          });
        (this.removeEndListeners = qt(s, o)), this.startPress(t, n);
      }),
      (this.startAccessiblePress = () => {
        const t = (s) => {
            if (s.key !== "Enter" || this.isPressing) return;
            const o = (u) => {
              u.key !== "Enter" ||
                !this.checkPressEnd() ||
                Ma("up", (a, d) => {
                  const { onTap: p } = this.node.getProps();
                  p && Q.postRender(() => p(a, d));
                });
            };
            this.removeEndListeners(),
              (this.removeEndListeners = Kt(this.node.current, "keyup", o)),
              Ma("down", (u, a) => {
                this.startPress(u, a);
              });
          },
          n = Kt(this.node.current, "keydown", t),
          r = () => {
            this.isPressing && Ma("cancel", (s, o) => this.cancelPress(s, o));
          },
          i = Kt(this.node.current, "blur", r);
        this.removeAccessibleListeners = qt(n, i);
      });
  }
  startPress(t, n) {
    this.isPressing = !0;
    const { onTapStart: r, whileTap: i } = this.node.getProps();
    i &&
      this.node.animationState &&
      this.node.animationState.setActive("whileTap", !0),
      r && Q.postRender(() => r(t, n));
  }
  checkPressEnd() {
    return (
      this.removeEndListeners(),
      (this.isPressing = !1),
      this.node.getProps().whileTap &&
        this.node.animationState &&
        this.node.animationState.setActive("whileTap", !1),
      !F0()
    );
  }
  cancelPress(t, n) {
    if (!this.checkPressEnd()) return;
    const { onTapCancel: r } = this.node.getProps();
    r && Q.postRender(() => r(t, n));
  }
  mount() {
    const t = this.node.getProps(),
      n = Jt(
        t.globalTapTarget ? window : this.node.current,
        "pointerdown",
        this.startPointerPress,
        { passive: !(t.onTapStart || t.onPointerStart) }
      ),
      r = Kt(this.node.current, "focus", this.startAccessiblePress);
    this.removeStartListeners = qt(n, r);
  }
  unmount() {
    this.removeStartListeners(),
      this.removeEndListeners(),
      this.removeAccessibleListeners();
  }
}
const Uu = new WeakMap(),
  ba = new WeakMap(),
  p3 = (e) => {
    const t = Uu.get(e.target);
    t && t(e);
  },
  h3 = (e) => {
    e.forEach(p3);
  };
function m3({ root: e, ...t }) {
  const n = e || document;
  ba.has(n) || ba.set(n, {});
  const r = ba.get(n),
    i = JSON.stringify(t);
  return r[i] || (r[i] = new IntersectionObserver(h3, { root: e, ...t })), r[i];
}
function g3(e, t, n) {
  const r = m3(t);
  return (
    Uu.set(e, n),
    r.observe(e),
    () => {
      Uu.delete(e), r.unobserve(e);
    }
  );
}
const v3 = { some: 0, all: 1 };
class y3 extends zn {
  constructor() {
    super(...arguments), (this.hasEnteredView = !1), (this.isInView = !1);
  }
  startObserver() {
    this.unmount();
    const { viewport: t = {} } = this.node.getProps(),
      { root: n, margin: r, amount: i = "some", once: s } = t,
      o = {
        root: n ? n.current : void 0,
        rootMargin: r,
        threshold: typeof i == "number" ? i : v3[i],
      },
      u = (a) => {
        const { isIntersecting: d } = a;
        if (
          this.isInView === d ||
          ((this.isInView = d), s && !d && this.hasEnteredView)
        )
          return;
        d && (this.hasEnteredView = !0),
          this.node.animationState &&
            this.node.animationState.setActive("whileInView", d);
        const { onViewportEnter: p, onViewportLeave: l } = this.node.getProps(),
          c = d ? p : l;
        c && c(a);
      };
    return g3(this.node.current, o, u);
  }
  mount() {
    this.startObserver();
  }
  update() {
    if (typeof IntersectionObserver > "u") return;
    const { props: t, prevProps: n } = this.node;
    ["amount", "margin", "root"].some(w3(t, n)) && this.startObserver();
  }
  unmount() {}
}
function w3({ viewport: e = {} }, { viewport: t = {} } = {}) {
  return (n) => e[n] !== t[n];
}
const x3 = {
    inView: { Feature: y3 },
    tap: { Feature: f3 },
    focus: { Feature: d3 },
    hover: { Feature: c3 },
  },
  S3 = { layout: { ProjectionNode: ng, MeasureLayout: Y0 } },
  gd = C.createContext({
    transformPagePoint: (e) => e,
    isStatic: !1,
    reducedMotion: "never",
  }),
  jl = C.createContext({}),
  vd = typeof window < "u",
  ig = vd ? C.useLayoutEffect : C.useEffect,
  sg = C.createContext({ strict: !1 });
let eh = !1;
function _3(e, t, n, r, i) {
  var s;
  const { visualElement: o } = C.useContext(jl),
    u = C.useContext(sg),
    a = C.useContext(Nl),
    d = C.useContext(gd).reducedMotion,
    p = C.useRef();
  (r = r || u.renderer),
    !p.current &&
      r &&
      (p.current = r(e, {
        visualState: t,
        parent: o,
        props: n,
        presenceContext: a,
        blockInitialAnimation: a ? a.initial === !1 : !1,
        reducedMotionConfig: d,
      }));
  const l = p.current,
    c = C.useContext(K0);
  l &&
    !l.projection &&
    i &&
    (l.type === "html" || l.type === "svg") &&
    T3(p.current, n, i, c),
    C.useInsertionEffect(() => {
      l && l.update(n, a);
    });
  const f = n[M0],
    m = C.useRef(
      !!f &&
        !window.MotionHandoffIsComplete &&
        ((s = window.MotionHasOptimisedAnimation) === null || s === void 0
          ? void 0
          : s.call(window, f))
    );
  return (
    ig(() => {
      l &&
        (l.updateFeatures(),
        md.render(l.render),
        m.current && l.animationState && l.animationState.animateChanges());
    }),
    C.useEffect(() => {
      l &&
        (!m.current && l.animationState && l.animationState.animateChanges(),
        (m.current = !1),
        eh || ((eh = !0), queueMicrotask(C3)));
    }),
    l
  );
}
function C3() {
  window.MotionHandoffIsComplete = !0;
}
function T3(e, t, n, r) {
  const {
    layoutId: i,
    layout: s,
    drag: o,
    dragConstraints: u,
    layoutScroll: a,
    layoutRoot: d,
  } = t;
  (e.projection = new n(
    e.latestValues,
    t["data-framer-portal-id"] ? void 0 : og(e.parent)
  )),
    e.projection.setOptions({
      layoutId: i,
      layout: s,
      alwaysMeasureLayout: !!o || (u && Fr(u)),
      visualElement: e,
      animationType: typeof s == "string" ? s : "both",
      initialPromotionConfig: r,
      layoutScroll: a,
      layoutRoot: d,
    });
}
function og(e) {
  if (e) return e.options.allowProjection !== !1 ? e.projection : og(e.parent);
}
function E3(e, t, n) {
  return C.useCallback(
    (r) => {
      r && e.mount && e.mount(r),
        t && (r ? t.mount(r) : t.unmount()),
        n && (typeof n == "function" ? n(r) : Fr(n) && (n.current = r));
    },
    [t]
  );
}
function Fl(e) {
  return Cs(e.animate) || Jc.some((t) => Ts(e[t]));
}
function lg(e) {
  return !!(Fl(e) || e.variants);
}
function P3(e, t) {
  if (Fl(e)) {
    const { initial: n, animate: r } = e;
    return {
      initial: n === !1 || Ts(n) ? n : void 0,
      animate: Ts(r) ? r : void 0,
    };
  }
  return e.inherit !== !1 ? t : {};
}
function A3(e) {
  const { initial: t, animate: n } = P3(e, C.useContext(jl));
  return C.useMemo(() => ({ initial: t, animate: n }), [th(t), th(n)]);
}
function th(e) {
  return Array.isArray(e) ? e.join(" ") : e;
}
const nh = {
    animation: [
      "animate",
      "variants",
      "whileHover",
      "whileTap",
      "exit",
      "whileInView",
      "whileFocus",
      "whileDrag",
    ],
    exit: ["exit"],
    drag: ["drag", "dragControls"],
    focus: ["whileFocus"],
    hover: ["whileHover", "onHoverStart", "onHoverEnd"],
    tap: ["whileTap", "onTap", "onTapStart", "onTapCancel"],
    pan: ["onPan", "onPanStart", "onPanSessionStart", "onPanEnd"],
    inView: ["whileInView", "onViewportEnter", "onViewportLeave"],
    layout: ["layout", "layoutId"],
  },
  oi = {};
for (const e in nh) oi[e] = { isEnabled: (t) => nh[e].some((n) => !!t[n]) };
function k3(e) {
  for (const t in e) oi[t] = { ...oi[t], ...e[t] };
}
const M3 = Symbol.for("motionComponentSymbol");
function b3({
  preloadedFeatures: e,
  createVisualElement: t,
  useRender: n,
  useVisualState: r,
  Component: i,
}) {
  e && k3(e);
  function s(u, a) {
    let d;
    const p = { ...C.useContext(gd), ...u, layoutId: L3(u) },
      { isStatic: l } = p,
      c = A3(u),
      f = r(u, l);
    if (!l && vd) {
      O3();
      const m = D3(p);
      (d = m.MeasureLayout),
        (c.visualElement = _3(i, f, p, t, m.ProjectionNode));
    }
    return _.jsxs(jl.Provider, {
      value: c,
      children: [
        d && c.visualElement
          ? _.jsx(d, { visualElement: c.visualElement, ...p })
          : null,
        n(i, u, E3(f, c.visualElement, a), f, l, c.visualElement),
      ],
    });
  }
  const o = C.forwardRef(s);
  return (o[M3] = i), o;
}
function L3({ layoutId: e }) {
  const t = C.useContext(hd).id;
  return t && e !== void 0 ? t + "-" + e : e;
}
function O3(e, t) {
  C.useContext(sg).strict;
}
function D3(e) {
  const { drag: t, layout: n } = oi;
  if (!t && !n) return {};
  const r = { ...t, ...n };
  return {
    MeasureLayout:
      (t != null && t.isEnabled(e)) || (n != null && n.isEnabled(e))
        ? r.MeasureLayout
        : void 0,
    ProjectionNode: r.ProjectionNode,
  };
}
const R3 = [
  "animate",
  "circle",
  "defs",
  "desc",
  "ellipse",
  "g",
  "image",
  "line",
  "filter",
  "marker",
  "mask",
  "metadata",
  "path",
  "pattern",
  "polygon",
  "polyline",
  "rect",
  "stop",
  "switch",
  "symbol",
  "svg",
  "text",
  "tspan",
  "use",
  "view",
];
function yd(e) {
  return typeof e != "string" || e.includes("-")
    ? !1
    : !!(R3.indexOf(e) > -1 || /[A-Z]/u.test(e));
}
function ag(e, { style: t, vars: n }, r, i) {
  Object.assign(e.style, t, i && i.getProjectionStyles(r));
  for (const s in n) e.style.setProperty(s, n[s]);
}
const ug = new Set([
  "baseFrequency",
  "diffuseConstant",
  "kernelMatrix",
  "kernelUnitLength",
  "keySplines",
  "keyTimes",
  "limitingConeAngle",
  "markerHeight",
  "markerWidth",
  "numOctaves",
  "targetX",
  "targetY",
  "surfaceScale",
  "specularConstant",
  "specularExponent",
  "stdDeviation",
  "tableValues",
  "viewBox",
  "gradientTransform",
  "pathLength",
  "startOffset",
  "textLength",
  "lengthAdjust",
]);
function cg(e, t, n, r) {
  ag(e, t, void 0, r);
  for (const i in t.attrs) e.setAttribute(ug.has(i) ? i : Vl(i), t.attrs[i]);
}
function dg(e, { layout: t, layoutId: n }) {
  return (
    Fn.has(e) ||
    e.startsWith("origin") ||
    ((t || n !== void 0) && (!!ll[e] || e === "opacity"))
  );
}
function wd(e, t, n) {
  var r;
  const { style: i } = e,
    s = {};
  for (const o in i)
    (Oe(i[o]) ||
      (t.style && Oe(t.style[o])) ||
      dg(o, e) ||
      ((r = n == null ? void 0 : n.getValue(o)) === null || r === void 0
        ? void 0
        : r.liveStyle) !== void 0) &&
      (s[o] = i[o]);
  return (
    n && i && typeof i.willChange == "string" && (n.applyWillChange = !1), s
  );
}
function fg(e, t, n) {
  const r = wd(e, t, n);
  for (const i in e)
    if (Oe(e[i]) || Oe(t[i])) {
      const s =
        Vs.indexOf(i) !== -1
          ? "attr" + i.charAt(0).toUpperCase() + i.substring(1)
          : i;
      r[s] = e[i];
    }
  return r;
}
function xd(e) {
  const t = C.useRef(null);
  return t.current === null && (t.current = e()), t.current;
}
function V3(
  {
    applyWillChange: e = !1,
    scrapeMotionValuesFromProps: t,
    createRenderState: n,
    onMount: r,
  },
  i,
  s,
  o,
  u
) {
  const a = { latestValues: N3(i, s, o, u ? !1 : e, t), renderState: n() };
  return r && (a.mount = (d) => r(i, d, a)), a;
}
const pg = (e) => (t, n) => {
  const r = C.useContext(jl),
    i = C.useContext(Nl),
    s = () => V3(e, t, r, i, n);
  return n ? s() : xd(s);
};
function I3(e, t) {
  const n = L0(t);
  n && Dl(e, n);
}
function rh(e, t, n) {
  const r = Array.isArray(t) ? t : [t];
  for (let i = 0; i < r.length; i++) {
    const s = Qc(e, r[i]);
    if (s) {
      const { transitionEnd: o, transition: u, ...a } = s;
      n(a, o);
    }
  }
}
function N3(e, t, n, r, i) {
  var s;
  const o = {},
    u = [],
    a =
      r &&
      ((s = e.style) === null || s === void 0 ? void 0 : s.willChange) ===
        void 0,
    d = i(e, {});
  for (const w in d) o[w] = Lo(d[w]);
  let { initial: p, animate: l } = e;
  const c = Fl(e),
    f = lg(e);
  t &&
    f &&
    !c &&
    e.inherit !== !1 &&
    (p === void 0 && (p = t.initial), l === void 0 && (l = t.animate));
  let m = n ? n.initial === !1 : !1;
  m = m || p === !1;
  const v = m ? l : p;
  return (
    v &&
      typeof v != "boolean" &&
      !Cs(v) &&
      rh(e, v, (w, h) => {
        for (const g in w) {
          let y = w[g];
          if (Array.isArray(y)) {
            const x = m ? y.length - 1 : 0;
            y = y[x];
          }
          y !== null && (o[g] = y);
        }
        for (const g in h) o[g] = h[g];
      }),
    a &&
      (l &&
        p !== !1 &&
        !Cs(l) &&
        rh(e, l, (w) => {
          for (const h in w) I3(u, h);
        }),
      u.length && (o.willChange = u.join(","))),
    o
  );
}
const Sd = () => ({ style: {}, transform: {}, transformOrigin: {}, vars: {} }),
  hg = () => ({ ...Sd(), attrs: {} }),
  mg = (e, t) => (t && typeof e == "number" ? t.transform(e) : e),
  j3 = {
    x: "translateX",
    y: "translateY",
    z: "translateZ",
    transformPerspective: "perspective",
  },
  F3 = Vs.length;
function z3(e, t, n) {
  let r = "",
    i = !0;
  for (let s = 0; s < F3; s++) {
    const o = Vs[s],
      u = e[o];
    if (u === void 0) continue;
    let a = !0;
    if (
      (typeof u == "number"
        ? (a = u === (o.startsWith("scale") ? 1 : 0))
        : (a = parseFloat(u) === 0),
      !a || n)
    ) {
      const d = mg(u, sd[o]);
      if (!a) {
        i = !1;
        const p = j3[o] || o;
        r += `${p}(${d}) `;
      }
      n && (t[o] = d);
    }
  }
  return (r = r.trim()), n ? (r = n(t, i ? "" : r)) : i && (r = "none"), r;
}
function _d(e, t, n) {
  const { style: r, vars: i, transformOrigin: s } = e;
  let o = !1,
    u = !1;
  for (const a in t) {
    const d = t[a];
    if (Fn.has(a)) {
      o = !0;
      continue;
    } else if (q1(a)) {
      i[a] = d;
      continue;
    } else {
      const p = mg(d, sd[a]);
      a.startsWith("origin") ? ((u = !0), (s[a] = p)) : (r[a] = p);
    }
  }
  if (
    (t.transform ||
      (o || n
        ? (r.transform = z3(t, e.transform, n))
        : r.transform && (r.transform = "none")),
    u)
  ) {
    const { originX: a = "50%", originY: d = "50%", originZ: p = 0 } = s;
    r.transformOrigin = `${a} ${d} ${p}`;
  }
}
function ih(e, t, n) {
  return typeof e == "string" ? e : F.transform(t + n * e);
}
function B3(e, t, n) {
  const r = ih(t, e.x, e.width),
    i = ih(n, e.y, e.height);
  return `${r} ${i}`;
}
const H3 = { offset: "stroke-dashoffset", array: "stroke-dasharray" },
  $3 = { offset: "strokeDashoffset", array: "strokeDasharray" };
function G3(e, t, n = 1, r = 0, i = !0) {
  e.pathLength = 1;
  const s = i ? H3 : $3;
  e[s.offset] = F.transform(-r);
  const o = F.transform(t),
    u = F.transform(n);
  e[s.array] = `${o} ${u}`;
}
function Cd(
  e,
  {
    attrX: t,
    attrY: n,
    attrScale: r,
    originX: i,
    originY: s,
    pathLength: o,
    pathSpacing: u = 1,
    pathOffset: a = 0,
    ...d
  },
  p,
  l
) {
  if ((_d(e, d, l), p)) {
    e.style.viewBox && (e.attrs.viewBox = e.style.viewBox);
    return;
  }
  (e.attrs = e.style), (e.style = {});
  const { attrs: c, style: f, dimensions: m } = e;
  c.transform && (m && (f.transform = c.transform), delete c.transform),
    m &&
      (i !== void 0 || s !== void 0 || f.transform) &&
      (f.transformOrigin = B3(
        m,
        i !== void 0 ? i : 0.5,
        s !== void 0 ? s : 0.5
      )),
    t !== void 0 && (c.x = t),
    n !== void 0 && (c.y = n),
    r !== void 0 && (c.scale = r),
    o !== void 0 && G3(c, o, u, a, !1);
}
const Td = (e) => typeof e == "string" && e.toLowerCase() === "svg",
  W3 = {
    useVisualState: pg({
      scrapeMotionValuesFromProps: fg,
      createRenderState: hg,
      onMount: (e, t, { renderState: n, latestValues: r }) => {
        Q.read(() => {
          try {
            n.dimensions =
              typeof t.getBBox == "function"
                ? t.getBBox()
                : t.getBoundingClientRect();
          } catch {
            n.dimensions = { x: 0, y: 0, width: 0, height: 0 };
          }
        }),
          Q.render(() => {
            Cd(n, r, Td(t.tagName), e.transformTemplate), cg(t, n);
          });
      },
    }),
  },
  U3 = {
    useVisualState: pg({
      applyWillChange: !0,
      scrapeMotionValuesFromProps: wd,
      createRenderState: Sd,
    }),
  };
function gg(e, t, n) {
  for (const r in t) !Oe(t[r]) && !dg(r, n) && (e[r] = t[r]);
}
function K3({ transformTemplate: e }, t) {
  return C.useMemo(() => {
    const n = Sd();
    return _d(n, t, e), Object.assign({}, n.vars, n.style);
  }, [t]);
}
function Y3(e, t) {
  const n = e.style || {},
    r = {};
  return gg(r, n, e), Object.assign(r, K3(e, t)), r;
}
function X3(e, t) {
  const n = {},
    r = Y3(e, t);
  return (
    e.drag &&
      e.dragListener !== !1 &&
      ((n.draggable = !1),
      (r.userSelect = r.WebkitUserSelect = r.WebkitTouchCallout = "none"),
      (r.touchAction =
        e.drag === !0 ? "none" : `pan-${e.drag === "x" ? "y" : "x"}`)),
    e.tabIndex === void 0 &&
      (e.onTap || e.onTapStart || e.whileTap) &&
      (n.tabIndex = 0),
    (n.style = r),
    n
  );
}
const Z3 = new Set([
  "animate",
  "exit",
  "variants",
  "initial",
  "style",
  "values",
  "variants",
  "transition",
  "transformTemplate",
  "custom",
  "inherit",
  "onBeforeLayoutMeasure",
  "onAnimationStart",
  "onAnimationComplete",
  "onUpdate",
  "onDragStart",
  "onDrag",
  "onDragEnd",
  "onMeasureDragConstraints",
  "onDirectionLock",
  "onDragTransitionEnd",
  "_dragX",
  "_dragY",
  "onHoverStart",
  "onHoverEnd",
  "onViewportEnter",
  "onViewportLeave",
  "globalTapTarget",
  "ignoreStrict",
  "viewport",
]);
function al(e) {
  return (
    e.startsWith("while") ||
    (e.startsWith("drag") && e !== "draggable") ||
    e.startsWith("layout") ||
    e.startsWith("onTap") ||
    e.startsWith("onPan") ||
    e.startsWith("onLayout") ||
    Z3.has(e)
  );
}
let vg = (e) => !al(e);
function Q3(e) {
  e && (vg = (t) => (t.startsWith("on") ? !al(t) : e(t)));
}
try {
  Q3(require("@emotion/is-prop-valid").default);
} catch {}
function q3(e, t, n) {
  const r = {};
  for (const i in e)
    (i === "values" && typeof e.values == "object") ||
      ((vg(i) ||
        (n === !0 && al(i)) ||
        (!t && !al(i)) ||
        (e.draggable && i.startsWith("onDrag"))) &&
        (r[i] = e[i]));
  return r;
}
function J3(e, t, n, r) {
  const i = C.useMemo(() => {
    const s = hg();
    return (
      Cd(s, t, Td(r), e.transformTemplate),
      { ...s.attrs, style: { ...s.style } }
    );
  }, [t]);
  if (e.style) {
    const s = {};
    gg(s, e.style, e), (i.style = { ...s, ...i.style });
  }
  return i;
}
function e8(e = !1) {
  return (n, r, i, { latestValues: s }, o) => {
    const a = (yd(n) ? J3 : X3)(r, s, o, n),
      d = q3(r, typeof n == "string", e),
      p = n !== C.Fragment ? { ...d, ...a, ref: i } : {},
      { children: l } = r,
      c = C.useMemo(() => (Oe(l) ? l.get() : l), [l]);
    return C.createElement(n, { ...p, children: c });
  };
}
function t8(e, t) {
  return function (r, { forwardMotionProps: i } = { forwardMotionProps: !1 }) {
    const o = {
      ...(yd(r) ? W3 : U3),
      preloadedFeatures: e,
      useRender: e8(i),
      createVisualElement: t,
      Component: r,
    };
    return b3(o);
  };
}
const Ku = { current: null },
  yg = { current: !1 };
function n8() {
  if (((yg.current = !0), !!vd))
    if (window.matchMedia) {
      const e = window.matchMedia("(prefers-reduced-motion)"),
        t = () => (Ku.current = e.matches);
      e.addListener(t), t();
    } else Ku.current = !1;
}
function r8(e, t, n) {
  for (const r in t) {
    const i = t[r],
      s = n[r];
    if (Oe(i)) e.addValue(r, i);
    else if (Oe(s)) e.addValue(r, As(i, { owner: e }));
    else if (s !== i)
      if (e.hasValue(r)) {
        const o = e.getValue(r);
        o.liveStyle === !0 ? o.jump(i) : o.hasAnimated || o.set(i);
      } else {
        const o = e.getStaticValue(r);
        e.addValue(r, As(o !== void 0 ? o : i, { owner: e }));
      }
  }
  for (const r in n) t[r] === void 0 && e.removeValue(r);
  return t;
}
const sh = new WeakMap(),
  i8 = [...t0, be, Dn],
  s8 = (e) => i8.find(e0(e)),
  oh = [
    "AnimationStart",
    "AnimationComplete",
    "Update",
    "BeforeLayoutMeasure",
    "LayoutMeasure",
    "LayoutAnimationStart",
    "LayoutAnimationComplete",
  ];
class o8 {
  scrapeMotionValuesFromProps(t, n, r) {
    return {};
  }
  constructor(
    {
      parent: t,
      props: n,
      presenceContext: r,
      reducedMotionConfig: i,
      blockInitialAnimation: s,
      visualState: o,
    },
    u = {}
  ) {
    (this.applyWillChange = !1),
      (this.current = null),
      (this.children = new Set()),
      (this.isVariantNode = !1),
      (this.isControllingVariants = !1),
      (this.shouldReduceMotion = null),
      (this.values = new Map()),
      (this.KeyframeResolver = rd),
      (this.features = {}),
      (this.valueSubscriptions = new Map()),
      (this.prevMotionValues = {}),
      (this.events = {}),
      (this.propEventSubscriptions = {}),
      (this.notifyUpdate = () => this.notify("Update", this.latestValues)),
      (this.render = () => {
        (this.isRenderScheduled = !1),
          this.current &&
            (this.triggerBuild(),
            this.renderInstance(
              this.current,
              this.renderState,
              this.props.style,
              this.projection
            ));
      }),
      (this.isRenderScheduled = !1),
      (this.scheduleRender = () => {
        this.isRenderScheduled ||
          ((this.isRenderScheduled = !0), Q.render(this.render, !1, !0));
      });
    const { latestValues: a, renderState: d } = o;
    (this.latestValues = a),
      (this.baseTarget = { ...a }),
      (this.initialValues = n.initial ? { ...a } : {}),
      (this.renderState = d),
      (this.parent = t),
      (this.props = n),
      (this.presenceContext = r),
      (this.depth = t ? t.depth + 1 : 0),
      (this.reducedMotionConfig = i),
      (this.options = u),
      (this.blockInitialAnimation = !!s),
      (this.isControllingVariants = Fl(n)),
      (this.isVariantNode = lg(n)),
      this.isVariantNode && (this.variantChildren = new Set()),
      (this.manuallyAnimateOnMount = !!(t && t.current));
    const { willChange: p, ...l } = this.scrapeMotionValuesFromProps(
      n,
      {},
      this
    );
    for (const c in l) {
      const f = l[c];
      a[c] !== void 0 && Oe(f) && f.set(a[c], !1);
    }
  }
  mount(t) {
    (this.current = t),
      sh.set(t, this),
      this.projection && !this.projection.instance && this.projection.mount(t),
      this.parent &&
        this.isVariantNode &&
        !this.isControllingVariants &&
        (this.removeFromVariantTree = this.parent.addVariantChild(this)),
      this.values.forEach((n, r) => this.bindToMotionValue(r, n)),
      yg.current || n8(),
      (this.shouldReduceMotion =
        this.reducedMotionConfig === "never"
          ? !1
          : this.reducedMotionConfig === "always"
          ? !0
          : Ku.current),
      this.parent && this.parent.children.add(this),
      this.update(this.props, this.presenceContext);
  }
  unmount() {
    sh.delete(this.current),
      this.projection && this.projection.unmount(),
      on(this.notifyUpdate),
      on(this.render),
      this.valueSubscriptions.forEach((t) => t()),
      this.valueSubscriptions.clear(),
      this.removeFromVariantTree && this.removeFromVariantTree(),
      this.parent && this.parent.children.delete(this);
    for (const t in this.events) this.events[t].clear();
    for (const t in this.features) {
      const n = this.features[t];
      n && (n.unmount(), (n.isMounted = !1));
    }
    this.current = null;
  }
  bindToMotionValue(t, n) {
    this.valueSubscriptions.has(t) && this.valueSubscriptions.get(t)();
    const r = Fn.has(t),
      i = n.on("change", (u) => {
        (this.latestValues[t] = u),
          this.props.onUpdate && Q.preRender(this.notifyUpdate),
          r && this.projection && (this.projection.isTransformDirty = !0);
      }),
      s = n.on("renderRequest", this.scheduleRender);
    let o;
    window.MotionCheckAppearSync &&
      (o = window.MotionCheckAppearSync(this, t, n)),
      this.valueSubscriptions.set(t, () => {
        i(), s(), o && o(), n.owner && n.stop();
      });
  }
  sortNodePosition(t) {
    return !this.current ||
      !this.sortInstanceNodePosition ||
      this.type !== t.type
      ? 0
      : this.sortInstanceNodePosition(this.current, t.current);
  }
  updateFeatures() {
    let t = "animation";
    for (t in oi) {
      const n = oi[t];
      if (!n) continue;
      const { isEnabled: r, Feature: i } = n;
      if (
        (!this.features[t] &&
          i &&
          r(this.props) &&
          (this.features[t] = new i(this)),
        this.features[t])
      ) {
        const s = this.features[t];
        s.isMounted ? s.update() : (s.mount(), (s.isMounted = !0));
      }
    }
  }
  triggerBuild() {
    this.build(this.renderState, this.latestValues, this.props);
  }
  measureViewportBox() {
    return this.current
      ? this.measureInstanceViewportBox(this.current, this.props)
      : fe();
  }
  getStaticValue(t) {
    return this.latestValues[t];
  }
  setStaticValue(t, n) {
    this.latestValues[t] = n;
  }
  update(t, n) {
    (t.transformTemplate || this.props.transformTemplate) &&
      this.scheduleRender(),
      (this.prevProps = this.props),
      (this.props = t),
      (this.prevPresenceContext = this.presenceContext),
      (this.presenceContext = n);
    for (let r = 0; r < oh.length; r++) {
      const i = oh[r];
      this.propEventSubscriptions[i] &&
        (this.propEventSubscriptions[i](),
        delete this.propEventSubscriptions[i]);
      const s = "on" + i,
        o = t[s];
      o && (this.propEventSubscriptions[i] = this.on(i, o));
    }
    (this.prevMotionValues = r8(
      this,
      this.scrapeMotionValuesFromProps(t, this.prevProps, this),
      this.prevMotionValues
    )),
      this.handleChildMotionValue && this.handleChildMotionValue();
  }
  getProps() {
    return this.props;
  }
  getVariant(t) {
    return this.props.variants ? this.props.variants[t] : void 0;
  }
  getDefaultTransition() {
    return this.props.transition;
  }
  getTransformPagePoint() {
    return this.props.transformPagePoint;
  }
  getClosestVariantNode() {
    return this.isVariantNode
      ? this
      : this.parent
      ? this.parent.getClosestVariantNode()
      : void 0;
  }
  addVariantChild(t) {
    const n = this.getClosestVariantNode();
    if (n)
      return (
        n.variantChildren && n.variantChildren.add(t),
        () => n.variantChildren.delete(t)
      );
  }
  addValue(t, n) {
    const r = this.values.get(t);
    n !== r &&
      (r && this.removeValue(t),
      this.bindToMotionValue(t, n),
      this.values.set(t, n),
      (this.latestValues[t] = n.get()));
  }
  removeValue(t) {
    this.values.delete(t);
    const n = this.valueSubscriptions.get(t);
    n && (n(), this.valueSubscriptions.delete(t)),
      delete this.latestValues[t],
      this.removeValueFromRenderState(t, this.renderState);
  }
  hasValue(t) {
    return this.values.has(t);
  }
  getValue(t, n) {
    if (this.props.values && this.props.values[t]) return this.props.values[t];
    let r = this.values.get(t);
    return (
      r === void 0 &&
        n !== void 0 &&
        ((r = As(n === null ? void 0 : n, { owner: this })),
        this.addValue(t, r)),
      r
    );
  }
  readValue(t, n) {
    var r;
    let i =
      this.latestValues[t] !== void 0 || !this.current
        ? this.latestValues[t]
        : (r = this.getBaseTargetFromProps(this.props, t)) !== null &&
          r !== void 0
        ? r
        : this.readValueFromInstance(this.current, t, this.options);
    return (
      i != null &&
        (typeof i == "string" && (Z1(i) || Y1(i))
          ? (i = parseFloat(i))
          : !s8(i) && Dn.test(n) && (i = u0(t, n)),
        this.setBaseTarget(t, Oe(i) ? i.get() : i)),
      Oe(i) ? i.get() : i
    );
  }
  setBaseTarget(t, n) {
    this.baseTarget[t] = n;
  }
  getBaseTarget(t) {
    var n;
    const { initial: r } = this.props;
    let i;
    if (typeof r == "string" || typeof r == "object") {
      const o = Qc(
        this.props,
        r,
        (n = this.presenceContext) === null || n === void 0 ? void 0 : n.custom
      );
      o && (i = o[t]);
    }
    if (r && i !== void 0) return i;
    const s = this.getBaseTargetFromProps(this.props, t);
    return s !== void 0 && !Oe(s)
      ? s
      : this.initialValues[t] !== void 0 && i === void 0
      ? void 0
      : this.baseTarget[t];
  }
  on(t, n) {
    return this.events[t] || (this.events[t] = new pd()), this.events[t].add(n);
  }
  notify(t, ...n) {
    this.events[t] && this.events[t].notify(...n);
  }
}
class wg extends o8 {
  constructor() {
    super(...arguments), (this.KeyframeResolver = c0);
  }
  sortInstanceNodePosition(t, n) {
    return t.compareDocumentPosition(n) & 2 ? 1 : -1;
  }
  getBaseTargetFromProps(t, n) {
    return t.style ? t.style[n] : void 0;
  }
  removeValueFromRenderState(t, { vars: n, style: r }) {
    delete n[t], delete r[t];
  }
}
function l8(e) {
  return window.getComputedStyle(e);
}
class a8 extends wg {
  constructor() {
    super(...arguments),
      (this.type = "html"),
      (this.applyWillChange = !0),
      (this.renderInstance = ag);
  }
  readValueFromInstance(t, n) {
    if (Fn.has(n)) {
      const r = od(n);
      return (r && r.default) || 0;
    } else {
      const r = l8(t),
        i = (q1(n) ? r.getPropertyValue(n) : r[n]) || 0;
      return typeof i == "string" ? i.trim() : i;
    }
  }
  measureInstanceViewportBox(t, { transformPagePoint: n }) {
    return W0(t, n);
  }
  build(t, n, r) {
    _d(t, n, r.transformTemplate);
  }
  scrapeMotionValuesFromProps(t, n, r) {
    return wd(t, n, r);
  }
  handleChildMotionValue() {
    this.childSubscription &&
      (this.childSubscription(), delete this.childSubscription);
    const { children: t } = this.props;
    Oe(t) &&
      (this.childSubscription = t.on("change", (n) => {
        this.current && (this.current.textContent = `${n}`);
      }));
  }
}
class u8 extends wg {
  constructor() {
    super(...arguments),
      (this.type = "svg"),
      (this.isSVGTag = !1),
      (this.measureInstanceViewportBox = fe);
  }
  getBaseTargetFromProps(t, n) {
    return t[n];
  }
  readValueFromInstance(t, n) {
    if (Fn.has(n)) {
      const r = od(n);
      return (r && r.default) || 0;
    }
    return (n = ug.has(n) ? n : Vl(n)), t.getAttribute(n);
  }
  scrapeMotionValuesFromProps(t, n, r) {
    return fg(t, n, r);
  }
  build(t, n, r) {
    Cd(t, n, this.isSVGTag, r.transformTemplate);
  }
  renderInstance(t, n, r, i) {
    cg(t, n, r, i);
  }
  mount(t) {
    (this.isSVGTag = Td(t.tagName)), super.mount(t);
  }
}
const c8 = (e, t) =>
    yd(e) ? new u8(t) : new a8(t, { allowProjection: e !== C.Fragment }),
  d8 = t8({ ...q5, ...x3, ...u3, ...S3 }, c8),
  cr = Ww(d8);
class f8 extends C.Component {
  getSnapshotBeforeUpdate(t) {
    const n = this.props.childRef.current;
    if (n && t.isPresent && !this.props.isPresent) {
      const r = this.props.sizeRef.current;
      (r.height = n.offsetHeight || 0),
        (r.width = n.offsetWidth || 0),
        (r.top = n.offsetTop),
        (r.left = n.offsetLeft);
    }
    return null;
  }
  componentDidUpdate() {}
  render() {
    return this.props.children;
  }
}
function p8({ children: e, isPresent: t }) {
  const n = C.useId(),
    r = C.useRef(null),
    i = C.useRef({ width: 0, height: 0, top: 0, left: 0 }),
    { nonce: s } = C.useContext(gd);
  return (
    C.useInsertionEffect(() => {
      const { width: o, height: u, top: a, left: d } = i.current;
      if (t || !r.current || !o || !u) return;
      r.current.dataset.motionPopId = n;
      const p = document.createElement("style");
      return (
        s && (p.nonce = s),
        document.head.appendChild(p),
        p.sheet &&
          p.sheet.insertRule(`
          [data-motion-pop-id="${n}"] {
            position: absolute !important;
            width: ${o}px !important;
            height: ${u}px !important;
            top: ${a}px !important;
            left: ${d}px !important;
          }
        `),
        () => {
          document.head.removeChild(p);
        }
      );
    }, [t]),
    _.jsx(f8, {
      isPresent: t,
      childRef: r,
      sizeRef: i,
      children: C.cloneElement(e, { ref: r }),
    })
  );
}
const h8 = ({
  children: e,
  initial: t,
  isPresent: n,
  onExitComplete: r,
  custom: i,
  presenceAffectsLayout: s,
  mode: o,
}) => {
  const u = xd(m8),
    a = C.useId(),
    d = C.useMemo(
      () => ({
        id: a,
        initial: t,
        isPresent: n,
        custom: i,
        onExitComplete: (p) => {
          u.set(p, !0);
          for (const l of u.values()) if (!l) return;
          r && r();
        },
        register: (p) => (u.set(p, !1), () => u.delete(p)),
      }),
      s ? [Math.random()] : [n]
    );
  return (
    C.useMemo(() => {
      u.forEach((p, l) => u.set(l, !1));
    }, [n]),
    C.useEffect(() => {
      !n && !u.size && r && r();
    }, [n]),
    o === "popLayout" && (e = _.jsx(p8, { isPresent: n, children: e })),
    _.jsx(Nl.Provider, { value: d, children: e })
  );
};
function m8() {
  return new Map();
}
const po = (e) => e.key || "";
function lh(e) {
  const t = [];
  return (
    C.Children.forEach(e, (n) => {
      C.isValidElement(n) && t.push(n);
    }),
    t
  );
}
const ks = ({
  children: e,
  exitBeforeEnter: t,
  custom: n,
  initial: r = !0,
  onExitComplete: i,
  presenceAffectsLayout: s = !0,
  mode: o = "sync",
}) => {
  const u = C.useMemo(() => lh(e), [e]),
    a = u.map(po),
    d = C.useRef(!0),
    p = C.useRef(u),
    l = xd(() => new Map()),
    [c, f] = C.useState(u),
    [m, v] = C.useState(u);
  ig(() => {
    (d.current = !1), (p.current = u);
    for (let g = 0; g < m.length; g++) {
      const y = po(m[g]);
      a.includes(y) ? l.delete(y) : l.get(y) !== !0 && l.set(y, !1);
    }
  }, [m, a.length, a.join("-")]);
  const w = [];
  if (u !== c) {
    let g = [...u];
    for (let y = 0; y < m.length; y++) {
      const x = m[y],
        S = po(x);
      a.includes(S) || (g.splice(y, 0, x), w.push(x));
    }
    o === "wait" && w.length && (g = w), v(lh(g)), f(u);
    return;
  }
  const { forceRender: h } = C.useContext(hd);
  return _.jsx(_.Fragment, {
    children: m.map((g) => {
      const y = po(g),
        x = u === m || a.includes(y),
        S = () => {
          if (l.has(y)) l.set(y, !0);
          else return;
          let T = !0;
          l.forEach((M) => {
            M || (T = !1);
          }),
            T && (h == null || h(), v(p.current), i && i());
        };
      return _.jsx(
        h8,
        {
          isPresent: x,
          initial: !d.current || r ? void 0 : !1,
          custom: x ? void 0 : n,
          presenceAffectsLayout: s,
          mode: o,
          onExitComplete: x ? void 0 : S,
          children: g,
        },
        y
      );
    }),
  });
};
function Ed({ children: e }) {
  return _.jsx(cr.div, {
    initial: { height: 0 },
    animate: { height: "auto" },
    exit: { height: 0 },
    transition: { duration: 0.5 },
    className:
      "w-full bg-[#07080D66] relative max-h-[40.5rem] overflow-y-auto rounded-[0.6875rem] mt-[0.8125rem]",
    style: { backdropFilter: "blur(32.650001525878906px)" },
    children: _.jsx(cr.div, { className: "w-full h-full p-6", children: e }),
  });
}
function g8() {
  const { rules: e } = je();
  return _.jsx(Ed, {
    children: e.map((t, n) => _.jsx(v8, { rule: { ...t, index: n } }, n)),
  });
}
function v8({ rule: e }) {
  return _.jsxs("div", {
    className:
      "bg-[#07080D33] w-full mb-3 relative p-4 !pt-14 rounded-[0.4375rem]",
    children: [
      _.jsxs("div", {
        className:
          "absolute rounded-[0.4375rem] top-0 left-0 bg-[#07080D33] text-[#74c0fc] font-roboto p-2",
        children: ["Règle #", e.index + 1],
      }),
      _.jsx("p", {
        className:
          "absolute top-0 right-0 px-4 pt-3 font-roboto text-white/40 text-sm",
        children: e.date,
      }),
      _.jsxs("div", {
        className: "",
        children: [
          _.jsx("p", {
            className: "text-[#fff] font-roboto text-[1.125rem] leading-[90%]",
            children: e.title,
          }),
          _.jsx("p", {
            className:
              "text-[#fff]/50 font-roboto text-[0.875rem] leading-[140%]",
            children: e.description,
          }),
        ],
      }),
    ],
  });
}
const ah = (e, t, n) => {
  if (n && e > 0) return `col-span-${e} row-span-1`;
  const r = [];
  return (
    e >= 2 && r.push("col-span-2 row-span-1"),
    t >= 2 && r.push("col-span-1 row-span-2"),
    r.push("col-span-1 row-span-1"),
    r[Math.floor(Math.random() * r.length)]
  );
};
function y8() {
  const { images: e } = je(),
    [t, n] = C.useState(() => {
      let i = 0;
      return e.map((s, o) => {
        const u = o === e.length - 1;
        let a = "";
        return (
          i === 0 ? (a = ah(3, u)) : (a = ah(3 - i, u)),
          (i += a.includes("col-span-2") ? 2 : 1),
          i >= 3 && (i = 0),
          { src: s, span: a }
        );
      });
    }),
    { update: r } = je();
  return _.jsx(Ed, {
    children: _.jsx("div", {
      className:
        "grid grid-cols-3 grid-rows-[repeat(3,_minmax(100px,_auto))] gap-4 p-4",
      children: t.map((i, s) =>
        _.jsx(
          "div",
          {
            className: `${i.span}`,
            children: _.jsx("img", {
              src: i.src,
              onClick: () => r("SET_IMAGEPOPUP", i.src),
              alt: `Image ${s + 1}`,
              className:
                "w-full h-full object-cover rounded-lg cursor-pointer hover:scale-105 transition-all",
            }),
          },
          s
        )
      ),
    }),
  });
}
const w8 = [
  {
    embed: "https://www.bubbleshooter.net/embed.php?id=555",
    photo: "./minigames/1.png",
  },
  {
    embed: "https://www.bubbleshooter.net/embed.php?id=1547",
    photo: "./minigames/2.png",
  },
  {
    embed: "https://www.bubbleshooter.net/embed.php?id=1652",
    photo: "./minigames/3.png",
  },
  {
    embed: "https://www.bubbleshooter.net/embed.php?id=897",
    photo: "./minigames/4.png",
  },
  {
    embed: "https://www.bubbleshooter.net/embed.php?id=836",
    photo: "./minigames/5.png",
  },
];
function x8() {
  return _.jsx("div", {
    className:
      "w-full flex flex-wrap gap-3 max-h-[40.5rem] overflow-y-auto mt-[0.8125rem]",
    children: w8.map((e, t) => _.jsx(S8, { data: e }, e.photo)),
  });
}
function S8({ data: e }) {
  const { update: t } = je();
  return _.jsxs("div", {
    style: { backdropFilter: "blur(21.111047744750977px)" },
    onClick: () => t("SET_SELECTEDGAME", e.embed),
    className:
      "flex-1 group rounded-[0.4375rem] overflow-hidden relative p-4 min-w-[10.0625rem] duration-500 h-[10.9111rem] transition-all cursor-pointer hover:bg-[#07080D99] bg-[#07080D66]",
    children: [
      _.jsxs("div", {
        children: [
          _.jsxs("p", {
            className:
              "text-white font-roboto text-base font-semibold leading-[90%]",
            children: ["Game ", 1],
          }),
          _.jsx("p", {
            className: "text-white/50 font-roboto text-xs leading-[90%]",
            children: "",
          }),
        ],
      }),
      _.jsx("div", {
        className:
          "absolute top-0 left-0 flex items-center justify-center w-full h-full",
        children: _.jsx("img", {
          className:
            "w-[4.4375rem] mt-3 h-[4.4375rem] rounded-xl group-hover:scale-110 transition-all duration-500",
          src: e.photo,
        }),
      }),
      _.jsx("img", {
        className:
          "w-[9rem] group-hover:scale-125 transition-all duration-500 h-[9rem] absolute bottom-0 right-0 -z-10 translate-x-10 translate-y-10 opacity-10",
        src: e.photo,
      }),
    ],
  });
}
function uh(e) {
  return (
    e !== null &&
    typeof e == "object" &&
    "constructor" in e &&
    e.constructor === Object
  );
}
function Pd(e, t) {
  e === void 0 && (e = {}),
    t === void 0 && (t = {}),
    Object.keys(t).forEach((n) => {
      typeof e[n] > "u"
        ? (e[n] = t[n])
        : uh(t[n]) &&
          uh(e[n]) &&
          Object.keys(t[n]).length > 0 &&
          Pd(e[n], t[n]);
    });
}
const xg = {
  body: {},
  addEventListener() {},
  removeEventListener() {},
  activeElement: { blur() {}, nodeName: "" },
  querySelector() {
    return null;
  },
  querySelectorAll() {
    return [];
  },
  getElementById() {
    return null;
  },
  createEvent() {
    return { initEvent() {} };
  },
  createElement() {
    return {
      children: [],
      childNodes: [],
      style: {},
      setAttribute() {},
      getElementsByTagName() {
        return [];
      },
    };
  },
  createElementNS() {
    return {};
  },
  importNode() {
    return null;
  },
  location: {
    hash: "",
    host: "",
    hostname: "",
    href: "",
    origin: "",
    pathname: "",
    protocol: "",
    search: "",
  },
};
function en() {
  const e = typeof document < "u" ? document : {};
  return Pd(e, xg), e;
}
const _8 = {
  document: xg,
  navigator: { userAgent: "" },
  location: {
    hash: "",
    host: "",
    hostname: "",
    href: "",
    origin: "",
    pathname: "",
    protocol: "",
    search: "",
  },
  history: { replaceState() {}, pushState() {}, go() {}, back() {} },
  CustomEvent: function () {
    return this;
  },
  addEventListener() {},
  removeEventListener() {},
  getComputedStyle() {
    return {
      getPropertyValue() {
        return "";
      },
    };
  },
  Image() {},
  Date() {},
  screen: {},
  setTimeout() {},
  clearTimeout() {},
  matchMedia() {
    return {};
  },
  requestAnimationFrame(e) {
    return typeof setTimeout > "u" ? (e(), null) : setTimeout(e, 0);
  },
  cancelAnimationFrame(e) {
    typeof setTimeout > "u" || clearTimeout(e);
  },
};
function rt() {
  const e = typeof window < "u" ? window : {};
  return Pd(e, _8), e;
}
function C8(e) {
  return (
    e === void 0 && (e = ""),
    e
      .trim()
      .split(" ")
      .filter((t) => !!t.trim())
  );
}
function T8(e) {
  const t = e;
  Object.keys(t).forEach((n) => {
    try {
      t[n] = null;
    } catch {}
    try {
      delete t[n];
    } catch {}
  });
}
function Yu(e, t) {
  return t === void 0 && (t = 0), setTimeout(e, t);
}
function ul() {
  return Date.now();
}
function E8(e) {
  const t = rt();
  let n;
  return (
    t.getComputedStyle && (n = t.getComputedStyle(e, null)),
    !n && e.currentStyle && (n = e.currentStyle),
    n || (n = e.style),
    n
  );
}
function P8(e, t) {
  t === void 0 && (t = "x");
  const n = rt();
  let r, i, s;
  const o = E8(e);
  return (
    n.WebKitCSSMatrix
      ? ((i = o.transform || o.webkitTransform),
        i.split(",").length > 6 &&
          (i = i
            .split(", ")
            .map((u) => u.replace(",", "."))
            .join(", ")),
        (s = new n.WebKitCSSMatrix(i === "none" ? "" : i)))
      : ((s =
          o.MozTransform ||
          o.OTransform ||
          o.MsTransform ||
          o.msTransform ||
          o.transform ||
          o
            .getPropertyValue("transform")
            .replace("translate(", "matrix(1, 0, 0, 1,")),
        (r = s.toString().split(","))),
    t === "x" &&
      (n.WebKitCSSMatrix
        ? (i = s.m41)
        : r.length === 16
        ? (i = parseFloat(r[12]))
        : (i = parseFloat(r[4]))),
    t === "y" &&
      (n.WebKitCSSMatrix
        ? (i = s.m42)
        : r.length === 16
        ? (i = parseFloat(r[13]))
        : (i = parseFloat(r[5]))),
    i || 0
  );
}
function ho(e) {
  return (
    typeof e == "object" &&
    e !== null &&
    e.constructor &&
    Object.prototype.toString.call(e).slice(8, -1) === "Object"
  );
}
function A8(e) {
  return typeof window < "u" && typeof window.HTMLElement < "u"
    ? e instanceof HTMLElement
    : e && (e.nodeType === 1 || e.nodeType === 11);
}
function Xe() {
  const e = Object(arguments.length <= 0 ? void 0 : arguments[0]),
    t = ["__proto__", "constructor", "prototype"];
  for (let n = 1; n < arguments.length; n += 1) {
    const r = n < 0 || arguments.length <= n ? void 0 : arguments[n];
    if (r != null && !A8(r)) {
      const i = Object.keys(Object(r)).filter((s) => t.indexOf(s) < 0);
      for (let s = 0, o = i.length; s < o; s += 1) {
        const u = i[s],
          a = Object.getOwnPropertyDescriptor(r, u);
        a !== void 0 &&
          a.enumerable &&
          (ho(e[u]) && ho(r[u])
            ? r[u].__swiper__
              ? (e[u] = r[u])
              : Xe(e[u], r[u])
            : !ho(e[u]) && ho(r[u])
            ? ((e[u] = {}), r[u].__swiper__ ? (e[u] = r[u]) : Xe(e[u], r[u]))
            : (e[u] = r[u]));
      }
    }
  }
  return e;
}
function mo(e, t, n) {
  e.style.setProperty(t, n);
}
function Sg(e) {
  let { swiper: t, targetPosition: n, side: r } = e;
  const i = rt(),
    s = -t.translate;
  let o = null,
    u;
  const a = t.params.speed;
  (t.wrapperEl.style.scrollSnapType = "none"),
    i.cancelAnimationFrame(t.cssModeFrameID);
  const d = n > s ? "next" : "prev",
    p = (c, f) => (d === "next" && c >= f) || (d === "prev" && c <= f),
    l = () => {
      (u = new Date().getTime()), o === null && (o = u);
      const c = Math.max(Math.min((u - o) / a, 1), 0),
        f = 0.5 - Math.cos(c * Math.PI) / 2;
      let m = s + f * (n - s);
      if ((p(m, n) && (m = n), t.wrapperEl.scrollTo({ [r]: m }), p(m, n))) {
        (t.wrapperEl.style.overflow = "hidden"),
          (t.wrapperEl.style.scrollSnapType = ""),
          setTimeout(() => {
            (t.wrapperEl.style.overflow = ""), t.wrapperEl.scrollTo({ [r]: m });
          }),
          i.cancelAnimationFrame(t.cssModeFrameID);
        return;
      }
      t.cssModeFrameID = i.requestAnimationFrame(l);
    };
  l();
}
function Yt(e, t) {
  t === void 0 && (t = "");
  const n = [...e.children];
  return (
    e instanceof HTMLSlotElement && n.push(...e.assignedElements()),
    t ? n.filter((r) => r.matches(t)) : n
  );
}
function k8(e, t) {
  const n = t.contains(e);
  return !n && t instanceof HTMLSlotElement
    ? [...t.assignedElements()].includes(e)
    : n;
}
function cl(e) {
  try {
    console.warn(e);
    return;
  } catch {}
}
function Xu(e, t) {
  t === void 0 && (t = []);
  const n = document.createElement(e);
  return n.classList.add(...(Array.isArray(t) ? t : C8(t))), n;
}
function M8(e, t) {
  const n = [];
  for (; e.previousElementSibling; ) {
    const r = e.previousElementSibling;
    t ? r.matches(t) && n.push(r) : n.push(r), (e = r);
  }
  return n;
}
function b8(e, t) {
  const n = [];
  for (; e.nextElementSibling; ) {
    const r = e.nextElementSibling;
    t ? r.matches(t) && n.push(r) : n.push(r), (e = r);
  }
  return n;
}
function Sn(e, t) {
  return rt().getComputedStyle(e, null).getPropertyValue(t);
}
function ch(e) {
  let t = e,
    n;
  if (t) {
    for (n = 0; (t = t.previousSibling) !== null; )
      t.nodeType === 1 && (n += 1);
    return n;
  }
}
function L8(e, t) {
  const n = [];
  let r = e.parentElement;
  for (; r; ) t ? r.matches(t) && n.push(r) : n.push(r), (r = r.parentElement);
  return n;
}
function dh(e, t, n) {
  const r = rt();
  return n
    ? e[t === "width" ? "offsetWidth" : "offsetHeight"] +
        parseFloat(
          r
            .getComputedStyle(e, null)
            .getPropertyValue(t === "width" ? "margin-right" : "margin-top")
        ) +
        parseFloat(
          r
            .getComputedStyle(e, null)
            .getPropertyValue(t === "width" ? "margin-left" : "margin-bottom")
        )
    : e.offsetWidth;
}
let La;
function O8() {
  const e = rt(),
    t = en();
  return {
    smoothScroll:
      t.documentElement &&
      t.documentElement.style &&
      "scrollBehavior" in t.documentElement.style,
    touch: !!(
      "ontouchstart" in e ||
      (e.DocumentTouch && t instanceof e.DocumentTouch)
    ),
  };
}
function _g() {
  return La || (La = O8()), La;
}
let Oa;
function D8(e) {
  let { userAgent: t } = e === void 0 ? {} : e;
  const n = _g(),
    r = rt(),
    i = r.navigator.platform,
    s = t || r.navigator.userAgent,
    o = { ios: !1, android: !1 },
    u = r.screen.width,
    a = r.screen.height,
    d = s.match(/(Android);?[\s\/]+([\d.]+)?/);
  let p = s.match(/(iPad).*OS\s([\d_]+)/);
  const l = s.match(/(iPod)(.*OS\s([\d_]+))?/),
    c = !p && s.match(/(iPhone\sOS|iOS)\s([\d_]+)/),
    f = i === "Win32";
  let m = i === "MacIntel";
  const v = [
    "1024x1366",
    "1366x1024",
    "834x1194",
    "1194x834",
    "834x1112",
    "1112x834",
    "768x1024",
    "1024x768",
    "820x1180",
    "1180x820",
    "810x1080",
    "1080x810",
  ];
  return (
    !p &&
      m &&
      n.touch &&
      v.indexOf(`${u}x${a}`) >= 0 &&
      ((p = s.match(/(Version)\/([\d.]+)/)),
      p || (p = [0, 1, "13_0_0"]),
      (m = !1)),
    d && !f && ((o.os = "android"), (o.android = !0)),
    (p || c || l) && ((o.os = "ios"), (o.ios = !0)),
    o
  );
}
function Cg(e) {
  return e === void 0 && (e = {}), Oa || (Oa = D8(e)), Oa;
}
let Da;
function R8() {
  const e = rt(),
    t = Cg();
  let n = !1;
  function r() {
    const u = e.navigator.userAgent.toLowerCase();
    return (
      u.indexOf("safari") >= 0 &&
      u.indexOf("chrome") < 0 &&
      u.indexOf("android") < 0
    );
  }
  if (r()) {
    const u = String(e.navigator.userAgent);
    if (u.includes("Version/")) {
      const [a, d] = u
        .split("Version/")[1]
        .split(" ")[0]
        .split(".")
        .map((p) => Number(p));
      n = a < 16 || (a === 16 && d < 2);
    }
  }
  const i = /(iPhone|iPod|iPad).*AppleWebKit(?!.*Safari)/i.test(
      e.navigator.userAgent
    ),
    s = r(),
    o = s || (i && t.ios);
  return {
    isSafari: n || s,
    needPerspectiveFix: n,
    need3dFix: o,
    isWebView: i,
  };
}
function V8() {
  return Da || (Da = R8()), Da;
}
function I8(e) {
  let { swiper: t, on: n, emit: r } = e;
  const i = rt();
  let s = null,
    o = null;
  const u = () => {
      !t || t.destroyed || !t.initialized || (r("beforeResize"), r("resize"));
    },
    a = () => {
      !t ||
        t.destroyed ||
        !t.initialized ||
        ((s = new ResizeObserver((l) => {
          o = i.requestAnimationFrame(() => {
            const { width: c, height: f } = t;
            let m = c,
              v = f;
            l.forEach((w) => {
              let { contentBoxSize: h, contentRect: g, target: y } = w;
              (y && y !== t.el) ||
                ((m = g ? g.width : (h[0] || h).inlineSize),
                (v = g ? g.height : (h[0] || h).blockSize));
            }),
              (m !== c || v !== f) && u();
          });
        })),
        s.observe(t.el));
    },
    d = () => {
      o && i.cancelAnimationFrame(o),
        s && s.unobserve && t.el && (s.unobserve(t.el), (s = null));
    },
    p = () => {
      !t || t.destroyed || !t.initialized || r("orientationchange");
    };
  n("init", () => {
    if (t.params.resizeObserver && typeof i.ResizeObserver < "u") {
      a();
      return;
    }
    i.addEventListener("resize", u), i.addEventListener("orientationchange", p);
  }),
    n("destroy", () => {
      d(),
        i.removeEventListener("resize", u),
        i.removeEventListener("orientationchange", p);
    });
}
function N8(e) {
  let { swiper: t, extendParams: n, on: r, emit: i } = e;
  const s = [],
    o = rt(),
    u = function (p, l) {
      l === void 0 && (l = {});
      const c = o.MutationObserver || o.WebkitMutationObserver,
        f = new c((m) => {
          if (t.__preventObserver__) return;
          if (m.length === 1) {
            i("observerUpdate", m[0]);
            return;
          }
          const v = function () {
            i("observerUpdate", m[0]);
          };
          o.requestAnimationFrame
            ? o.requestAnimationFrame(v)
            : o.setTimeout(v, 0);
        });
      f.observe(p, {
        attributes: typeof l.attributes > "u" ? !0 : l.attributes,
        childList: t.isElement || (typeof l.childList > "u" ? !0 : l).childList,
        characterData: typeof l.characterData > "u" ? !0 : l.characterData,
      }),
        s.push(f);
    },
    a = () => {
      if (t.params.observer) {
        if (t.params.observeParents) {
          const p = L8(t.hostEl);
          for (let l = 0; l < p.length; l += 1) u(p[l]);
        }
        u(t.hostEl, { childList: t.params.observeSlideChildren }),
          u(t.wrapperEl, { attributes: !1 });
      }
    },
    d = () => {
      s.forEach((p) => {
        p.disconnect();
      }),
        s.splice(0, s.length);
    };
  n({ observer: !1, observeParents: !1, observeSlideChildren: !1 }),
    r("init", a),
    r("destroy", d);
}
var j8 = {
  on(e, t, n) {
    const r = this;
    if (!r.eventsListeners || r.destroyed || typeof t != "function") return r;
    const i = n ? "unshift" : "push";
    return (
      e.split(" ").forEach((s) => {
        r.eventsListeners[s] || (r.eventsListeners[s] = []),
          r.eventsListeners[s][i](t);
      }),
      r
    );
  },
  once(e, t, n) {
    const r = this;
    if (!r.eventsListeners || r.destroyed || typeof t != "function") return r;
    function i() {
      r.off(e, i), i.__emitterProxy && delete i.__emitterProxy;
      for (var s = arguments.length, o = new Array(s), u = 0; u < s; u++)
        o[u] = arguments[u];
      t.apply(r, o);
    }
    return (i.__emitterProxy = t), r.on(e, i, n);
  },
  onAny(e, t) {
    const n = this;
    if (!n.eventsListeners || n.destroyed || typeof e != "function") return n;
    const r = t ? "unshift" : "push";
    return n.eventsAnyListeners.indexOf(e) < 0 && n.eventsAnyListeners[r](e), n;
  },
  offAny(e) {
    const t = this;
    if (!t.eventsListeners || t.destroyed || !t.eventsAnyListeners) return t;
    const n = t.eventsAnyListeners.indexOf(e);
    return n >= 0 && t.eventsAnyListeners.splice(n, 1), t;
  },
  off(e, t) {
    const n = this;
    return (
      !n.eventsListeners ||
        n.destroyed ||
        !n.eventsListeners ||
        e.split(" ").forEach((r) => {
          typeof t > "u"
            ? (n.eventsListeners[r] = [])
            : n.eventsListeners[r] &&
              n.eventsListeners[r].forEach((i, s) => {
                (i === t || (i.__emitterProxy && i.__emitterProxy === t)) &&
                  n.eventsListeners[r].splice(s, 1);
              });
        }),
      n
    );
  },
  emit() {
    const e = this;
    if (!e.eventsListeners || e.destroyed || !e.eventsListeners) return e;
    let t, n, r;
    for (var i = arguments.length, s = new Array(i), o = 0; o < i; o++)
      s[o] = arguments[o];
    return (
      typeof s[0] == "string" || Array.isArray(s[0])
        ? ((t = s[0]), (n = s.slice(1, s.length)), (r = e))
        : ((t = s[0].events), (n = s[0].data), (r = s[0].context || e)),
      n.unshift(r),
      (Array.isArray(t) ? t : t.split(" ")).forEach((a) => {
        e.eventsAnyListeners &&
          e.eventsAnyListeners.length &&
          e.eventsAnyListeners.forEach((d) => {
            d.apply(r, [a, ...n]);
          }),
          e.eventsListeners &&
            e.eventsListeners[a] &&
            e.eventsListeners[a].forEach((d) => {
              d.apply(r, n);
            });
      }),
      e
    );
  },
};
function F8() {
  const e = this;
  let t, n;
  const r = e.el;
  typeof e.params.width < "u" && e.params.width !== null
    ? (t = e.params.width)
    : (t = r.clientWidth),
    typeof e.params.height < "u" && e.params.height !== null
      ? (n = e.params.height)
      : (n = r.clientHeight),
    !((t === 0 && e.isHorizontal()) || (n === 0 && e.isVertical())) &&
      ((t =
        t -
        parseInt(Sn(r, "padding-left") || 0, 10) -
        parseInt(Sn(r, "padding-right") || 0, 10)),
      (n =
        n -
        parseInt(Sn(r, "padding-top") || 0, 10) -
        parseInt(Sn(r, "padding-bottom") || 0, 10)),
      Number.isNaN(t) && (t = 0),
      Number.isNaN(n) && (n = 0),
      Object.assign(e, {
        width: t,
        height: n,
        size: e.isHorizontal() ? t : n,
      }));
}
function z8() {
  const e = this;
  function t(P, O) {
    return parseFloat(P.getPropertyValue(e.getDirectionLabel(O)) || 0);
  }
  const n = e.params,
    { wrapperEl: r, slidesEl: i, size: s, rtlTranslate: o, wrongRTL: u } = e,
    a = e.virtual && n.virtual.enabled,
    d = a ? e.virtual.slides.length : e.slides.length,
    p = Yt(i, `.${e.params.slideClass}, swiper-slide`),
    l = a ? e.virtual.slides.length : p.length;
  let c = [];
  const f = [],
    m = [];
  let v = n.slidesOffsetBefore;
  typeof v == "function" && (v = n.slidesOffsetBefore.call(e));
  let w = n.slidesOffsetAfter;
  typeof w == "function" && (w = n.slidesOffsetAfter.call(e));
  const h = e.snapGrid.length,
    g = e.slidesGrid.length;
  let y = n.spaceBetween,
    x = -v,
    S = 0,
    T = 0;
  if (typeof s > "u") return;
  typeof y == "string" && y.indexOf("%") >= 0
    ? (y = (parseFloat(y.replace("%", "")) / 100) * s)
    : typeof y == "string" && (y = parseFloat(y)),
    (e.virtualSize = -y),
    p.forEach((P) => {
      o ? (P.style.marginLeft = "") : (P.style.marginRight = ""),
        (P.style.marginBottom = ""),
        (P.style.marginTop = "");
    }),
    n.centeredSlides &&
      n.cssMode &&
      (mo(r, "--swiper-centered-offset-before", ""),
      mo(r, "--swiper-centered-offset-after", ""));
  const M = n.grid && n.grid.rows > 1 && e.grid;
  M ? e.grid.initSlides(p) : e.grid && e.grid.unsetSlides();
  let E;
  const k =
    n.slidesPerView === "auto" &&
    n.breakpoints &&
    Object.keys(n.breakpoints).filter(
      (P) => typeof n.breakpoints[P].slidesPerView < "u"
    ).length > 0;
  for (let P = 0; P < l; P += 1) {
    E = 0;
    let O;
    if (
      (p[P] && (O = p[P]),
      M && e.grid.updateSlide(P, O, p),
      !(p[P] && Sn(O, "display") === "none"))
    ) {
      if (n.slidesPerView === "auto") {
        k && (p[P].style[e.getDirectionLabel("width")] = "");
        const V = getComputedStyle(O),
          R = O.style.transform,
          N = O.style.webkitTransform;
        if (
          (R && (O.style.transform = "none"),
          N && (O.style.webkitTransform = "none"),
          n.roundLengths)
        )
          E = e.isHorizontal() ? dh(O, "width", !0) : dh(O, "height", !0);
        else {
          const W = t(V, "width"),
            Y = t(V, "padding-left"),
            $ = t(V, "padding-right"),
            A = t(V, "margin-left"),
            L = t(V, "margin-right"),
            D = V.getPropertyValue("box-sizing");
          if (D && D === "border-box") E = W + A + L;
          else {
            const { clientWidth: z, offsetWidth: Z } = O;
            E = W + Y + $ + A + L + (Z - z);
          }
        }
        R && (O.style.transform = R),
          N && (O.style.webkitTransform = N),
          n.roundLengths && (E = Math.floor(E));
      } else
        (E = (s - (n.slidesPerView - 1) * y) / n.slidesPerView),
          n.roundLengths && (E = Math.floor(E)),
          p[P] && (p[P].style[e.getDirectionLabel("width")] = `${E}px`);
      p[P] && (p[P].swiperSlideSize = E),
        m.push(E),
        n.centeredSlides
          ? ((x = x + E / 2 + S / 2 + y),
            S === 0 && P !== 0 && (x = x - s / 2 - y),
            P === 0 && (x = x - s / 2 - y),
            Math.abs(x) < 1 / 1e3 && (x = 0),
            n.roundLengths && (x = Math.floor(x)),
            T % n.slidesPerGroup === 0 && c.push(x),
            f.push(x))
          : (n.roundLengths && (x = Math.floor(x)),
            (T - Math.min(e.params.slidesPerGroupSkip, T)) %
              e.params.slidesPerGroup ===
              0 && c.push(x),
            f.push(x),
            (x = x + E + y)),
        (e.virtualSize += E + y),
        (S = E),
        (T += 1);
    }
  }
  if (
    ((e.virtualSize = Math.max(e.virtualSize, s) + w),
    o &&
      u &&
      (n.effect === "slide" || n.effect === "coverflow") &&
      (r.style.width = `${e.virtualSize + y}px`),
    n.setWrapperSize &&
      (r.style[e.getDirectionLabel("width")] = `${e.virtualSize + y}px`),
    M && e.grid.updateWrapperSize(E, c),
    !n.centeredSlides)
  ) {
    const P = [];
    for (let O = 0; O < c.length; O += 1) {
      let V = c[O];
      n.roundLengths && (V = Math.floor(V)),
        c[O] <= e.virtualSize - s && P.push(V);
    }
    (c = P),
      Math.floor(e.virtualSize - s) - Math.floor(c[c.length - 1]) > 1 &&
        c.push(e.virtualSize - s);
  }
  if (a && n.loop) {
    const P = m[0] + y;
    if (n.slidesPerGroup > 1) {
      const O = Math.ceil(
          (e.virtual.slidesBefore + e.virtual.slidesAfter) / n.slidesPerGroup
        ),
        V = P * n.slidesPerGroup;
      for (let R = 0; R < O; R += 1) c.push(c[c.length - 1] + V);
    }
    for (let O = 0; O < e.virtual.slidesBefore + e.virtual.slidesAfter; O += 1)
      n.slidesPerGroup === 1 && c.push(c[c.length - 1] + P),
        f.push(f[f.length - 1] + P),
        (e.virtualSize += P);
  }
  if ((c.length === 0 && (c = [0]), y !== 0)) {
    const P =
      e.isHorizontal() && o ? "marginLeft" : e.getDirectionLabel("marginRight");
    p.filter((O, V) =>
      !n.cssMode || n.loop ? !0 : V !== p.length - 1
    ).forEach((O) => {
      O.style[P] = `${y}px`;
    });
  }
  if (n.centeredSlides && n.centeredSlidesBounds) {
    let P = 0;
    m.forEach((V) => {
      P += V + (y || 0);
    }),
      (P -= y);
    const O = P > s ? P - s : 0;
    c = c.map((V) => (V <= 0 ? -v : V > O ? O + w : V));
  }
  if (n.centerInsufficientSlides) {
    let P = 0;
    m.forEach((V) => {
      P += V + (y || 0);
    }),
      (P -= y);
    const O = (n.slidesOffsetBefore || 0) + (n.slidesOffsetAfter || 0);
    if (P + O < s) {
      const V = (s - P - O) / 2;
      c.forEach((R, N) => {
        c[N] = R - V;
      }),
        f.forEach((R, N) => {
          f[N] = R + V;
        });
    }
  }
  if (
    (Object.assign(e, {
      slides: p,
      snapGrid: c,
      slidesGrid: f,
      slidesSizesGrid: m,
    }),
    n.centeredSlides && n.cssMode && !n.centeredSlidesBounds)
  ) {
    mo(r, "--swiper-centered-offset-before", `${-c[0]}px`),
      mo(
        r,
        "--swiper-centered-offset-after",
        `${e.size / 2 - m[m.length - 1] / 2}px`
      );
    const P = -e.snapGrid[0],
      O = -e.slidesGrid[0];
    (e.snapGrid = e.snapGrid.map((V) => V + P)),
      (e.slidesGrid = e.slidesGrid.map((V) => V + O));
  }
  if (
    (l !== d && e.emit("slidesLengthChange"),
    c.length !== h &&
      (e.params.watchOverflow && e.checkOverflow(),
      e.emit("snapGridLengthChange")),
    f.length !== g && e.emit("slidesGridLengthChange"),
    n.watchSlidesProgress && e.updateSlidesOffset(),
    e.emit("slidesUpdated"),
    !a && !n.cssMode && (n.effect === "slide" || n.effect === "fade"))
  ) {
    const P = `${n.containerModifierClass}backface-hidden`,
      O = e.el.classList.contains(P);
    l <= n.maxBackfaceHiddenSlides
      ? O || e.el.classList.add(P)
      : O && e.el.classList.remove(P);
  }
}
function B8(e) {
  const t = this,
    n = [],
    r = t.virtual && t.params.virtual.enabled;
  let i = 0,
    s;
  typeof e == "number"
    ? t.setTransition(e)
    : e === !0 && t.setTransition(t.params.speed);
  const o = (u) => (r ? t.slides[t.getSlideIndexByData(u)] : t.slides[u]);
  if (t.params.slidesPerView !== "auto" && t.params.slidesPerView > 1)
    if (t.params.centeredSlides)
      (t.visibleSlides || []).forEach((u) => {
        n.push(u);
      });
    else
      for (s = 0; s < Math.ceil(t.params.slidesPerView); s += 1) {
        const u = t.activeIndex + s;
        if (u > t.slides.length && !r) break;
        n.push(o(u));
      }
  else n.push(o(t.activeIndex));
  for (s = 0; s < n.length; s += 1)
    if (typeof n[s] < "u") {
      const u = n[s].offsetHeight;
      i = u > i ? u : i;
    }
  (i || i === 0) && (t.wrapperEl.style.height = `${i}px`);
}
function H8() {
  const e = this,
    t = e.slides,
    n = e.isElement
      ? e.isHorizontal()
        ? e.wrapperEl.offsetLeft
        : e.wrapperEl.offsetTop
      : 0;
  for (let r = 0; r < t.length; r += 1)
    t[r].swiperSlideOffset =
      (e.isHorizontal() ? t[r].offsetLeft : t[r].offsetTop) -
      n -
      e.cssOverflowAdjustment();
}
const fh = (e, t, n) => {
  t && !e.classList.contains(n)
    ? e.classList.add(n)
    : !t && e.classList.contains(n) && e.classList.remove(n);
};
function $8(e) {
  e === void 0 && (e = (this && this.translate) || 0);
  const t = this,
    n = t.params,
    { slides: r, rtlTranslate: i, snapGrid: s } = t;
  if (r.length === 0) return;
  typeof r[0].swiperSlideOffset > "u" && t.updateSlidesOffset();
  let o = -e;
  i && (o = e), (t.visibleSlidesIndexes = []), (t.visibleSlides = []);
  let u = n.spaceBetween;
  typeof u == "string" && u.indexOf("%") >= 0
    ? (u = (parseFloat(u.replace("%", "")) / 100) * t.size)
    : typeof u == "string" && (u = parseFloat(u));
  for (let a = 0; a < r.length; a += 1) {
    const d = r[a];
    let p = d.swiperSlideOffset;
    n.cssMode && n.centeredSlides && (p -= r[0].swiperSlideOffset);
    const l =
        (o + (n.centeredSlides ? t.minTranslate() : 0) - p) /
        (d.swiperSlideSize + u),
      c =
        (o - s[0] + (n.centeredSlides ? t.minTranslate() : 0) - p) /
        (d.swiperSlideSize + u),
      f = -(o - p),
      m = f + t.slidesSizesGrid[a],
      v = f >= 0 && f <= t.size - t.slidesSizesGrid[a],
      w =
        (f >= 0 && f < t.size - 1) ||
        (m > 1 && m <= t.size) ||
        (f <= 0 && m >= t.size);
    w && (t.visibleSlides.push(d), t.visibleSlidesIndexes.push(a)),
      fh(d, w, n.slideVisibleClass),
      fh(d, v, n.slideFullyVisibleClass),
      (d.progress = i ? -l : l),
      (d.originalProgress = i ? -c : c);
  }
}
function G8(e) {
  const t = this;
  if (typeof e > "u") {
    const p = t.rtlTranslate ? -1 : 1;
    e = (t && t.translate && t.translate * p) || 0;
  }
  const n = t.params,
    r = t.maxTranslate() - t.minTranslate();
  let { progress: i, isBeginning: s, isEnd: o, progressLoop: u } = t;
  const a = s,
    d = o;
  if (r === 0) (i = 0), (s = !0), (o = !0);
  else {
    i = (e - t.minTranslate()) / r;
    const p = Math.abs(e - t.minTranslate()) < 1,
      l = Math.abs(e - t.maxTranslate()) < 1;
    (s = p || i <= 0), (o = l || i >= 1), p && (i = 0), l && (i = 1);
  }
  if (n.loop) {
    const p = t.getSlideIndexByData(0),
      l = t.getSlideIndexByData(t.slides.length - 1),
      c = t.slidesGrid[p],
      f = t.slidesGrid[l],
      m = t.slidesGrid[t.slidesGrid.length - 1],
      v = Math.abs(e);
    v >= c ? (u = (v - c) / m) : (u = (v + m - f) / m), u > 1 && (u -= 1);
  }
  Object.assign(t, { progress: i, progressLoop: u, isBeginning: s, isEnd: o }),
    (n.watchSlidesProgress || (n.centeredSlides && n.autoHeight)) &&
      t.updateSlidesProgress(e),
    s && !a && t.emit("reachBeginning toEdge"),
    o && !d && t.emit("reachEnd toEdge"),
    ((a && !s) || (d && !o)) && t.emit("fromEdge"),
    t.emit("progress", i);
}
const Ra = (e, t, n) => {
  t && !e.classList.contains(n)
    ? e.classList.add(n)
    : !t && e.classList.contains(n) && e.classList.remove(n);
};
function W8() {
  const e = this,
    { slides: t, params: n, slidesEl: r, activeIndex: i } = e,
    s = e.virtual && n.virtual.enabled,
    o = e.grid && n.grid && n.grid.rows > 1,
    u = (l) => Yt(r, `.${n.slideClass}${l}, swiper-slide${l}`)[0];
  let a, d, p;
  if (s)
    if (n.loop) {
      let l = i - e.virtual.slidesBefore;
      l < 0 && (l = e.virtual.slides.length + l),
        l >= e.virtual.slides.length && (l -= e.virtual.slides.length),
        (a = u(`[data-swiper-slide-index="${l}"]`));
    } else a = u(`[data-swiper-slide-index="${i}"]`);
  else
    o
      ? ((a = t.filter((l) => l.column === i)[0]),
        (p = t.filter((l) => l.column === i + 1)[0]),
        (d = t.filter((l) => l.column === i - 1)[0]))
      : (a = t[i]);
  a &&
    (o ||
      ((p = b8(a, `.${n.slideClass}, swiper-slide`)[0]),
      n.loop && !p && (p = t[0]),
      (d = M8(a, `.${n.slideClass}, swiper-slide`)[0]),
      n.loop && !d === 0 && (d = t[t.length - 1]))),
    t.forEach((l) => {
      Ra(l, l === a, n.slideActiveClass),
        Ra(l, l === p, n.slideNextClass),
        Ra(l, l === d, n.slidePrevClass);
    }),
    e.emitSlidesClasses();
}
const Oo = (e, t) => {
    if (!e || e.destroyed || !e.params) return;
    const n = () => (e.isElement ? "swiper-slide" : `.${e.params.slideClass}`),
      r = t.closest(n());
    if (r) {
      let i = r.querySelector(`.${e.params.lazyPreloaderClass}`);
      !i &&
        e.isElement &&
        (r.shadowRoot
          ? (i = r.shadowRoot.querySelector(`.${e.params.lazyPreloaderClass}`))
          : requestAnimationFrame(() => {
              r.shadowRoot &&
                ((i = r.shadowRoot.querySelector(
                  `.${e.params.lazyPreloaderClass}`
                )),
                i && i.remove());
            })),
        i && i.remove();
    }
  },
  Va = (e, t) => {
    if (!e.slides[t]) return;
    const n = e.slides[t].querySelector('[loading="lazy"]');
    n && n.removeAttribute("loading");
  },
  Zu = (e) => {
    if (!e || e.destroyed || !e.params) return;
    let t = e.params.lazyPreloadPrevNext;
    const n = e.slides.length;
    if (!n || !t || t < 0) return;
    t = Math.min(t, n);
    const r =
        e.params.slidesPerView === "auto"
          ? e.slidesPerViewDynamic()
          : Math.ceil(e.params.slidesPerView),
      i = e.activeIndex;
    if (e.params.grid && e.params.grid.rows > 1) {
      const o = i,
        u = [o - t];
      u.push(...Array.from({ length: t }).map((a, d) => o + r + d)),
        e.slides.forEach((a, d) => {
          u.includes(a.column) && Va(e, d);
        });
      return;
    }
    const s = i + r - 1;
    if (e.params.rewind || e.params.loop)
      for (let o = i - t; o <= s + t; o += 1) {
        const u = ((o % n) + n) % n;
        (u < i || u > s) && Va(e, u);
      }
    else
      for (let o = Math.max(i - t, 0); o <= Math.min(s + t, n - 1); o += 1)
        o !== i && (o > s || o < i) && Va(e, o);
  };
function U8(e) {
  const { slidesGrid: t, params: n } = e,
    r = e.rtlTranslate ? e.translate : -e.translate;
  let i;
  for (let s = 0; s < t.length; s += 1)
    typeof t[s + 1] < "u"
      ? r >= t[s] && r < t[s + 1] - (t[s + 1] - t[s]) / 2
        ? (i = s)
        : r >= t[s] && r < t[s + 1] && (i = s + 1)
      : r >= t[s] && (i = s);
  return n.normalizeSlideIndex && (i < 0 || typeof i > "u") && (i = 0), i;
}
function K8(e) {
  const t = this,
    n = t.rtlTranslate ? t.translate : -t.translate,
    { snapGrid: r, params: i, activeIndex: s, realIndex: o, snapIndex: u } = t;
  let a = e,
    d;
  const p = (f) => {
    let m = f - t.virtual.slidesBefore;
    return (
      m < 0 && (m = t.virtual.slides.length + m),
      m >= t.virtual.slides.length && (m -= t.virtual.slides.length),
      m
    );
  };
  if ((typeof a > "u" && (a = U8(t)), r.indexOf(n) >= 0)) d = r.indexOf(n);
  else {
    const f = Math.min(i.slidesPerGroupSkip, a);
    d = f + Math.floor((a - f) / i.slidesPerGroup);
  }
  if ((d >= r.length && (d = r.length - 1), a === s && !t.params.loop)) {
    d !== u && ((t.snapIndex = d), t.emit("snapIndexChange"));
    return;
  }
  if (a === s && t.params.loop && t.virtual && t.params.virtual.enabled) {
    t.realIndex = p(a);
    return;
  }
  const l = t.grid && i.grid && i.grid.rows > 1;
  let c;
  if (t.virtual && i.virtual.enabled && i.loop) c = p(a);
  else if (l) {
    const f = t.slides.filter((v) => v.column === a)[0];
    let m = parseInt(f.getAttribute("data-swiper-slide-index"), 10);
    Number.isNaN(m) && (m = Math.max(t.slides.indexOf(f), 0)),
      (c = Math.floor(m / i.grid.rows));
  } else if (t.slides[a]) {
    const f = t.slides[a].getAttribute("data-swiper-slide-index");
    f ? (c = parseInt(f, 10)) : (c = a);
  } else c = a;
  Object.assign(t, {
    previousSnapIndex: u,
    snapIndex: d,
    previousRealIndex: o,
    realIndex: c,
    previousIndex: s,
    activeIndex: a,
  }),
    t.initialized && Zu(t),
    t.emit("activeIndexChange"),
    t.emit("snapIndexChange"),
    (t.initialized || t.params.runCallbacksOnInit) &&
      (o !== c && t.emit("realIndexChange"), t.emit("slideChange"));
}
function Y8(e, t) {
  const n = this,
    r = n.params;
  let i = e.closest(`.${r.slideClass}, swiper-slide`);
  !i &&
    n.isElement &&
    t &&
    t.length > 1 &&
    t.includes(e) &&
    [...t.slice(t.indexOf(e) + 1, t.length)].forEach((u) => {
      !i && u.matches && u.matches(`.${r.slideClass}, swiper-slide`) && (i = u);
    });
  let s = !1,
    o;
  if (i) {
    for (let u = 0; u < n.slides.length; u += 1)
      if (n.slides[u] === i) {
        (s = !0), (o = u);
        break;
      }
  }
  if (i && s)
    (n.clickedSlide = i),
      n.virtual && n.params.virtual.enabled
        ? (n.clickedIndex = parseInt(
            i.getAttribute("data-swiper-slide-index"),
            10
          ))
        : (n.clickedIndex = o);
  else {
    (n.clickedSlide = void 0), (n.clickedIndex = void 0);
    return;
  }
  r.slideToClickedSlide &&
    n.clickedIndex !== void 0 &&
    n.clickedIndex !== n.activeIndex &&
    n.slideToClickedSlide();
}
var X8 = {
  updateSize: F8,
  updateSlides: z8,
  updateAutoHeight: B8,
  updateSlidesOffset: H8,
  updateSlidesProgress: $8,
  updateProgress: G8,
  updateSlidesClasses: W8,
  updateActiveIndex: K8,
  updateClickedSlide: Y8,
};
function Z8(e) {
  e === void 0 && (e = this.isHorizontal() ? "x" : "y");
  const t = this,
    { params: n, rtlTranslate: r, translate: i, wrapperEl: s } = t;
  if (n.virtualTranslate) return r ? -i : i;
  if (n.cssMode) return i;
  let o = P8(s, e);
  return (o += t.cssOverflowAdjustment()), r && (o = -o), o || 0;
}
function Q8(e, t) {
  const n = this,
    { rtlTranslate: r, params: i, wrapperEl: s, progress: o } = n;
  let u = 0,
    a = 0;
  const d = 0;
  n.isHorizontal() ? (u = r ? -e : e) : (a = e),
    i.roundLengths && ((u = Math.floor(u)), (a = Math.floor(a))),
    (n.previousTranslate = n.translate),
    (n.translate = n.isHorizontal() ? u : a),
    i.cssMode
      ? (s[n.isHorizontal() ? "scrollLeft" : "scrollTop"] = n.isHorizontal()
          ? -u
          : -a)
      : i.virtualTranslate ||
        (n.isHorizontal()
          ? (u -= n.cssOverflowAdjustment())
          : (a -= n.cssOverflowAdjustment()),
        (s.style.transform = `translate3d(${u}px, ${a}px, ${d}px)`));
  let p;
  const l = n.maxTranslate() - n.minTranslate();
  l === 0 ? (p = 0) : (p = (e - n.minTranslate()) / l),
    p !== o && n.updateProgress(e),
    n.emit("setTranslate", n.translate, t);
}
function q8() {
  return -this.snapGrid[0];
}
function J8() {
  return -this.snapGrid[this.snapGrid.length - 1];
}
function e6(e, t, n, r, i) {
  e === void 0 && (e = 0),
    t === void 0 && (t = this.params.speed),
    n === void 0 && (n = !0),
    r === void 0 && (r = !0);
  const s = this,
    { params: o, wrapperEl: u } = s;
  if (s.animating && o.preventInteractionOnTransition) return !1;
  const a = s.minTranslate(),
    d = s.maxTranslate();
  let p;
  if (
    (r && e > a ? (p = a) : r && e < d ? (p = d) : (p = e),
    s.updateProgress(p),
    o.cssMode)
  ) {
    const l = s.isHorizontal();
    if (t === 0) u[l ? "scrollLeft" : "scrollTop"] = -p;
    else {
      if (!s.support.smoothScroll)
        return (
          Sg({ swiper: s, targetPosition: -p, side: l ? "left" : "top" }), !0
        );
      u.scrollTo({ [l ? "left" : "top"]: -p, behavior: "smooth" });
    }
    return !0;
  }
  return (
    t === 0
      ? (s.setTransition(0),
        s.setTranslate(p),
        n && (s.emit("beforeTransitionStart", t, i), s.emit("transitionEnd")))
      : (s.setTransition(t),
        s.setTranslate(p),
        n && (s.emit("beforeTransitionStart", t, i), s.emit("transitionStart")),
        s.animating ||
          ((s.animating = !0),
          s.onTranslateToWrapperTransitionEnd ||
            (s.onTranslateToWrapperTransitionEnd = function (c) {
              !s ||
                s.destroyed ||
                (c.target === this &&
                  (s.wrapperEl.removeEventListener(
                    "transitionend",
                    s.onTranslateToWrapperTransitionEnd
                  ),
                  (s.onTranslateToWrapperTransitionEnd = null),
                  delete s.onTranslateToWrapperTransitionEnd,
                  (s.animating = !1),
                  n && s.emit("transitionEnd")));
            }),
          s.wrapperEl.addEventListener(
            "transitionend",
            s.onTranslateToWrapperTransitionEnd
          ))),
    !0
  );
}
var t6 = {
  getTranslate: Z8,
  setTranslate: Q8,
  minTranslate: q8,
  maxTranslate: J8,
  translateTo: e6,
};
function n6(e, t) {
  const n = this;
  n.params.cssMode ||
    ((n.wrapperEl.style.transitionDuration = `${e}ms`),
    (n.wrapperEl.style.transitionDelay = e === 0 ? "0ms" : "")),
    n.emit("setTransition", e, t);
}
function Tg(e) {
  let { swiper: t, runCallbacks: n, direction: r, step: i } = e;
  const { activeIndex: s, previousIndex: o } = t;
  let u = r;
  if (
    (u || (s > o ? (u = "next") : s < o ? (u = "prev") : (u = "reset")),
    t.emit(`transition${i}`),
    n && s !== o)
  ) {
    if (u === "reset") {
      t.emit(`slideResetTransition${i}`);
      return;
    }
    t.emit(`slideChangeTransition${i}`),
      u === "next"
        ? t.emit(`slideNextTransition${i}`)
        : t.emit(`slidePrevTransition${i}`);
  }
}
function r6(e, t) {
  e === void 0 && (e = !0);
  const n = this,
    { params: r } = n;
  r.cssMode ||
    (r.autoHeight && n.updateAutoHeight(),
    Tg({ swiper: n, runCallbacks: e, direction: t, step: "Start" }));
}
function i6(e, t) {
  e === void 0 && (e = !0);
  const n = this,
    { params: r } = n;
  (n.animating = !1),
    !r.cssMode &&
      (n.setTransition(0),
      Tg({ swiper: n, runCallbacks: e, direction: t, step: "End" }));
}
var s6 = { setTransition: n6, transitionStart: r6, transitionEnd: i6 };
function o6(e, t, n, r, i) {
  e === void 0 && (e = 0),
    n === void 0 && (n = !0),
    typeof e == "string" && (e = parseInt(e, 10));
  const s = this;
  let o = e;
  o < 0 && (o = 0);
  const {
    params: u,
    snapGrid: a,
    slidesGrid: d,
    previousIndex: p,
    activeIndex: l,
    rtlTranslate: c,
    wrapperEl: f,
    enabled: m,
  } = s;
  if (
    (!m && !r && !i) ||
    s.destroyed ||
    (s.animating && u.preventInteractionOnTransition)
  )
    return !1;
  typeof t > "u" && (t = s.params.speed);
  const v = Math.min(s.params.slidesPerGroupSkip, o);
  let w = v + Math.floor((o - v) / s.params.slidesPerGroup);
  w >= a.length && (w = a.length - 1);
  const h = -a[w];
  if (u.normalizeSlideIndex)
    for (let S = 0; S < d.length; S += 1) {
      const T = -Math.floor(h * 100),
        M = Math.floor(d[S] * 100),
        E = Math.floor(d[S + 1] * 100);
      typeof d[S + 1] < "u"
        ? T >= M && T < E - (E - M) / 2
          ? (o = S)
          : T >= M && T < E && (o = S + 1)
        : T >= M && (o = S);
    }
  if (
    s.initialized &&
    o !== l &&
    ((!s.allowSlideNext &&
      (c
        ? h > s.translate && h > s.minTranslate()
        : h < s.translate && h < s.minTranslate())) ||
      (!s.allowSlidePrev &&
        h > s.translate &&
        h > s.maxTranslate() &&
        (l || 0) !== o))
  )
    return !1;
  o !== (p || 0) && n && s.emit("beforeSlideChangeStart"), s.updateProgress(h);
  let g;
  o > l ? (g = "next") : o < l ? (g = "prev") : (g = "reset");
  const y = s.virtual && s.params.virtual.enabled;
  if (!(y && i) && ((c && -h === s.translate) || (!c && h === s.translate)))
    return (
      s.updateActiveIndex(o),
      u.autoHeight && s.updateAutoHeight(),
      s.updateSlidesClasses(),
      u.effect !== "slide" && s.setTranslate(h),
      g !== "reset" && (s.transitionStart(n, g), s.transitionEnd(n, g)),
      !1
    );
  if (u.cssMode) {
    const S = s.isHorizontal(),
      T = c ? h : -h;
    if (t === 0)
      y &&
        ((s.wrapperEl.style.scrollSnapType = "none"),
        (s._immediateVirtual = !0)),
        y && !s._cssModeVirtualInitialSet && s.params.initialSlide > 0
          ? ((s._cssModeVirtualInitialSet = !0),
            requestAnimationFrame(() => {
              f[S ? "scrollLeft" : "scrollTop"] = T;
            }))
          : (f[S ? "scrollLeft" : "scrollTop"] = T),
        y &&
          requestAnimationFrame(() => {
            (s.wrapperEl.style.scrollSnapType = ""), (s._immediateVirtual = !1);
          });
    else {
      if (!s.support.smoothScroll)
        return (
          Sg({ swiper: s, targetPosition: T, side: S ? "left" : "top" }), !0
        );
      f.scrollTo({ [S ? "left" : "top"]: T, behavior: "smooth" });
    }
    return !0;
  }
  return (
    s.setTransition(t),
    s.setTranslate(h),
    s.updateActiveIndex(o),
    s.updateSlidesClasses(),
    s.emit("beforeTransitionStart", t, r),
    s.transitionStart(n, g),
    t === 0
      ? s.transitionEnd(n, g)
      : s.animating ||
        ((s.animating = !0),
        s.onSlideToWrapperTransitionEnd ||
          (s.onSlideToWrapperTransitionEnd = function (T) {
            !s ||
              s.destroyed ||
              (T.target === this &&
                (s.wrapperEl.removeEventListener(
                  "transitionend",
                  s.onSlideToWrapperTransitionEnd
                ),
                (s.onSlideToWrapperTransitionEnd = null),
                delete s.onSlideToWrapperTransitionEnd,
                s.transitionEnd(n, g)));
          }),
        s.wrapperEl.addEventListener(
          "transitionend",
          s.onSlideToWrapperTransitionEnd
        )),
    !0
  );
}
function l6(e, t, n, r) {
  e === void 0 && (e = 0),
    n === void 0 && (n = !0),
    typeof e == "string" && (e = parseInt(e, 10));
  const i = this;
  if (i.destroyed) return;
  typeof t > "u" && (t = i.params.speed);
  const s = i.grid && i.params.grid && i.params.grid.rows > 1;
  let o = e;
  if (i.params.loop)
    if (i.virtual && i.params.virtual.enabled) o = o + i.virtual.slidesBefore;
    else {
      let u;
      if (s) {
        const c = o * i.params.grid.rows;
        u = i.slides.filter(
          (f) => f.getAttribute("data-swiper-slide-index") * 1 === c
        )[0].column;
      } else u = i.getSlideIndexByData(o);
      const a = s
          ? Math.ceil(i.slides.length / i.params.grid.rows)
          : i.slides.length,
        { centeredSlides: d } = i.params;
      let p = i.params.slidesPerView;
      p === "auto"
        ? (p = i.slidesPerViewDynamic())
        : ((p = Math.ceil(parseFloat(i.params.slidesPerView, 10))),
          d && p % 2 === 0 && (p = p + 1));
      let l = a - u < p;
      if (
        (d && (l = l || u < Math.ceil(p / 2)),
        r && d && i.params.slidesPerView !== "auto" && !s && (l = !1),
        l)
      ) {
        const c = d
          ? u < i.activeIndex
            ? "prev"
            : "next"
          : u - i.activeIndex - 1 < i.params.slidesPerView
          ? "next"
          : "prev";
        i.loopFix({
          direction: c,
          slideTo: !0,
          activeSlideIndex: c === "next" ? u + 1 : u - a + 1,
          slideRealIndex: c === "next" ? i.realIndex : void 0,
        });
      }
      if (s) {
        const c = o * i.params.grid.rows;
        o = i.slides.filter(
          (f) => f.getAttribute("data-swiper-slide-index") * 1 === c
        )[0].column;
      } else o = i.getSlideIndexByData(o);
    }
  return (
    requestAnimationFrame(() => {
      i.slideTo(o, t, n, r);
    }),
    i
  );
}
function a6(e, t, n) {
  t === void 0 && (t = !0);
  const r = this,
    { enabled: i, params: s, animating: o } = r;
  if (!i || r.destroyed) return r;
  typeof e > "u" && (e = r.params.speed);
  let u = s.slidesPerGroup;
  s.slidesPerView === "auto" &&
    s.slidesPerGroup === 1 &&
    s.slidesPerGroupAuto &&
    (u = Math.max(r.slidesPerViewDynamic("current", !0), 1));
  const a = r.activeIndex < s.slidesPerGroupSkip ? 1 : u,
    d = r.virtual && s.virtual.enabled;
  if (s.loop) {
    if (o && !d && s.loopPreventsSliding) return !1;
    if (
      (r.loopFix({ direction: "next" }),
      (r._clientLeft = r.wrapperEl.clientLeft),
      r.activeIndex === r.slides.length - 1 && s.cssMode)
    )
      return (
        requestAnimationFrame(() => {
          r.slideTo(r.activeIndex + a, e, t, n);
        }),
        !0
      );
  }
  return s.rewind && r.isEnd
    ? r.slideTo(0, e, t, n)
    : r.slideTo(r.activeIndex + a, e, t, n);
}
function u6(e, t, n) {
  t === void 0 && (t = !0);
  const r = this,
    {
      params: i,
      snapGrid: s,
      slidesGrid: o,
      rtlTranslate: u,
      enabled: a,
      animating: d,
    } = r;
  if (!a || r.destroyed) return r;
  typeof e > "u" && (e = r.params.speed);
  const p = r.virtual && i.virtual.enabled;
  if (i.loop) {
    if (d && !p && i.loopPreventsSliding) return !1;
    r.loopFix({ direction: "prev" }), (r._clientLeft = r.wrapperEl.clientLeft);
  }
  const l = u ? r.translate : -r.translate;
  function c(h) {
    return h < 0 ? -Math.floor(Math.abs(h)) : Math.floor(h);
  }
  const f = c(l),
    m = s.map((h) => c(h));
  let v = s[m.indexOf(f) - 1];
  if (typeof v > "u" && i.cssMode) {
    let h;
    s.forEach((g, y) => {
      f >= g && (h = y);
    }),
      typeof h < "u" && (v = s[h > 0 ? h - 1 : h]);
  }
  let w = 0;
  if (
    (typeof v < "u" &&
      ((w = o.indexOf(v)),
      w < 0 && (w = r.activeIndex - 1),
      i.slidesPerView === "auto" &&
        i.slidesPerGroup === 1 &&
        i.slidesPerGroupAuto &&
        ((w = w - r.slidesPerViewDynamic("previous", !0) + 1),
        (w = Math.max(w, 0)))),
    i.rewind && r.isBeginning)
  ) {
    const h =
      r.params.virtual && r.params.virtual.enabled && r.virtual
        ? r.virtual.slides.length - 1
        : r.slides.length - 1;
    return r.slideTo(h, e, t, n);
  } else if (i.loop && r.activeIndex === 0 && i.cssMode)
    return (
      requestAnimationFrame(() => {
        r.slideTo(w, e, t, n);
      }),
      !0
    );
  return r.slideTo(w, e, t, n);
}
function c6(e, t, n) {
  t === void 0 && (t = !0);
  const r = this;
  if (!r.destroyed)
    return (
      typeof e > "u" && (e = r.params.speed), r.slideTo(r.activeIndex, e, t, n)
    );
}
function d6(e, t, n, r) {
  t === void 0 && (t = !0), r === void 0 && (r = 0.5);
  const i = this;
  if (i.destroyed) return;
  typeof e > "u" && (e = i.params.speed);
  let s = i.activeIndex;
  const o = Math.min(i.params.slidesPerGroupSkip, s),
    u = o + Math.floor((s - o) / i.params.slidesPerGroup),
    a = i.rtlTranslate ? i.translate : -i.translate;
  if (a >= i.snapGrid[u]) {
    const d = i.snapGrid[u],
      p = i.snapGrid[u + 1];
    a - d > (p - d) * r && (s += i.params.slidesPerGroup);
  } else {
    const d = i.snapGrid[u - 1],
      p = i.snapGrid[u];
    a - d <= (p - d) * r && (s -= i.params.slidesPerGroup);
  }
  return (
    (s = Math.max(s, 0)),
    (s = Math.min(s, i.slidesGrid.length - 1)),
    i.slideTo(s, e, t, n)
  );
}
function f6() {
  const e = this;
  if (e.destroyed) return;
  const { params: t, slidesEl: n } = e,
    r = t.slidesPerView === "auto" ? e.slidesPerViewDynamic() : t.slidesPerView;
  let i = e.clickedIndex,
    s;
  const o = e.isElement ? "swiper-slide" : `.${t.slideClass}`;
  if (t.loop) {
    if (e.animating) return;
    (s = parseInt(e.clickedSlide.getAttribute("data-swiper-slide-index"), 10)),
      t.centeredSlides
        ? i < e.loopedSlides - r / 2 ||
          i > e.slides.length - e.loopedSlides + r / 2
          ? (e.loopFix(),
            (i = e.getSlideIndex(
              Yt(n, `${o}[data-swiper-slide-index="${s}"]`)[0]
            )),
            Yu(() => {
              e.slideTo(i);
            }))
          : e.slideTo(i)
        : i > e.slides.length - r
        ? (e.loopFix(),
          (i = e.getSlideIndex(
            Yt(n, `${o}[data-swiper-slide-index="${s}"]`)[0]
          )),
          Yu(() => {
            e.slideTo(i);
          }))
        : e.slideTo(i);
  } else e.slideTo(i);
}
var p6 = {
  slideTo: o6,
  slideToLoop: l6,
  slideNext: a6,
  slidePrev: u6,
  slideReset: c6,
  slideToClosest: d6,
  slideToClickedSlide: f6,
};
function h6(e) {
  const t = this,
    { params: n, slidesEl: r } = t;
  if (!n.loop || (t.virtual && t.params.virtual.enabled)) return;
  const i = () => {
      Yt(r, `.${n.slideClass}, swiper-slide`).forEach((l, c) => {
        l.setAttribute("data-swiper-slide-index", c);
      });
    },
    s = t.grid && n.grid && n.grid.rows > 1,
    o = n.slidesPerGroup * (s ? n.grid.rows : 1),
    u = t.slides.length % o !== 0,
    a = s && t.slides.length % n.grid.rows !== 0,
    d = (p) => {
      for (let l = 0; l < p; l += 1) {
        const c = t.isElement
          ? Xu("swiper-slide", [n.slideBlankClass])
          : Xu("div", [n.slideClass, n.slideBlankClass]);
        t.slidesEl.append(c);
      }
    };
  if (u) {
    if (n.loopAddBlankSlides) {
      const p = o - (t.slides.length % o);
      d(p), t.recalcSlides(), t.updateSlides();
    } else
      cl(
        "Swiper Loop Warning: The number of slides is not even to slidesPerGroup, loop mode may not function properly. You need to add more slides (or make duplicates, or empty slides)"
      );
    i();
  } else if (a) {
    if (n.loopAddBlankSlides) {
      const p = n.grid.rows - (t.slides.length % n.grid.rows);
      d(p), t.recalcSlides(), t.updateSlides();
    } else
      cl(
        "Swiper Loop Warning: The number of slides is not even to grid.rows, loop mode may not function properly. You need to add more slides (or make duplicates, or empty slides)"
      );
    i();
  } else i();
  t.loopFix({
    slideRealIndex: e,
    direction: n.centeredSlides ? void 0 : "next",
  });
}
function m6(e) {
  let {
    slideRealIndex: t,
    slideTo: n = !0,
    direction: r,
    setTranslate: i,
    activeSlideIndex: s,
    byController: o,
    byMousewheel: u,
  } = e === void 0 ? {} : e;
  const a = this;
  if (!a.params.loop) return;
  a.emit("beforeLoopFix");
  const {
      slides: d,
      allowSlidePrev: p,
      allowSlideNext: l,
      slidesEl: c,
      params: f,
    } = a,
    { centeredSlides: m } = f;
  if (
    ((a.allowSlidePrev = !0),
    (a.allowSlideNext = !0),
    a.virtual && f.virtual.enabled)
  ) {
    n &&
      (!f.centeredSlides && a.snapIndex === 0
        ? a.slideTo(a.virtual.slides.length, 0, !1, !0)
        : f.centeredSlides && a.snapIndex < f.slidesPerView
        ? a.slideTo(a.virtual.slides.length + a.snapIndex, 0, !1, !0)
        : a.snapIndex === a.snapGrid.length - 1 &&
          a.slideTo(a.virtual.slidesBefore, 0, !1, !0)),
      (a.allowSlidePrev = p),
      (a.allowSlideNext = l),
      a.emit("loopFix");
    return;
  }
  let v = f.slidesPerView;
  v === "auto"
    ? (v = a.slidesPerViewDynamic())
    : ((v = Math.ceil(parseFloat(f.slidesPerView, 10))),
      m && v % 2 === 0 && (v = v + 1));
  const w = f.slidesPerGroupAuto ? v : f.slidesPerGroup;
  let h = w;
  h % w !== 0 && (h += w - (h % w)),
    (h += f.loopAdditionalSlides),
    (a.loopedSlides = h);
  const g = a.grid && f.grid && f.grid.rows > 1;
  d.length < v + h
    ? cl(
        "Swiper Loop Warning: The number of slides is not enough for loop mode, it will be disabled and not function properly. You need to add more slides (or make duplicates) or lower the values of slidesPerView and slidesPerGroup parameters"
      )
    : g &&
      f.grid.fill === "row" &&
      cl(
        "Swiper Loop Warning: Loop mode is not compatible with grid.fill = `row`"
      );
  const y = [],
    x = [];
  let S = a.activeIndex;
  typeof s > "u"
    ? (s = a.getSlideIndex(
        d.filter((R) => R.classList.contains(f.slideActiveClass))[0]
      ))
    : (S = s);
  const T = r === "next" || !r,
    M = r === "prev" || !r;
  let E = 0,
    k = 0;
  const P = g ? Math.ceil(d.length / f.grid.rows) : d.length,
    V = (g ? d[s].column : s) + (m && typeof i > "u" ? -v / 2 + 0.5 : 0);
  if (V < h) {
    E = Math.max(h - V, w);
    for (let R = 0; R < h - V; R += 1) {
      const N = R - Math.floor(R / P) * P;
      if (g) {
        const W = P - N - 1;
        for (let Y = d.length - 1; Y >= 0; Y -= 1)
          d[Y].column === W && y.push(Y);
      } else y.push(P - N - 1);
    }
  } else if (V + v > P - h) {
    k = Math.max(V - (P - h * 2), w);
    for (let R = 0; R < k; R += 1) {
      const N = R - Math.floor(R / P) * P;
      g
        ? d.forEach((W, Y) => {
            W.column === N && x.push(Y);
          })
        : x.push(N);
    }
  }
  if (
    ((a.__preventObserver__ = !0),
    requestAnimationFrame(() => {
      a.__preventObserver__ = !1;
    }),
    M &&
      y.forEach((R) => {
        (d[R].swiperLoopMoveDOM = !0),
          c.prepend(d[R]),
          (d[R].swiperLoopMoveDOM = !1);
      }),
    T &&
      x.forEach((R) => {
        (d[R].swiperLoopMoveDOM = !0),
          c.append(d[R]),
          (d[R].swiperLoopMoveDOM = !1);
      }),
    a.recalcSlides(),
    f.slidesPerView === "auto"
      ? a.updateSlides()
      : g &&
        ((y.length > 0 && M) || (x.length > 0 && T)) &&
        a.slides.forEach((R, N) => {
          a.grid.updateSlide(N, R, a.slides);
        }),
    f.watchSlidesProgress && a.updateSlidesOffset(),
    n)
  ) {
    if (y.length > 0 && M) {
      if (typeof t > "u") {
        const R = a.slidesGrid[S],
          W = a.slidesGrid[S + E] - R;
        u
          ? a.setTranslate(a.translate - W)
          : (a.slideTo(S + Math.ceil(E), 0, !1, !0),
            i &&
              ((a.touchEventsData.startTranslate =
                a.touchEventsData.startTranslate - W),
              (a.touchEventsData.currentTranslate =
                a.touchEventsData.currentTranslate - W)));
      } else if (i) {
        const R = g ? y.length / f.grid.rows : y.length;
        a.slideTo(a.activeIndex + R, 0, !1, !0),
          (a.touchEventsData.currentTranslate = a.translate);
      }
    } else if (x.length > 0 && T)
      if (typeof t > "u") {
        const R = a.slidesGrid[S],
          W = a.slidesGrid[S - k] - R;
        u
          ? a.setTranslate(a.translate - W)
          : (a.slideTo(S - k, 0, !1, !0),
            i &&
              ((a.touchEventsData.startTranslate =
                a.touchEventsData.startTranslate - W),
              (a.touchEventsData.currentTranslate =
                a.touchEventsData.currentTranslate - W)));
      } else {
        const R = g ? x.length / f.grid.rows : x.length;
        a.slideTo(a.activeIndex - R, 0, !1, !0);
      }
  }
  if (
    ((a.allowSlidePrev = p),
    (a.allowSlideNext = l),
    a.controller && a.controller.control && !o)
  ) {
    const R = {
      slideRealIndex: t,
      direction: r,
      setTranslate: i,
      activeSlideIndex: s,
      byController: !0,
    };
    Array.isArray(a.controller.control)
      ? a.controller.control.forEach((N) => {
          !N.destroyed &&
            N.params.loop &&
            N.loopFix({
              ...R,
              slideTo: N.params.slidesPerView === f.slidesPerView ? n : !1,
            });
        })
      : a.controller.control instanceof a.constructor &&
        a.controller.control.params.loop &&
        a.controller.control.loopFix({
          ...R,
          slideTo:
            a.controller.control.params.slidesPerView === f.slidesPerView
              ? n
              : !1,
        });
  }
  a.emit("loopFix");
}
function g6() {
  const e = this,
    { params: t, slidesEl: n } = e;
  if (!t.loop || (e.virtual && e.params.virtual.enabled)) return;
  e.recalcSlides();
  const r = [];
  e.slides.forEach((i) => {
    const s =
      typeof i.swiperSlideIndex > "u"
        ? i.getAttribute("data-swiper-slide-index") * 1
        : i.swiperSlideIndex;
    r[s] = i;
  }),
    e.slides.forEach((i) => {
      i.removeAttribute("data-swiper-slide-index");
    }),
    r.forEach((i) => {
      n.append(i);
    }),
    e.recalcSlides(),
    e.slideTo(e.realIndex, 0);
}
var v6 = { loopCreate: h6, loopFix: m6, loopDestroy: g6 };
function y6(e) {
  const t = this;
  if (
    !t.params.simulateTouch ||
    (t.params.watchOverflow && t.isLocked) ||
    t.params.cssMode
  )
    return;
  const n = t.params.touchEventsTarget === "container" ? t.el : t.wrapperEl;
  t.isElement && (t.__preventObserver__ = !0),
    (n.style.cursor = "move"),
    (n.style.cursor = e ? "grabbing" : "grab"),
    t.isElement &&
      requestAnimationFrame(() => {
        t.__preventObserver__ = !1;
      });
}
function w6() {
  const e = this;
  (e.params.watchOverflow && e.isLocked) ||
    e.params.cssMode ||
    (e.isElement && (e.__preventObserver__ = !0),
    (e[
      e.params.touchEventsTarget === "container" ? "el" : "wrapperEl"
    ].style.cursor = ""),
    e.isElement &&
      requestAnimationFrame(() => {
        e.__preventObserver__ = !1;
      }));
}
var x6 = { setGrabCursor: y6, unsetGrabCursor: w6 };
function S6(e, t) {
  t === void 0 && (t = this);
  function n(r) {
    if (!r || r === en() || r === rt()) return null;
    r.assignedSlot && (r = r.assignedSlot);
    const i = r.closest(e);
    return !i && !r.getRootNode ? null : i || n(r.getRootNode().host);
  }
  return n(t);
}
function ph(e, t, n) {
  const r = rt(),
    { params: i } = e,
    s = i.edgeSwipeDetection,
    o = i.edgeSwipeThreshold;
  return s && (n <= o || n >= r.innerWidth - o)
    ? s === "prevent"
      ? (t.preventDefault(), !0)
      : !1
    : !0;
}
function _6(e) {
  const t = this,
    n = en();
  let r = e;
  r.originalEvent && (r = r.originalEvent);
  const i = t.touchEventsData;
  if (r.type === "pointerdown") {
    if (i.pointerId !== null && i.pointerId !== r.pointerId) return;
    i.pointerId = r.pointerId;
  } else
    r.type === "touchstart" &&
      r.targetTouches.length === 1 &&
      (i.touchId = r.targetTouches[0].identifier);
  if (r.type === "touchstart") {
    ph(t, r, r.targetTouches[0].pageX);
    return;
  }
  const { params: s, touches: o, enabled: u } = t;
  if (
    !u ||
    (!s.simulateTouch && r.pointerType === "mouse") ||
    (t.animating && s.preventInteractionOnTransition)
  )
    return;
  !t.animating && s.cssMode && s.loop && t.loopFix();
  let a = r.target;
  if (
    (s.touchEventsTarget === "wrapper" && !k8(a, t.wrapperEl)) ||
    ("which" in r && r.which === 3) ||
    ("button" in r && r.button > 0) ||
    (i.isTouched && i.isMoved)
  )
    return;
  const d = !!s.noSwipingClass && s.noSwipingClass !== "",
    p = r.composedPath ? r.composedPath() : r.path;
  d && r.target && r.target.shadowRoot && p && (a = p[0]);
  const l = s.noSwipingSelector ? s.noSwipingSelector : `.${s.noSwipingClass}`,
    c = !!(r.target && r.target.shadowRoot);
  if (s.noSwiping && (c ? S6(l, a) : a.closest(l))) {
    t.allowClick = !0;
    return;
  }
  if (s.swipeHandler && !a.closest(s.swipeHandler)) return;
  (o.currentX = r.pageX), (o.currentY = r.pageY);
  const f = o.currentX,
    m = o.currentY;
  if (!ph(t, r, f)) return;
  Object.assign(i, {
    isTouched: !0,
    isMoved: !1,
    allowTouchCallbacks: !0,
    isScrolling: void 0,
    startMoving: void 0,
  }),
    (o.startX = f),
    (o.startY = m),
    (i.touchStartTime = ul()),
    (t.allowClick = !0),
    t.updateSize(),
    (t.swipeDirection = void 0),
    s.threshold > 0 && (i.allowThresholdMove = !1);
  let v = !0;
  a.matches(i.focusableElements) &&
    ((v = !1), a.nodeName === "SELECT" && (i.isTouched = !1)),
    n.activeElement &&
      n.activeElement.matches(i.focusableElements) &&
      n.activeElement !== a &&
      (r.pointerType === "mouse" ||
        (r.pointerType !== "mouse" && !a.matches(i.focusableElements))) &&
      n.activeElement.blur();
  const w = v && t.allowTouchMove && s.touchStartPreventDefault;
  (s.touchStartForcePreventDefault || w) &&
    !a.isContentEditable &&
    r.preventDefault(),
    s.freeMode &&
      s.freeMode.enabled &&
      t.freeMode &&
      t.animating &&
      !s.cssMode &&
      t.freeMode.onTouchStart(),
    t.emit("touchStart", r);
}
function C6(e) {
  const t = en(),
    n = this,
    r = n.touchEventsData,
    { params: i, touches: s, rtlTranslate: o, enabled: u } = n;
  if (!u || (!i.simulateTouch && e.pointerType === "mouse")) return;
  let a = e;
  if (
    (a.originalEvent && (a = a.originalEvent),
    a.type === "pointermove" &&
      (r.touchId !== null || a.pointerId !== r.pointerId))
  )
    return;
  let d;
  if (a.type === "touchmove") {
    if (
      ((d = [...a.changedTouches].filter((T) => T.identifier === r.touchId)[0]),
      !d || d.identifier !== r.touchId)
    )
      return;
  } else d = a;
  if (!r.isTouched) {
    r.startMoving && r.isScrolling && n.emit("touchMoveOpposite", a);
    return;
  }
  const p = d.pageX,
    l = d.pageY;
  if (a.preventedByNestedSwiper) {
    (s.startX = p), (s.startY = l);
    return;
  }
  if (!n.allowTouchMove) {
    a.target.matches(r.focusableElements) || (n.allowClick = !1),
      r.isTouched &&
        (Object.assign(s, { startX: p, startY: l, currentX: p, currentY: l }),
        (r.touchStartTime = ul()));
    return;
  }
  if (i.touchReleaseOnEdges && !i.loop) {
    if (n.isVertical()) {
      if (
        (l < s.startY && n.translate <= n.maxTranslate()) ||
        (l > s.startY && n.translate >= n.minTranslate())
      ) {
        (r.isTouched = !1), (r.isMoved = !1);
        return;
      }
    } else if (
      (p < s.startX && n.translate <= n.maxTranslate()) ||
      (p > s.startX && n.translate >= n.minTranslate())
    )
      return;
  }
  if (
    (t.activeElement &&
      t.activeElement.matches(r.focusableElements) &&
      t.activeElement !== a.target &&
      a.pointerType !== "mouse" &&
      t.activeElement.blur(),
    t.activeElement &&
      a.target === t.activeElement &&
      a.target.matches(r.focusableElements))
  ) {
    (r.isMoved = !0), (n.allowClick = !1);
    return;
  }
  r.allowTouchCallbacks && n.emit("touchMove", a),
    (s.previousX = s.currentX),
    (s.previousY = s.currentY),
    (s.currentX = p),
    (s.currentY = l);
  const c = s.currentX - s.startX,
    f = s.currentY - s.startY;
  if (n.params.threshold && Math.sqrt(c ** 2 + f ** 2) < n.params.threshold)
    return;
  if (typeof r.isScrolling > "u") {
    let T;
    (n.isHorizontal() && s.currentY === s.startY) ||
    (n.isVertical() && s.currentX === s.startX)
      ? (r.isScrolling = !1)
      : c * c + f * f >= 25 &&
        ((T = (Math.atan2(Math.abs(f), Math.abs(c)) * 180) / Math.PI),
        (r.isScrolling = n.isHorizontal()
          ? T > i.touchAngle
          : 90 - T > i.touchAngle));
  }
  if (
    (r.isScrolling && n.emit("touchMoveOpposite", a),
    typeof r.startMoving > "u" &&
      (s.currentX !== s.startX || s.currentY !== s.startY) &&
      (r.startMoving = !0),
    r.isScrolling ||
      (a.type === "touchmove" && r.preventTouchMoveFromPointerMove))
  ) {
    r.isTouched = !1;
    return;
  }
  if (!r.startMoving) return;
  (n.allowClick = !1),
    !i.cssMode && a.cancelable && a.preventDefault(),
    i.touchMoveStopPropagation && !i.nested && a.stopPropagation();
  let m = n.isHorizontal() ? c : f,
    v = n.isHorizontal() ? s.currentX - s.previousX : s.currentY - s.previousY;
  i.oneWayMovement &&
    ((m = Math.abs(m) * (o ? 1 : -1)), (v = Math.abs(v) * (o ? 1 : -1))),
    (s.diff = m),
    (m *= i.touchRatio),
    o && ((m = -m), (v = -v));
  const w = n.touchesDirection;
  (n.swipeDirection = m > 0 ? "prev" : "next"),
    (n.touchesDirection = v > 0 ? "prev" : "next");
  const h = n.params.loop && !i.cssMode,
    g =
      (n.touchesDirection === "next" && n.allowSlideNext) ||
      (n.touchesDirection === "prev" && n.allowSlidePrev);
  if (!r.isMoved) {
    if (
      (h && g && n.loopFix({ direction: n.swipeDirection }),
      (r.startTranslate = n.getTranslate()),
      n.setTransition(0),
      n.animating)
    ) {
      const T = new window.CustomEvent("transitionend", {
        bubbles: !0,
        cancelable: !0,
        detail: { bySwiperTouchMove: !0 },
      });
      n.wrapperEl.dispatchEvent(T);
    }
    (r.allowMomentumBounce = !1),
      i.grabCursor &&
        (n.allowSlideNext === !0 || n.allowSlidePrev === !0) &&
        n.setGrabCursor(!0),
      n.emit("sliderFirstMove", a);
  }
  let y;
  if (
    (new Date().getTime(),
    r.isMoved &&
      r.allowThresholdMove &&
      w !== n.touchesDirection &&
      h &&
      g &&
      Math.abs(m) >= 1)
  ) {
    Object.assign(s, {
      startX: p,
      startY: l,
      currentX: p,
      currentY: l,
      startTranslate: r.currentTranslate,
    }),
      (r.loopSwapReset = !0),
      (r.startTranslate = r.currentTranslate);
    return;
  }
  n.emit("sliderMove", a),
    (r.isMoved = !0),
    (r.currentTranslate = m + r.startTranslate);
  let x = !0,
    S = i.resistanceRatio;
  if (
    (i.touchReleaseOnEdges && (S = 0),
    m > 0
      ? (h &&
          g &&
          !y &&
          r.allowThresholdMove &&
          r.currentTranslate >
            (i.centeredSlides
              ? n.minTranslate() -
                n.slidesSizesGrid[n.activeIndex + 1] -
                (i.slidesPerView !== "auto" &&
                n.slides.length - i.slidesPerView >= 2
                  ? n.slidesSizesGrid[n.activeIndex + 1] + n.params.spaceBetween
                  : 0) -
                n.params.spaceBetween
              : n.minTranslate()) &&
          n.loopFix({
            direction: "prev",
            setTranslate: !0,
            activeSlideIndex: 0,
          }),
        r.currentTranslate > n.minTranslate() &&
          ((x = !1),
          i.resistance &&
            (r.currentTranslate =
              n.minTranslate() -
              1 +
              (-n.minTranslate() + r.startTranslate + m) ** S)))
      : m < 0 &&
        (h &&
          g &&
          !y &&
          r.allowThresholdMove &&
          r.currentTranslate <
            (i.centeredSlides
              ? n.maxTranslate() +
                n.slidesSizesGrid[n.slidesSizesGrid.length - 1] +
                n.params.spaceBetween +
                (i.slidesPerView !== "auto" &&
                n.slides.length - i.slidesPerView >= 2
                  ? n.slidesSizesGrid[n.slidesSizesGrid.length - 1] +
                    n.params.spaceBetween
                  : 0)
              : n.maxTranslate()) &&
          n.loopFix({
            direction: "next",
            setTranslate: !0,
            activeSlideIndex:
              n.slides.length -
              (i.slidesPerView === "auto"
                ? n.slidesPerViewDynamic()
                : Math.ceil(parseFloat(i.slidesPerView, 10))),
          }),
        r.currentTranslate < n.maxTranslate() &&
          ((x = !1),
          i.resistance &&
            (r.currentTranslate =
              n.maxTranslate() +
              1 -
              (n.maxTranslate() - r.startTranslate - m) ** S))),
    x && (a.preventedByNestedSwiper = !0),
    !n.allowSlideNext &&
      n.swipeDirection === "next" &&
      r.currentTranslate < r.startTranslate &&
      (r.currentTranslate = r.startTranslate),
    !n.allowSlidePrev &&
      n.swipeDirection === "prev" &&
      r.currentTranslate > r.startTranslate &&
      (r.currentTranslate = r.startTranslate),
    !n.allowSlidePrev &&
      !n.allowSlideNext &&
      (r.currentTranslate = r.startTranslate),
    i.threshold > 0)
  )
    if (Math.abs(m) > i.threshold || r.allowThresholdMove) {
      if (!r.allowThresholdMove) {
        (r.allowThresholdMove = !0),
          (s.startX = s.currentX),
          (s.startY = s.currentY),
          (r.currentTranslate = r.startTranslate),
          (s.diff = n.isHorizontal()
            ? s.currentX - s.startX
            : s.currentY - s.startY);
        return;
      }
    } else {
      r.currentTranslate = r.startTranslate;
      return;
    }
  !i.followFinger ||
    i.cssMode ||
    (((i.freeMode && i.freeMode.enabled && n.freeMode) ||
      i.watchSlidesProgress) &&
      (n.updateActiveIndex(), n.updateSlidesClasses()),
    i.freeMode && i.freeMode.enabled && n.freeMode && n.freeMode.onTouchMove(),
    n.updateProgress(r.currentTranslate),
    n.setTranslate(r.currentTranslate));
}
function T6(e) {
  const t = this,
    n = t.touchEventsData;
  let r = e;
  r.originalEvent && (r = r.originalEvent);
  let i;
  if (r.type === "touchend" || r.type === "touchcancel") {
    if (
      ((i = [...r.changedTouches].filter((S) => S.identifier === n.touchId)[0]),
      !i || i.identifier !== n.touchId)
    )
      return;
  } else {
    if (n.touchId !== null || r.pointerId !== n.pointerId) return;
    i = r;
  }
  if (
    ["pointercancel", "pointerout", "pointerleave", "contextmenu"].includes(
      r.type
    ) &&
    !(
      ["pointercancel", "contextmenu"].includes(r.type) &&
      (t.browser.isSafari || t.browser.isWebView)
    )
  )
    return;
  (n.pointerId = null), (n.touchId = null);
  const {
    params: o,
    touches: u,
    rtlTranslate: a,
    slidesGrid: d,
    enabled: p,
  } = t;
  if (!p || (!o.simulateTouch && r.pointerType === "mouse")) return;
  if (
    (n.allowTouchCallbacks && t.emit("touchEnd", r),
    (n.allowTouchCallbacks = !1),
    !n.isTouched)
  ) {
    n.isMoved && o.grabCursor && t.setGrabCursor(!1),
      (n.isMoved = !1),
      (n.startMoving = !1);
    return;
  }
  o.grabCursor &&
    n.isMoved &&
    n.isTouched &&
    (t.allowSlideNext === !0 || t.allowSlidePrev === !0) &&
    t.setGrabCursor(!1);
  const l = ul(),
    c = l - n.touchStartTime;
  if (t.allowClick) {
    const S = r.path || (r.composedPath && r.composedPath());
    t.updateClickedSlide((S && S[0]) || r.target, S),
      t.emit("tap click", r),
      c < 300 &&
        l - n.lastClickTime < 300 &&
        t.emit("doubleTap doubleClick", r);
  }
  if (
    ((n.lastClickTime = ul()),
    Yu(() => {
      t.destroyed || (t.allowClick = !0);
    }),
    !n.isTouched ||
      !n.isMoved ||
      !t.swipeDirection ||
      (u.diff === 0 && !n.loopSwapReset) ||
      (n.currentTranslate === n.startTranslate && !n.loopSwapReset))
  ) {
    (n.isTouched = !1), (n.isMoved = !1), (n.startMoving = !1);
    return;
  }
  (n.isTouched = !1), (n.isMoved = !1), (n.startMoving = !1);
  let f;
  if (
    (o.followFinger
      ? (f = a ? t.translate : -t.translate)
      : (f = -n.currentTranslate),
    o.cssMode)
  )
    return;
  if (o.freeMode && o.freeMode.enabled) {
    t.freeMode.onTouchEnd({ currentPos: f });
    return;
  }
  const m = f >= -t.maxTranslate() && !t.params.loop;
  let v = 0,
    w = t.slidesSizesGrid[0];
  for (
    let S = 0;
    S < d.length;
    S += S < o.slidesPerGroupSkip ? 1 : o.slidesPerGroup
  ) {
    const T = S < o.slidesPerGroupSkip - 1 ? 1 : o.slidesPerGroup;
    typeof d[S + T] < "u"
      ? (m || (f >= d[S] && f < d[S + T])) && ((v = S), (w = d[S + T] - d[S]))
      : (m || f >= d[S]) && ((v = S), (w = d[d.length - 1] - d[d.length - 2]));
  }
  let h = null,
    g = null;
  o.rewind &&
    (t.isBeginning
      ? (g =
          o.virtual && o.virtual.enabled && t.virtual
            ? t.virtual.slides.length - 1
            : t.slides.length - 1)
      : t.isEnd && (h = 0));
  const y = (f - d[v]) / w,
    x = v < o.slidesPerGroupSkip - 1 ? 1 : o.slidesPerGroup;
  if (c > o.longSwipesMs) {
    if (!o.longSwipes) {
      t.slideTo(t.activeIndex);
      return;
    }
    t.swipeDirection === "next" &&
      (y >= o.longSwipesRatio
        ? t.slideTo(o.rewind && t.isEnd ? h : v + x)
        : t.slideTo(v)),
      t.swipeDirection === "prev" &&
        (y > 1 - o.longSwipesRatio
          ? t.slideTo(v + x)
          : g !== null && y < 0 && Math.abs(y) > o.longSwipesRatio
          ? t.slideTo(g)
          : t.slideTo(v));
  } else {
    if (!o.shortSwipes) {
      t.slideTo(t.activeIndex);
      return;
    }
    t.navigation &&
    (r.target === t.navigation.nextEl || r.target === t.navigation.prevEl)
      ? r.target === t.navigation.nextEl
        ? t.slideTo(v + x)
        : t.slideTo(v)
      : (t.swipeDirection === "next" && t.slideTo(h !== null ? h : v + x),
        t.swipeDirection === "prev" && t.slideTo(g !== null ? g : v));
  }
}
function hh() {
  const e = this,
    { params: t, el: n } = e;
  if (n && n.offsetWidth === 0) return;
  t.breakpoints && e.setBreakpoint();
  const { allowSlideNext: r, allowSlidePrev: i, snapGrid: s } = e,
    o = e.virtual && e.params.virtual.enabled;
  (e.allowSlideNext = !0),
    (e.allowSlidePrev = !0),
    e.updateSize(),
    e.updateSlides(),
    e.updateSlidesClasses();
  const u = o && t.loop;
  (t.slidesPerView === "auto" || t.slidesPerView > 1) &&
  e.isEnd &&
  !e.isBeginning &&
  !e.params.centeredSlides &&
  !u
    ? e.slideTo(e.slides.length - 1, 0, !1, !0)
    : e.params.loop && !o
    ? e.slideToLoop(e.realIndex, 0, !1, !0)
    : e.slideTo(e.activeIndex, 0, !1, !0),
    e.autoplay &&
      e.autoplay.running &&
      e.autoplay.paused &&
      (clearTimeout(e.autoplay.resizeTimeout),
      (e.autoplay.resizeTimeout = setTimeout(() => {
        e.autoplay &&
          e.autoplay.running &&
          e.autoplay.paused &&
          e.autoplay.resume();
      }, 500))),
    (e.allowSlidePrev = i),
    (e.allowSlideNext = r),
    e.params.watchOverflow && s !== e.snapGrid && e.checkOverflow();
}
function E6(e) {
  const t = this;
  t.enabled &&
    (t.allowClick ||
      (t.params.preventClicks && e.preventDefault(),
      t.params.preventClicksPropagation &&
        t.animating &&
        (e.stopPropagation(), e.stopImmediatePropagation())));
}
function P6() {
  const e = this,
    { wrapperEl: t, rtlTranslate: n, enabled: r } = e;
  if (!r) return;
  (e.previousTranslate = e.translate),
    e.isHorizontal()
      ? (e.translate = -t.scrollLeft)
      : (e.translate = -t.scrollTop),
    e.translate === 0 && (e.translate = 0),
    e.updateActiveIndex(),
    e.updateSlidesClasses();
  let i;
  const s = e.maxTranslate() - e.minTranslate();
  s === 0 ? (i = 0) : (i = (e.translate - e.minTranslate()) / s),
    i !== e.progress && e.updateProgress(n ? -e.translate : e.translate),
    e.emit("setTranslate", e.translate, !1);
}
function A6(e) {
  const t = this;
  Oo(t, e.target),
    !(
      t.params.cssMode ||
      (t.params.slidesPerView !== "auto" && !t.params.autoHeight)
    ) && t.update();
}
function k6() {
  const e = this;
  e.documentTouchHandlerProceeded ||
    ((e.documentTouchHandlerProceeded = !0),
    e.params.touchReleaseOnEdges && (e.el.style.touchAction = "auto"));
}
const Eg = (e, t) => {
  const n = en(),
    { params: r, el: i, wrapperEl: s, device: o } = e,
    u = !!r.nested,
    a = t === "on" ? "addEventListener" : "removeEventListener",
    d = t;
  !i ||
    typeof i == "string" ||
    (n[a]("touchstart", e.onDocumentTouchStart, { passive: !1, capture: u }),
    i[a]("touchstart", e.onTouchStart, { passive: !1 }),
    i[a]("pointerdown", e.onTouchStart, { passive: !1 }),
    n[a]("touchmove", e.onTouchMove, { passive: !1, capture: u }),
    n[a]("pointermove", e.onTouchMove, { passive: !1, capture: u }),
    n[a]("touchend", e.onTouchEnd, { passive: !0 }),
    n[a]("pointerup", e.onTouchEnd, { passive: !0 }),
    n[a]("pointercancel", e.onTouchEnd, { passive: !0 }),
    n[a]("touchcancel", e.onTouchEnd, { passive: !0 }),
    n[a]("pointerout", e.onTouchEnd, { passive: !0 }),
    n[a]("pointerleave", e.onTouchEnd, { passive: !0 }),
    n[a]("contextmenu", e.onTouchEnd, { passive: !0 }),
    (r.preventClicks || r.preventClicksPropagation) &&
      i[a]("click", e.onClick, !0),
    r.cssMode && s[a]("scroll", e.onScroll),
    r.updateOnWindowResize
      ? e[d](
          o.ios || o.android
            ? "resize orientationchange observerUpdate"
            : "resize observerUpdate",
          hh,
          !0
        )
      : e[d]("observerUpdate", hh, !0),
    i[a]("load", e.onLoad, { capture: !0 }));
};
function M6() {
  const e = this,
    { params: t } = e;
  (e.onTouchStart = _6.bind(e)),
    (e.onTouchMove = C6.bind(e)),
    (e.onTouchEnd = T6.bind(e)),
    (e.onDocumentTouchStart = k6.bind(e)),
    t.cssMode && (e.onScroll = P6.bind(e)),
    (e.onClick = E6.bind(e)),
    (e.onLoad = A6.bind(e)),
    Eg(e, "on");
}
function b6() {
  Eg(this, "off");
}
var L6 = { attachEvents: M6, detachEvents: b6 };
const mh = (e, t) => e.grid && t.grid && t.grid.rows > 1;
function O6() {
  const e = this,
    { realIndex: t, initialized: n, params: r, el: i } = e,
    s = r.breakpoints;
  if (!s || (s && Object.keys(s).length === 0)) return;
  const o = e.getBreakpoint(s, e.params.breakpointsBase, e.el);
  if (!o || e.currentBreakpoint === o) return;
  const a = (o in s ? s[o] : void 0) || e.originalParams,
    d = mh(e, r),
    p = mh(e, a),
    l = e.params.grabCursor,
    c = a.grabCursor,
    f = r.enabled;
  d && !p
    ? (i.classList.remove(
        `${r.containerModifierClass}grid`,
        `${r.containerModifierClass}grid-column`
      ),
      e.emitContainerClasses())
    : !d &&
      p &&
      (i.classList.add(`${r.containerModifierClass}grid`),
      ((a.grid.fill && a.grid.fill === "column") ||
        (!a.grid.fill && r.grid.fill === "column")) &&
        i.classList.add(`${r.containerModifierClass}grid-column`),
      e.emitContainerClasses()),
    l && !c ? e.unsetGrabCursor() : !l && c && e.setGrabCursor(),
    ["navigation", "pagination", "scrollbar"].forEach((y) => {
      if (typeof a[y] > "u") return;
      const x = r[y] && r[y].enabled,
        S = a[y] && a[y].enabled;
      x && !S && e[y].disable(), !x && S && e[y].enable();
    });
  const m = a.direction && a.direction !== r.direction,
    v = r.loop && (a.slidesPerView !== r.slidesPerView || m),
    w = r.loop;
  m && n && e.changeDirection(), Xe(e.params, a);
  const h = e.params.enabled,
    g = e.params.loop;
  Object.assign(e, {
    allowTouchMove: e.params.allowTouchMove,
    allowSlideNext: e.params.allowSlideNext,
    allowSlidePrev: e.params.allowSlidePrev,
  }),
    f && !h ? e.disable() : !f && h && e.enable(),
    (e.currentBreakpoint = o),
    e.emit("_beforeBreakpoint", a),
    n &&
      (v
        ? (e.loopDestroy(), e.loopCreate(t), e.updateSlides())
        : !w && g
        ? (e.loopCreate(t), e.updateSlides())
        : w && !g && e.loopDestroy()),
    e.emit("breakpoint", a);
}
function D6(e, t, n) {
  if ((t === void 0 && (t = "window"), !e || (t === "container" && !n))) return;
  let r = !1;
  const i = rt(),
    s = t === "window" ? i.innerHeight : n.clientHeight,
    o = Object.keys(e).map((u) => {
      if (typeof u == "string" && u.indexOf("@") === 0) {
        const a = parseFloat(u.substr(1));
        return { value: s * a, point: u };
      }
      return { value: u, point: u };
    });
  o.sort((u, a) => parseInt(u.value, 10) - parseInt(a.value, 10));
  for (let u = 0; u < o.length; u += 1) {
    const { point: a, value: d } = o[u];
    t === "window"
      ? i.matchMedia(`(min-width: ${d}px)`).matches && (r = a)
      : d <= n.clientWidth && (r = a);
  }
  return r || "max";
}
var R6 = { setBreakpoint: O6, getBreakpoint: D6 };
function V6(e, t) {
  const n = [];
  return (
    e.forEach((r) => {
      typeof r == "object"
        ? Object.keys(r).forEach((i) => {
            r[i] && n.push(t + i);
          })
        : typeof r == "string" && n.push(t + r);
    }),
    n
  );
}
function I6() {
  const e = this,
    { classNames: t, params: n, rtl: r, el: i, device: s } = e,
    o = V6(
      [
        "initialized",
        n.direction,
        { "free-mode": e.params.freeMode && n.freeMode.enabled },
        { autoheight: n.autoHeight },
        { rtl: r },
        { grid: n.grid && n.grid.rows > 1 },
        {
          "grid-column": n.grid && n.grid.rows > 1 && n.grid.fill === "column",
        },
        { android: s.android },
        { ios: s.ios },
        { "css-mode": n.cssMode },
        { centered: n.cssMode && n.centeredSlides },
        { "watch-progress": n.watchSlidesProgress },
      ],
      n.containerModifierClass
    );
  t.push(...o), i.classList.add(...t), e.emitContainerClasses();
}
function N6() {
  const e = this,
    { el: t, classNames: n } = e;
  !t ||
    typeof t == "string" ||
    (t.classList.remove(...n), e.emitContainerClasses());
}
var j6 = { addClasses: I6, removeClasses: N6 };
function F6() {
  const e = this,
    { isLocked: t, params: n } = e,
    { slidesOffsetBefore: r } = n;
  if (r) {
    const i = e.slides.length - 1,
      s = e.slidesGrid[i] + e.slidesSizesGrid[i] + r * 2;
    e.isLocked = e.size > s;
  } else e.isLocked = e.snapGrid.length === 1;
  n.allowSlideNext === !0 && (e.allowSlideNext = !e.isLocked),
    n.allowSlidePrev === !0 && (e.allowSlidePrev = !e.isLocked),
    t && t !== e.isLocked && (e.isEnd = !1),
    t !== e.isLocked && e.emit(e.isLocked ? "lock" : "unlock");
}
var z6 = { checkOverflow: F6 },
  Qu = {
    init: !0,
    direction: "horizontal",
    oneWayMovement: !1,
    swiperElementNodeName: "SWIPER-CONTAINER",
    touchEventsTarget: "wrapper",
    initialSlide: 0,
    speed: 300,
    cssMode: !1,
    updateOnWindowResize: !0,
    resizeObserver: !0,
    nested: !1,
    createElements: !1,
    eventsPrefix: "swiper",
    enabled: !0,
    focusableElements: "input, select, option, textarea, button, video, label",
    width: null,
    height: null,
    preventInteractionOnTransition: !1,
    userAgent: null,
    url: null,
    edgeSwipeDetection: !1,
    edgeSwipeThreshold: 20,
    autoHeight: !1,
    setWrapperSize: !1,
    virtualTranslate: !1,
    effect: "slide",
    breakpoints: void 0,
    breakpointsBase: "window",
    spaceBetween: 0,
    slidesPerView: 1,
    slidesPerGroup: 1,
    slidesPerGroupSkip: 0,
    slidesPerGroupAuto: !1,
    centeredSlides: !1,
    centeredSlidesBounds: !1,
    slidesOffsetBefore: 0,
    slidesOffsetAfter: 0,
    normalizeSlideIndex: !0,
    centerInsufficientSlides: !1,
    watchOverflow: !0,
    roundLengths: !1,
    touchRatio: 1,
    touchAngle: 45,
    simulateTouch: !0,
    shortSwipes: !0,
    longSwipes: !0,
    longSwipesRatio: 0.5,
    longSwipesMs: 300,
    followFinger: !0,
    allowTouchMove: !0,
    threshold: 5,
    touchMoveStopPropagation: !1,
    touchStartPreventDefault: !0,
    touchStartForcePreventDefault: !1,
    touchReleaseOnEdges: !1,
    uniqueNavElements: !0,
    resistance: !0,
    resistanceRatio: 0.85,
    watchSlidesProgress: !1,
    grabCursor: !1,
    preventClicks: !0,
    preventClicksPropagation: !0,
    slideToClickedSlide: !1,
    loop: !1,
    loopAddBlankSlides: !0,
    loopAdditionalSlides: 0,
    loopPreventsSliding: !0,
    rewind: !1,
    allowSlidePrev: !0,
    allowSlideNext: !0,
    swipeHandler: null,
    noSwiping: !0,
    noSwipingClass: "swiper-no-swiping",
    noSwipingSelector: null,
    passiveListeners: !0,
    maxBackfaceHiddenSlides: 10,
    containerModifierClass: "swiper-",
    slideClass: "swiper-slide",
    slideBlankClass: "swiper-slide-blank",
    slideActiveClass: "swiper-slide-active",
    slideVisibleClass: "swiper-slide-visible",
    slideFullyVisibleClass: "swiper-slide-fully-visible",
    slideNextClass: "swiper-slide-next",
    slidePrevClass: "swiper-slide-prev",
    wrapperClass: "swiper-wrapper",
    lazyPreloaderClass: "swiper-lazy-preloader",
    lazyPreloadPrevNext: 0,
    runCallbacksOnInit: !0,
    _emitClasses: !1,
  };
function B6(e, t) {
  return function (r) {
    r === void 0 && (r = {});
    const i = Object.keys(r)[0],
      s = r[i];
    if (typeof s != "object" || s === null) {
      Xe(t, r);
      return;
    }
    if (
      (e[i] === !0 && (e[i] = { enabled: !0 }),
      i === "navigation" &&
        e[i] &&
        e[i].enabled &&
        !e[i].prevEl &&
        !e[i].nextEl &&
        (e[i].auto = !0),
      ["pagination", "scrollbar"].indexOf(i) >= 0 &&
        e[i] &&
        e[i].enabled &&
        !e[i].el &&
        (e[i].auto = !0),
      !(i in e && "enabled" in s))
    ) {
      Xe(t, r);
      return;
    }
    typeof e[i] == "object" && !("enabled" in e[i]) && (e[i].enabled = !0),
      e[i] || (e[i] = { enabled: !1 }),
      Xe(t, r);
  };
}
const Ia = {
    eventsEmitter: j8,
    update: X8,
    translate: t6,
    transition: s6,
    slide: p6,
    loop: v6,
    grabCursor: x6,
    events: L6,
    breakpoints: R6,
    checkOverflow: z6,
    classes: j6,
  },
  Na = {};
let Ad = class Ht {
  constructor() {
    let t, n;
    for (var r = arguments.length, i = new Array(r), s = 0; s < r; s++)
      i[s] = arguments[s];
    i.length === 1 &&
    i[0].constructor &&
    Object.prototype.toString.call(i[0]).slice(8, -1) === "Object"
      ? (n = i[0])
      : ([t, n] = i),
      n || (n = {}),
      (n = Xe({}, n)),
      t && !n.el && (n.el = t);
    const o = en();
    if (
      n.el &&
      typeof n.el == "string" &&
      o.querySelectorAll(n.el).length > 1
    ) {
      const p = [];
      return (
        o.querySelectorAll(n.el).forEach((l) => {
          const c = Xe({}, n, { el: l });
          p.push(new Ht(c));
        }),
        p
      );
    }
    const u = this;
    (u.__swiper__ = !0),
      (u.support = _g()),
      (u.device = Cg({ userAgent: n.userAgent })),
      (u.browser = V8()),
      (u.eventsListeners = {}),
      (u.eventsAnyListeners = []),
      (u.modules = [...u.__modules__]),
      n.modules && Array.isArray(n.modules) && u.modules.push(...n.modules);
    const a = {};
    u.modules.forEach((p) => {
      p({
        params: n,
        swiper: u,
        extendParams: B6(n, a),
        on: u.on.bind(u),
        once: u.once.bind(u),
        off: u.off.bind(u),
        emit: u.emit.bind(u),
      });
    });
    const d = Xe({}, Qu, a);
    return (
      (u.params = Xe({}, d, Na, n)),
      (u.originalParams = Xe({}, u.params)),
      (u.passedParams = Xe({}, n)),
      u.params &&
        u.params.on &&
        Object.keys(u.params.on).forEach((p) => {
          u.on(p, u.params.on[p]);
        }),
      u.params && u.params.onAny && u.onAny(u.params.onAny),
      Object.assign(u, {
        enabled: u.params.enabled,
        el: t,
        classNames: [],
        slides: [],
        slidesGrid: [],
        snapGrid: [],
        slidesSizesGrid: [],
        isHorizontal() {
          return u.params.direction === "horizontal";
        },
        isVertical() {
          return u.params.direction === "vertical";
        },
        activeIndex: 0,
        realIndex: 0,
        isBeginning: !0,
        isEnd: !1,
        translate: 0,
        previousTranslate: 0,
        progress: 0,
        velocity: 0,
        animating: !1,
        cssOverflowAdjustment() {
          return Math.trunc(this.translate / 2 ** 23) * 2 ** 23;
        },
        allowSlideNext: u.params.allowSlideNext,
        allowSlidePrev: u.params.allowSlidePrev,
        touchEventsData: {
          isTouched: void 0,
          isMoved: void 0,
          allowTouchCallbacks: void 0,
          touchStartTime: void 0,
          isScrolling: void 0,
          currentTranslate: void 0,
          startTranslate: void 0,
          allowThresholdMove: void 0,
          focusableElements: u.params.focusableElements,
          lastClickTime: 0,
          clickTimeout: void 0,
          velocities: [],
          allowMomentumBounce: void 0,
          startMoving: void 0,
          pointerId: null,
          touchId: null,
        },
        allowClick: !0,
        allowTouchMove: u.params.allowTouchMove,
        touches: { startX: 0, startY: 0, currentX: 0, currentY: 0, diff: 0 },
        imagesToLoad: [],
        imagesLoaded: 0,
      }),
      u.emit("_swiper"),
      u.params.init && u.init(),
      u
    );
  }
  getDirectionLabel(t) {
    return this.isHorizontal()
      ? t
      : {
          width: "height",
          "margin-top": "margin-left",
          "margin-bottom ": "margin-right",
          "margin-left": "margin-top",
          "margin-right": "margin-bottom",
          "padding-left": "padding-top",
          "padding-right": "padding-bottom",
          marginRight: "marginBottom",
        }[t];
  }
  getSlideIndex(t) {
    const { slidesEl: n, params: r } = this,
      i = Yt(n, `.${r.slideClass}, swiper-slide`),
      s = ch(i[0]);
    return ch(t) - s;
  }
  getSlideIndexByData(t) {
    return this.getSlideIndex(
      this.slides.filter(
        (n) => n.getAttribute("data-swiper-slide-index") * 1 === t
      )[0]
    );
  }
  recalcSlides() {
    const t = this,
      { slidesEl: n, params: r } = t;
    t.slides = Yt(n, `.${r.slideClass}, swiper-slide`);
  }
  enable() {
    const t = this;
    t.enabled ||
      ((t.enabled = !0),
      t.params.grabCursor && t.setGrabCursor(),
      t.emit("enable"));
  }
  disable() {
    const t = this;
    t.enabled &&
      ((t.enabled = !1),
      t.params.grabCursor && t.unsetGrabCursor(),
      t.emit("disable"));
  }
  setProgress(t, n) {
    const r = this;
    t = Math.min(Math.max(t, 0), 1);
    const i = r.minTranslate(),
      o = (r.maxTranslate() - i) * t + i;
    r.translateTo(o, typeof n > "u" ? 0 : n),
      r.updateActiveIndex(),
      r.updateSlidesClasses();
  }
  emitContainerClasses() {
    const t = this;
    if (!t.params._emitClasses || !t.el) return;
    const n = t.el.className
      .split(" ")
      .filter(
        (r) =>
          r.indexOf("swiper") === 0 ||
          r.indexOf(t.params.containerModifierClass) === 0
      );
    t.emit("_containerClasses", n.join(" "));
  }
  getSlideClasses(t) {
    const n = this;
    return n.destroyed
      ? ""
      : t.className
          .split(" ")
          .filter(
            (r) =>
              r.indexOf("swiper-slide") === 0 ||
              r.indexOf(n.params.slideClass) === 0
          )
          .join(" ");
  }
  emitSlidesClasses() {
    const t = this;
    if (!t.params._emitClasses || !t.el) return;
    const n = [];
    t.slides.forEach((r) => {
      const i = t.getSlideClasses(r);
      n.push({ slideEl: r, classNames: i }), t.emit("_slideClass", r, i);
    }),
      t.emit("_slideClasses", n);
  }
  slidesPerViewDynamic(t, n) {
    t === void 0 && (t = "current"), n === void 0 && (n = !1);
    const r = this,
      {
        params: i,
        slides: s,
        slidesGrid: o,
        slidesSizesGrid: u,
        size: a,
        activeIndex: d,
      } = r;
    let p = 1;
    if (typeof i.slidesPerView == "number") return i.slidesPerView;
    if (i.centeredSlides) {
      let l = s[d] ? Math.ceil(s[d].swiperSlideSize) : 0,
        c;
      for (let f = d + 1; f < s.length; f += 1)
        s[f] &&
          !c &&
          ((l += Math.ceil(s[f].swiperSlideSize)), (p += 1), l > a && (c = !0));
      for (let f = d - 1; f >= 0; f -= 1)
        s[f] &&
          !c &&
          ((l += s[f].swiperSlideSize), (p += 1), l > a && (c = !0));
    } else if (t === "current")
      for (let l = d + 1; l < s.length; l += 1)
        (n ? o[l] + u[l] - o[d] < a : o[l] - o[d] < a) && (p += 1);
    else for (let l = d - 1; l >= 0; l -= 1) o[d] - o[l] < a && (p += 1);
    return p;
  }
  update() {
    const t = this;
    if (!t || t.destroyed) return;
    const { snapGrid: n, params: r } = t;
    r.breakpoints && t.setBreakpoint(),
      [...t.el.querySelectorAll('[loading="lazy"]')].forEach((o) => {
        o.complete && Oo(t, o);
      }),
      t.updateSize(),
      t.updateSlides(),
      t.updateProgress(),
      t.updateSlidesClasses();
    function i() {
      const o = t.rtlTranslate ? t.translate * -1 : t.translate,
        u = Math.min(Math.max(o, t.maxTranslate()), t.minTranslate());
      t.setTranslate(u), t.updateActiveIndex(), t.updateSlidesClasses();
    }
    let s;
    if (r.freeMode && r.freeMode.enabled && !r.cssMode)
      i(), r.autoHeight && t.updateAutoHeight();
    else {
      if (
        (r.slidesPerView === "auto" || r.slidesPerView > 1) &&
        t.isEnd &&
        !r.centeredSlides
      ) {
        const o = t.virtual && r.virtual.enabled ? t.virtual.slides : t.slides;
        s = t.slideTo(o.length - 1, 0, !1, !0);
      } else s = t.slideTo(t.activeIndex, 0, !1, !0);
      s || i();
    }
    r.watchOverflow && n !== t.snapGrid && t.checkOverflow(), t.emit("update");
  }
  changeDirection(t, n) {
    n === void 0 && (n = !0);
    const r = this,
      i = r.params.direction;
    return (
      t || (t = i === "horizontal" ? "vertical" : "horizontal"),
      t === i ||
        (t !== "horizontal" && t !== "vertical") ||
        (r.el.classList.remove(`${r.params.containerModifierClass}${i}`),
        r.el.classList.add(`${r.params.containerModifierClass}${t}`),
        r.emitContainerClasses(),
        (r.params.direction = t),
        r.slides.forEach((s) => {
          t === "vertical" ? (s.style.width = "") : (s.style.height = "");
        }),
        r.emit("changeDirection"),
        n && r.update()),
      r
    );
  }
  changeLanguageDirection(t) {
    const n = this;
    (n.rtl && t === "rtl") ||
      (!n.rtl && t === "ltr") ||
      ((n.rtl = t === "rtl"),
      (n.rtlTranslate = n.params.direction === "horizontal" && n.rtl),
      n.rtl
        ? (n.el.classList.add(`${n.params.containerModifierClass}rtl`),
          (n.el.dir = "rtl"))
        : (n.el.classList.remove(`${n.params.containerModifierClass}rtl`),
          (n.el.dir = "ltr")),
      n.update());
  }
  mount(t) {
    const n = this;
    if (n.mounted) return !0;
    let r = t || n.params.el;
    if ((typeof r == "string" && (r = document.querySelector(r)), !r))
      return !1;
    (r.swiper = n),
      r.parentNode &&
        r.parentNode.host &&
        r.parentNode.host.nodeName ===
          n.params.swiperElementNodeName.toUpperCase() &&
        (n.isElement = !0);
    const i = () =>
      `.${(n.params.wrapperClass || "").trim().split(" ").join(".")}`;
    let o = (() =>
      r && r.shadowRoot && r.shadowRoot.querySelector
        ? r.shadowRoot.querySelector(i())
        : Yt(r, i())[0])();
    return (
      !o &&
        n.params.createElements &&
        ((o = Xu("div", n.params.wrapperClass)),
        r.append(o),
        Yt(r, `.${n.params.slideClass}`).forEach((u) => {
          o.append(u);
        })),
      Object.assign(n, {
        el: r,
        wrapperEl: o,
        slidesEl:
          n.isElement && !r.parentNode.host.slideSlots ? r.parentNode.host : o,
        hostEl: n.isElement ? r.parentNode.host : r,
        mounted: !0,
        rtl: r.dir.toLowerCase() === "rtl" || Sn(r, "direction") === "rtl",
        rtlTranslate:
          n.params.direction === "horizontal" &&
          (r.dir.toLowerCase() === "rtl" || Sn(r, "direction") === "rtl"),
        wrongRTL: Sn(o, "display") === "-webkit-box",
      }),
      !0
    );
  }
  init(t) {
    const n = this;
    if (n.initialized || n.mount(t) === !1) return n;
    n.emit("beforeInit"),
      n.params.breakpoints && n.setBreakpoint(),
      n.addClasses(),
      n.updateSize(),
      n.updateSlides(),
      n.params.watchOverflow && n.checkOverflow(),
      n.params.grabCursor && n.enabled && n.setGrabCursor(),
      n.params.loop && n.virtual && n.params.virtual.enabled
        ? n.slideTo(
            n.params.initialSlide + n.virtual.slidesBefore,
            0,
            n.params.runCallbacksOnInit,
            !1,
            !0
          )
        : n.slideTo(
            n.params.initialSlide,
            0,
            n.params.runCallbacksOnInit,
            !1,
            !0
          ),
      n.params.loop && n.loopCreate(),
      n.attachEvents();
    const i = [...n.el.querySelectorAll('[loading="lazy"]')];
    return (
      n.isElement && i.push(...n.hostEl.querySelectorAll('[loading="lazy"]')),
      i.forEach((s) => {
        s.complete
          ? Oo(n, s)
          : s.addEventListener("load", (o) => {
              Oo(n, o.target);
            });
      }),
      Zu(n),
      (n.initialized = !0),
      Zu(n),
      n.emit("init"),
      n.emit("afterInit"),
      n
    );
  }
  destroy(t, n) {
    t === void 0 && (t = !0), n === void 0 && (n = !0);
    const r = this,
      { params: i, el: s, wrapperEl: o, slides: u } = r;
    return (
      typeof r.params > "u" ||
        r.destroyed ||
        (r.emit("beforeDestroy"),
        (r.initialized = !1),
        r.detachEvents(),
        i.loop && r.loopDestroy(),
        n &&
          (r.removeClasses(),
          s && typeof s != "string" && s.removeAttribute("style"),
          o && o.removeAttribute("style"),
          u &&
            u.length &&
            u.forEach((a) => {
              a.classList.remove(
                i.slideVisibleClass,
                i.slideFullyVisibleClass,
                i.slideActiveClass,
                i.slideNextClass,
                i.slidePrevClass
              ),
                a.removeAttribute("style"),
                a.removeAttribute("data-swiper-slide-index");
            })),
        r.emit("destroy"),
        Object.keys(r.eventsListeners).forEach((a) => {
          r.off(a);
        }),
        t !== !1 &&
          (r.el && typeof r.el != "string" && (r.el.swiper = null), T8(r)),
        (r.destroyed = !0)),
      null
    );
  }
  static extendDefaults(t) {
    Xe(Na, t);
  }
  static get extendedDefaults() {
    return Na;
  }
  static get defaults() {
    return Qu;
  }
  static installModule(t) {
    Ht.prototype.__modules__ || (Ht.prototype.__modules__ = []);
    const n = Ht.prototype.__modules__;
    typeof t == "function" && n.indexOf(t) < 0 && n.push(t);
  }
  static use(t) {
    return Array.isArray(t)
      ? (t.forEach((n) => Ht.installModule(n)), Ht)
      : (Ht.installModule(t), Ht);
  }
};
Object.keys(Ia).forEach((e) => {
  Object.keys(Ia[e]).forEach((t) => {
    Ad.prototype[t] = Ia[e][t];
  });
});
Ad.use([I8, N8]);
const Pg = [
  "eventsPrefix",
  "injectStyles",
  "injectStylesUrls",
  "modules",
  "init",
  "_direction",
  "oneWayMovement",
  "swiperElementNodeName",
  "touchEventsTarget",
  "initialSlide",
  "_speed",
  "cssMode",
  "updateOnWindowResize",
  "resizeObserver",
  "nested",
  "focusableElements",
  "_enabled",
  "_width",
  "_height",
  "preventInteractionOnTransition",
  "userAgent",
  "url",
  "_edgeSwipeDetection",
  "_edgeSwipeThreshold",
  "_freeMode",
  "_autoHeight",
  "setWrapperSize",
  "virtualTranslate",
  "_effect",
  "breakpoints",
  "breakpointsBase",
  "_spaceBetween",
  "_slidesPerView",
  "maxBackfaceHiddenSlides",
  "_grid",
  "_slidesPerGroup",
  "_slidesPerGroupSkip",
  "_slidesPerGroupAuto",
  "_centeredSlides",
  "_centeredSlidesBounds",
  "_slidesOffsetBefore",
  "_slidesOffsetAfter",
  "normalizeSlideIndex",
  "_centerInsufficientSlides",
  "_watchOverflow",
  "roundLengths",
  "touchRatio",
  "touchAngle",
  "simulateTouch",
  "_shortSwipes",
  "_longSwipes",
  "longSwipesRatio",
  "longSwipesMs",
  "_followFinger",
  "allowTouchMove",
  "_threshold",
  "touchMoveStopPropagation",
  "touchStartPreventDefault",
  "touchStartForcePreventDefault",
  "touchReleaseOnEdges",
  "uniqueNavElements",
  "_resistance",
  "_resistanceRatio",
  "_watchSlidesProgress",
  "_grabCursor",
  "preventClicks",
  "preventClicksPropagation",
  "_slideToClickedSlide",
  "_loop",
  "loopAdditionalSlides",
  "loopAddBlankSlides",
  "loopPreventsSliding",
  "_rewind",
  "_allowSlidePrev",
  "_allowSlideNext",
  "_swipeHandler",
  "_noSwiping",
  "noSwipingClass",
  "noSwipingSelector",
  "passiveListeners",
  "containerModifierClass",
  "slideClass",
  "slideActiveClass",
  "slideVisibleClass",
  "slideFullyVisibleClass",
  "slideNextClass",
  "slidePrevClass",
  "slideBlankClass",
  "wrapperClass",
  "lazyPreloaderClass",
  "lazyPreloadPrevNext",
  "runCallbacksOnInit",
  "observer",
  "observeParents",
  "observeSlideChildren",
  "a11y",
  "_autoplay",
  "_controller",
  "coverflowEffect",
  "cubeEffect",
  "fadeEffect",
  "flipEffect",
  "creativeEffect",
  "cardsEffect",
  "hashNavigation",
  "history",
  "keyboard",
  "mousewheel",
  "_navigation",
  "_pagination",
  "parallax",
  "_scrollbar",
  "_thumbs",
  "virtual",
  "zoom",
  "control",
];
function dr(e) {
  return (
    typeof e == "object" &&
    e !== null &&
    e.constructor &&
    Object.prototype.toString.call(e).slice(8, -1) === "Object" &&
    !e.__swiper__
  );
}
function Xr(e, t) {
  const n = ["__proto__", "constructor", "prototype"];
  Object.keys(t)
    .filter((r) => n.indexOf(r) < 0)
    .forEach((r) => {
      typeof e[r] > "u"
        ? (e[r] = t[r])
        : dr(t[r]) && dr(e[r]) && Object.keys(t[r]).length > 0
        ? t[r].__swiper__
          ? (e[r] = t[r])
          : Xr(e[r], t[r])
        : (e[r] = t[r]);
    });
}
function Ag(e) {
  return (
    e === void 0 && (e = {}),
    e.navigation &&
      typeof e.navigation.nextEl > "u" &&
      typeof e.navigation.prevEl > "u"
  );
}
function kg(e) {
  return e === void 0 && (e = {}), e.pagination && typeof e.pagination.el > "u";
}
function Mg(e) {
  return e === void 0 && (e = {}), e.scrollbar && typeof e.scrollbar.el > "u";
}
function bg(e) {
  e === void 0 && (e = "");
  const t = e
      .split(" ")
      .map((r) => r.trim())
      .filter((r) => !!r),
    n = [];
  return (
    t.forEach((r) => {
      n.indexOf(r) < 0 && n.push(r);
    }),
    n.join(" ")
  );
}
function H6(e) {
  return (
    e === void 0 && (e = ""),
    e
      ? e.includes("swiper-wrapper")
        ? e
        : `swiper-wrapper ${e}`
      : "swiper-wrapper"
  );
}
function $6(e) {
  let {
    swiper: t,
    slides: n,
    passedParams: r,
    changedParams: i,
    nextEl: s,
    prevEl: o,
    scrollbarEl: u,
    paginationEl: a,
  } = e;
  const d = i.filter(
      (k) => k !== "children" && k !== "direction" && k !== "wrapperClass"
    ),
    {
      params: p,
      pagination: l,
      navigation: c,
      scrollbar: f,
      virtual: m,
      thumbs: v,
    } = t;
  let w, h, g, y, x, S, T, M;
  i.includes("thumbs") &&
    r.thumbs &&
    r.thumbs.swiper &&
    p.thumbs &&
    !p.thumbs.swiper &&
    (w = !0),
    i.includes("controller") &&
      r.controller &&
      r.controller.control &&
      p.controller &&
      !p.controller.control &&
      (h = !0),
    i.includes("pagination") &&
      r.pagination &&
      (r.pagination.el || a) &&
      (p.pagination || p.pagination === !1) &&
      l &&
      !l.el &&
      (g = !0),
    i.includes("scrollbar") &&
      r.scrollbar &&
      (r.scrollbar.el || u) &&
      (p.scrollbar || p.scrollbar === !1) &&
      f &&
      !f.el &&
      (y = !0),
    i.includes("navigation") &&
      r.navigation &&
      (r.navigation.prevEl || o) &&
      (r.navigation.nextEl || s) &&
      (p.navigation || p.navigation === !1) &&
      c &&
      !c.prevEl &&
      !c.nextEl &&
      (x = !0);
  const E = (k) => {
    t[k] &&
      (t[k].destroy(),
      k === "navigation"
        ? (t.isElement && (t[k].prevEl.remove(), t[k].nextEl.remove()),
          (p[k].prevEl = void 0),
          (p[k].nextEl = void 0),
          (t[k].prevEl = void 0),
          (t[k].nextEl = void 0))
        : (t.isElement && t[k].el.remove(),
          (p[k].el = void 0),
          (t[k].el = void 0)));
  };
  i.includes("loop") &&
    t.isElement &&
    (p.loop && !r.loop ? (S = !0) : !p.loop && r.loop ? (T = !0) : (M = !0)),
    d.forEach((k) => {
      if (dr(p[k]) && dr(r[k]))
        Object.assign(p[k], r[k]),
          (k === "navigation" || k === "pagination" || k === "scrollbar") &&
            "enabled" in r[k] &&
            !r[k].enabled &&
            E(k);
      else {
        const P = r[k];
        (P === !0 || P === !1) &&
        (k === "navigation" || k === "pagination" || k === "scrollbar")
          ? P === !1 && E(k)
          : (p[k] = r[k]);
      }
    }),
    d.includes("controller") &&
      !h &&
      t.controller &&
      t.controller.control &&
      p.controller &&
      p.controller.control &&
      (t.controller.control = p.controller.control),
    i.includes("children") && n && m && p.virtual.enabled
      ? ((m.slides = n), m.update(!0))
      : i.includes("virtual") &&
        m &&
        p.virtual.enabled &&
        (n && (m.slides = n), m.update(!0)),
    i.includes("children") && n && p.loop && (M = !0),
    w && v.init() && v.update(!0),
    h && (t.controller.control = p.controller.control),
    g &&
      (t.isElement &&
        (!a || typeof a == "string") &&
        ((a = document.createElement("div")),
        a.classList.add("swiper-pagination"),
        a.part.add("pagination"),
        t.el.appendChild(a)),
      a && (p.pagination.el = a),
      l.init(),
      l.render(),
      l.update()),
    y &&
      (t.isElement &&
        (!u || typeof u == "string") &&
        ((u = document.createElement("div")),
        u.classList.add("swiper-scrollbar"),
        u.part.add("scrollbar"),
        t.el.appendChild(u)),
      u && (p.scrollbar.el = u),
      f.init(),
      f.updateSize(),
      f.setTranslate()),
    x &&
      (t.isElement &&
        ((!s || typeof s == "string") &&
          ((s = document.createElement("div")),
          s.classList.add("swiper-button-next"),
          (s.innerHTML = t.hostEl.constructor.nextButtonSvg),
          s.part.add("button-next"),
          t.el.appendChild(s)),
        (!o || typeof o == "string") &&
          ((o = document.createElement("div")),
          o.classList.add("swiper-button-prev"),
          (o.innerHTML = t.hostEl.constructor.prevButtonSvg),
          o.part.add("button-prev"),
          t.el.appendChild(o))),
      s && (p.navigation.nextEl = s),
      o && (p.navigation.prevEl = o),
      c.init(),
      c.update()),
    i.includes("allowSlideNext") && (t.allowSlideNext = r.allowSlideNext),
    i.includes("allowSlidePrev") && (t.allowSlidePrev = r.allowSlidePrev),
    i.includes("direction") && t.changeDirection(r.direction, !1),
    (S || M) && t.loopDestroy(),
    (T || M) && t.loopCreate(),
    t.update();
}
function G6(e, t) {
  e === void 0 && (e = {}), t === void 0 && (t = !0);
  const n = { on: {} },
    r = {},
    i = {};
  Xr(n, Qu), (n._emitClasses = !0), (n.init = !1);
  const s = {},
    o = Pg.map((a) => a.replace(/_/, "")),
    u = Object.assign({}, e);
  return (
    Object.keys(u).forEach((a) => {
      typeof e[a] > "u" ||
        (o.indexOf(a) >= 0
          ? dr(e[a])
            ? ((n[a] = {}), (i[a] = {}), Xr(n[a], e[a]), Xr(i[a], e[a]))
            : ((n[a] = e[a]), (i[a] = e[a]))
          : a.search(/on[A-Z]/) === 0 && typeof e[a] == "function"
          ? t
            ? (r[`${a[2].toLowerCase()}${a.substr(3)}`] = e[a])
            : (n.on[`${a[2].toLowerCase()}${a.substr(3)}`] = e[a])
          : (s[a] = e[a]));
    }),
    ["navigation", "pagination", "scrollbar"].forEach((a) => {
      n[a] === !0 && (n[a] = {}), n[a] === !1 && delete n[a];
    }),
    { params: n, passedParams: i, rest: s, events: r }
  );
}
function W6(e, t) {
  let {
    el: n,
    nextEl: r,
    prevEl: i,
    paginationEl: s,
    scrollbarEl: o,
    swiper: u,
  } = e;
  Ag(t) &&
    r &&
    i &&
    ((u.params.navigation.nextEl = r),
    (u.originalParams.navigation.nextEl = r),
    (u.params.navigation.prevEl = i),
    (u.originalParams.navigation.prevEl = i)),
    kg(t) &&
      s &&
      ((u.params.pagination.el = s), (u.originalParams.pagination.el = s)),
    Mg(t) &&
      o &&
      ((u.params.scrollbar.el = o), (u.originalParams.scrollbar.el = o)),
    u.init(n);
}
function U6(e, t, n, r, i) {
  const s = [];
  if (!t) return s;
  const o = (a) => {
    s.indexOf(a) < 0 && s.push(a);
  };
  if (n && r) {
    const a = r.map(i),
      d = n.map(i);
    a.join("") !== d.join("") && o("children"),
      r.length !== n.length && o("children");
  }
  return (
    Pg.filter((a) => a[0] === "_")
      .map((a) => a.replace(/_/, ""))
      .forEach((a) => {
        if (a in e && a in t)
          if (dr(e[a]) && dr(t[a])) {
            const d = Object.keys(e[a]),
              p = Object.keys(t[a]);
            d.length !== p.length
              ? o(a)
              : (d.forEach((l) => {
                  e[a][l] !== t[a][l] && o(a);
                }),
                p.forEach((l) => {
                  e[a][l] !== t[a][l] && o(a);
                }));
          } else e[a] !== t[a] && o(a);
      }),
    s
  );
}
const K6 = (e) => {
  !e ||
    e.destroyed ||
    !e.params.virtual ||
    (e.params.virtual && !e.params.virtual.enabled) ||
    (e.updateSlides(),
    e.updateProgress(),
    e.updateSlidesClasses(),
    e.parallax &&
      e.params.parallax &&
      e.params.parallax.enabled &&
      e.parallax.setTranslate());
};
function dl() {
  return (
    (dl = Object.assign
      ? Object.assign.bind()
      : function (e) {
          for (var t = 1; t < arguments.length; t++) {
            var n = arguments[t];
            for (var r in n)
              Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r]);
          }
          return e;
        }),
    dl.apply(this, arguments)
  );
}
function Lg(e) {
  return (
    e.type && e.type.displayName && e.type.displayName.includes("SwiperSlide")
  );
}
function Og(e) {
  const t = [];
  return (
    ee.Children.toArray(e).forEach((n) => {
      Lg(n)
        ? t.push(n)
        : n.props &&
          n.props.children &&
          Og(n.props.children).forEach((r) => t.push(r));
    }),
    t
  );
}
function Y6(e) {
  const t = [],
    n = {
      "container-start": [],
      "container-end": [],
      "wrapper-start": [],
      "wrapper-end": [],
    };
  return (
    ee.Children.toArray(e).forEach((r) => {
      if (Lg(r)) t.push(r);
      else if (r.props && r.props.slot && n[r.props.slot])
        n[r.props.slot].push(r);
      else if (r.props && r.props.children) {
        const i = Og(r.props.children);
        i.length > 0 ? i.forEach((s) => t.push(s)) : n["container-end"].push(r);
      } else n["container-end"].push(r);
    }),
    { slides: t, slots: n }
  );
}
function X6(e, t, n) {
  if (!n) return null;
  const r = (p) => {
      let l = p;
      return (
        p < 0 ? (l = t.length + p) : l >= t.length && (l = l - t.length), l
      );
    },
    i = e.isHorizontal()
      ? { [e.rtlTranslate ? "right" : "left"]: `${n.offset}px` }
      : { top: `${n.offset}px` },
    { from: s, to: o } = n,
    u = e.params.loop ? -t.length : 0,
    a = e.params.loop ? t.length * 2 : t.length,
    d = [];
  for (let p = u; p < a; p += 1) p >= s && p <= o && d.push(t[r(p)]);
  return d.map((p, l) =>
    ee.cloneElement(p, {
      swiper: e,
      style: i,
      key: p.props.virtualIndex || p.key || `slide-${l}`,
    })
  );
}
function ss(e, t) {
  return typeof window > "u" ? C.useEffect(e, t) : C.useLayoutEffect(e, t);
}
const gh = C.createContext(null),
  Z6 = C.createContext(null),
  Dg = C.forwardRef(function (e, t) {
    let {
        className: n,
        tag: r = "div",
        wrapperTag: i = "div",
        children: s,
        onSwiper: o,
        ...u
      } = e === void 0 ? {} : e,
      a = !1;
    const [d, p] = C.useState("swiper"),
      [l, c] = C.useState(null),
      [f, m] = C.useState(!1),
      v = C.useRef(!1),
      w = C.useRef(null),
      h = C.useRef(null),
      g = C.useRef(null),
      y = C.useRef(null),
      x = C.useRef(null),
      S = C.useRef(null),
      T = C.useRef(null),
      M = C.useRef(null),
      { params: E, passedParams: k, rest: P, events: O } = G6(u),
      { slides: V, slots: R } = Y6(s),
      N = () => {
        m(!f);
      };
    Object.assign(E.on, {
      _containerClasses(L, D) {
        p(D);
      },
    });
    const W = () => {
      Object.assign(E.on, O), (a = !0);
      const L = { ...E };
      if (
        (delete L.wrapperClass,
        (h.current = new Ad(L)),
        h.current.virtual && h.current.params.virtual.enabled)
      ) {
        h.current.virtual.slides = V;
        const D = {
          cache: !1,
          slides: V,
          renderExternal: c,
          renderExternalUpdate: !1,
        };
        Xr(h.current.params.virtual, D),
          Xr(h.current.originalParams.virtual, D);
      }
    };
    w.current || W(), h.current && h.current.on("_beforeBreakpoint", N);
    const Y = () => {
        a ||
          !O ||
          !h.current ||
          Object.keys(O).forEach((L) => {
            h.current.on(L, O[L]);
          });
      },
      $ = () => {
        !O ||
          !h.current ||
          Object.keys(O).forEach((L) => {
            h.current.off(L, O[L]);
          });
      };
    C.useEffect(() => () => {
      h.current && h.current.off("_beforeBreakpoint", N);
    }),
      C.useEffect(() => {
        !v.current &&
          h.current &&
          (h.current.emitSlidesClasses(), (v.current = !0));
      }),
      ss(() => {
        if ((t && (t.current = w.current), !!w.current))
          return (
            h.current.destroyed && W(),
            W6(
              {
                el: w.current,
                nextEl: x.current,
                prevEl: S.current,
                paginationEl: T.current,
                scrollbarEl: M.current,
                swiper: h.current,
              },
              E
            ),
            o && !h.current.destroyed && o(h.current),
            () => {
              h.current && !h.current.destroyed && h.current.destroy(!0, !1);
            }
          );
      }, []),
      ss(() => {
        Y();
        const L = U6(k, g.current, V, y.current, (D) => D.key);
        return (
          (g.current = k),
          (y.current = V),
          L.length &&
            h.current &&
            !h.current.destroyed &&
            $6({
              swiper: h.current,
              slides: V,
              passedParams: k,
              changedParams: L,
              nextEl: x.current,
              prevEl: S.current,
              scrollbarEl: M.current,
              paginationEl: T.current,
            }),
          () => {
            $();
          }
        );
      }),
      ss(() => {
        K6(h.current);
      }, [l]);
    function A() {
      return E.virtual
        ? X6(h.current, V, l)
        : V.map((L, D) =>
            ee.cloneElement(L, { swiper: h.current, swiperSlideIndex: D })
          );
    }
    return ee.createElement(
      r,
      dl({ ref: w, className: bg(`${d}${n ? ` ${n}` : ""}`) }, P),
      ee.createElement(
        Z6.Provider,
        { value: h.current },
        R["container-start"],
        ee.createElement(
          i,
          { className: H6(E.wrapperClass) },
          R["wrapper-start"],
          A(),
          R["wrapper-end"]
        ),
        Ag(E) &&
          ee.createElement(
            ee.Fragment,
            null,
            ee.createElement("div", {
              ref: S,
              className: "swiper-button-prev",
            }),
            ee.createElement("div", { ref: x, className: "swiper-button-next" })
          ),
        Mg(E) &&
          ee.createElement("div", { ref: M, className: "swiper-scrollbar" }),
        kg(E) &&
          ee.createElement("div", { ref: T, className: "swiper-pagination" }),
        R["container-end"]
      )
    );
  });
Dg.displayName = "Swiper";
const Rg = C.forwardRef(function (e, t) {
  let {
    tag: n = "div",
    children: r,
    className: i = "",
    swiper: s,
    zoom: o,
    lazy: u,
    virtualIndex: a,
    swiperSlideIndex: d,
    ...p
  } = e === void 0 ? {} : e;
  const l = C.useRef(null),
    [c, f] = C.useState("swiper-slide"),
    [m, v] = C.useState(!1);
  function w(x, S, T) {
    S === l.current && f(T);
  }
  ss(() => {
    if (
      (typeof d < "u" && (l.current.swiperSlideIndex = d),
      t && (t.current = l.current),
      !(!l.current || !s))
    ) {
      if (s.destroyed) {
        c !== "swiper-slide" && f("swiper-slide");
        return;
      }
      return (
        s.on("_slideClass", w),
        () => {
          s && s.off("_slideClass", w);
        }
      );
    }
  }),
    ss(() => {
      s && l.current && !s.destroyed && f(s.getSlideClasses(l.current));
    }, [s]);
  const h = {
      isActive: c.indexOf("swiper-slide-active") >= 0,
      isVisible: c.indexOf("swiper-slide-visible") >= 0,
      isPrev: c.indexOf("swiper-slide-prev") >= 0,
      isNext: c.indexOf("swiper-slide-next") >= 0,
    },
    g = () => (typeof r == "function" ? r(h) : r),
    y = () => {
      v(!0);
    };
  return ee.createElement(
    n,
    dl(
      {
        ref: l,
        className: bg(`${c}${i ? ` ${i}` : ""}`),
        "data-swiper-slide-index": a,
        onLoad: y,
      },
      p
    ),
    o &&
      ee.createElement(
        gh.Provider,
        { value: h },
        ee.createElement(
          "div",
          {
            className: "swiper-zoom-container",
            "data-swiper-zoom": typeof o == "number" ? o : void 0,
          },
          g(),
          u &&
            !m &&
            ee.createElement("div", { className: "swiper-lazy-preloader" })
        )
      ),
    !o &&
      ee.createElement(
        gh.Provider,
        { value: h },
        g(),
        u &&
          !m &&
          ee.createElement("div", { className: "swiper-lazy-preloader" })
      )
  );
});
Rg.displayName = "SwiperSlide";
function Q6(e) {
  let { swiper: t, extendParams: n, on: r, emit: i, params: s } = e;
  (t.autoplay = { running: !1, paused: !1, timeLeft: 0 }),
    n({
      autoplay: {
        enabled: !1,
        delay: 3e3,
        waitForTransition: !0,
        disableOnInteraction: !1,
        stopOnLastSlide: !1,
        reverseDirection: !1,
        pauseOnMouseEnter: !1,
      },
    });
  let o,
    u,
    a = s && s.autoplay ? s.autoplay.delay : 3e3,
    d = s && s.autoplay ? s.autoplay.delay : 3e3,
    p,
    l = new Date().getTime(),
    c,
    f,
    m,
    v,
    w,
    h,
    g;
  function y(A) {
    !t ||
      t.destroyed ||
      !t.wrapperEl ||
      (A.target === t.wrapperEl &&
        (t.wrapperEl.removeEventListener("transitionend", y),
        !(g || (A.detail && A.detail.bySwiperTouchMove)) && P()));
  }
  const x = () => {
      if (t.destroyed || !t.autoplay.running) return;
      t.autoplay.paused ? (c = !0) : c && ((d = p), (c = !1));
      const A = t.autoplay.paused ? p : l + d - new Date().getTime();
      (t.autoplay.timeLeft = A),
        i("autoplayTimeLeft", A, A / a),
        (u = requestAnimationFrame(() => {
          x();
        }));
    },
    S = () => {
      let A;
      return (
        t.virtual && t.params.virtual.enabled
          ? (A = t.slides.filter((D) =>
              D.classList.contains("swiper-slide-active")
            )[0])
          : (A = t.slides[t.activeIndex]),
        A ? parseInt(A.getAttribute("data-swiper-autoplay"), 10) : void 0
      );
    },
    T = (A) => {
      if (t.destroyed || !t.autoplay.running) return;
      cancelAnimationFrame(u), x();
      let L = typeof A > "u" ? t.params.autoplay.delay : A;
      (a = t.params.autoplay.delay), (d = t.params.autoplay.delay);
      const D = S();
      !Number.isNaN(D) &&
        D > 0 &&
        typeof A > "u" &&
        ((L = D), (a = D), (d = D)),
        (p = L);
      const z = t.params.speed,
        Z = () => {
          !t ||
            t.destroyed ||
            (t.params.autoplay.reverseDirection
              ? !t.isBeginning || t.params.loop || t.params.rewind
                ? (t.slidePrev(z, !0, !0), i("autoplay"))
                : t.params.autoplay.stopOnLastSlide ||
                  (t.slideTo(t.slides.length - 1, z, !0, !0), i("autoplay"))
              : !t.isEnd || t.params.loop || t.params.rewind
              ? (t.slideNext(z, !0, !0), i("autoplay"))
              : t.params.autoplay.stopOnLastSlide ||
                (t.slideTo(0, z, !0, !0), i("autoplay")),
            t.params.cssMode &&
              ((l = new Date().getTime()),
              requestAnimationFrame(() => {
                T();
              })));
        };
      return (
        L > 0
          ? (clearTimeout(o),
            (o = setTimeout(() => {
              Z();
            }, L)))
          : requestAnimationFrame(() => {
              Z();
            }),
        L
      );
    },
    M = () => {
      (l = new Date().getTime()),
        (t.autoplay.running = !0),
        T(),
        i("autoplayStart");
    },
    E = () => {
      (t.autoplay.running = !1),
        clearTimeout(o),
        cancelAnimationFrame(u),
        i("autoplayStop");
    },
    k = (A, L) => {
      if (t.destroyed || !t.autoplay.running) return;
      clearTimeout(o), A || (h = !0);
      const D = () => {
        i("autoplayPause"),
          t.params.autoplay.waitForTransition
            ? t.wrapperEl.addEventListener("transitionend", y)
            : P();
      };
      if (((t.autoplay.paused = !0), L)) {
        w && (p = t.params.autoplay.delay), (w = !1), D();
        return;
      }
      (p = (p || t.params.autoplay.delay) - (new Date().getTime() - l)),
        !(t.isEnd && p < 0 && !t.params.loop) && (p < 0 && (p = 0), D());
    },
    P = () => {
      (t.isEnd && p < 0 && !t.params.loop) ||
        t.destroyed ||
        !t.autoplay.running ||
        ((l = new Date().getTime()),
        h ? ((h = !1), T(p)) : T(),
        (t.autoplay.paused = !1),
        i("autoplayResume"));
    },
    O = () => {
      if (t.destroyed || !t.autoplay.running) return;
      const A = en();
      A.visibilityState === "hidden" && ((h = !0), k(!0)),
        A.visibilityState === "visible" && P();
    },
    V = (A) => {
      A.pointerType === "mouse" &&
        ((h = !0), (g = !0), !(t.animating || t.autoplay.paused) && k(!0));
    },
    R = (A) => {
      A.pointerType === "mouse" && ((g = !1), t.autoplay.paused && P());
    },
    N = () => {
      t.params.autoplay.pauseOnMouseEnter &&
        (t.el.addEventListener("pointerenter", V),
        t.el.addEventListener("pointerleave", R));
    },
    W = () => {
      t.el &&
        typeof t.el != "string" &&
        (t.el.removeEventListener("pointerenter", V),
        t.el.removeEventListener("pointerleave", R));
    },
    Y = () => {
      en().addEventListener("visibilitychange", O);
    },
    $ = () => {
      en().removeEventListener("visibilitychange", O);
    };
  r("init", () => {
    t.params.autoplay.enabled && (N(), Y(), M());
  }),
    r("destroy", () => {
      W(), $(), t.autoplay.running && E();
    }),
    r("_freeModeStaticRelease", () => {
      (m || h) && P();
    }),
    r("_freeModeNoMomentumRelease", () => {
      t.params.autoplay.disableOnInteraction ? E() : k(!0, !0);
    }),
    r("beforeTransitionStart", (A, L, D) => {
      t.destroyed ||
        !t.autoplay.running ||
        (D || !t.params.autoplay.disableOnInteraction ? k(!0, !0) : E());
    }),
    r("sliderFirstMove", () => {
      if (!(t.destroyed || !t.autoplay.running)) {
        if (t.params.autoplay.disableOnInteraction) {
          E();
          return;
        }
        (f = !0),
          (m = !1),
          (h = !1),
          (v = setTimeout(() => {
            (h = !0), (m = !0), k(!0);
          }, 200));
      }
    }),
    r("touchEnd", () => {
      if (!(t.destroyed || !t.autoplay.running || !f)) {
        if (
          (clearTimeout(v),
          clearTimeout(o),
          t.params.autoplay.disableOnInteraction)
        ) {
          (m = !1), (f = !1);
          return;
        }
        m && t.params.cssMode && P(), (m = !1), (f = !1);
      }
    }),
    r("slideChange", () => {
      t.destroyed || !t.autoplay.running || (w = !0);
    }),
    Object.assign(t.autoplay, { start: M, stop: E, pause: k, resume: P });
}
const q6 = {
  discord: () =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "24",
      height: "25",
      viewBox: "0 0 24 25",
      fill: "none",
      children: _.jsx("path", {
        d: "M19.2701 6.12077C17.9401 5.50077 16.5001 5.05077 15.0001 4.79077C14.9737 4.79115 14.9486 4.80193 14.9301 4.82077C14.7501 5.15077 14.5401 5.58077 14.4001 5.91077C12.8091 5.67092 11.1911 5.67092 9.60012 5.91077C9.46012 5.57077 9.25012 5.15077 9.06012 4.82077C9.05012 4.80077 9.02012 4.79077 8.99012 4.79077C7.49012 5.05077 6.06012 5.50077 4.72012 6.12077C4.71012 6.12077 4.70012 6.13077 4.69012 6.14077C1.97012 10.2108 1.22012 14.1708 1.59012 18.0908C1.59012 18.1108 1.60012 18.1308 1.62012 18.1408C3.42012 19.4608 5.15012 20.2608 6.86012 20.7908C6.89012 20.8008 6.92012 20.7908 6.93012 20.7708C7.33012 20.2208 7.69012 19.6408 8.00012 19.0308C8.02012 18.9908 8.00012 18.9508 7.96012 18.9408C7.39012 18.7208 6.85012 18.4608 6.32012 18.1608C6.28012 18.1408 6.28012 18.0808 6.31012 18.0508C6.42012 17.9708 6.53012 17.8808 6.64012 17.8008C6.66012 17.7808 6.69012 17.7808 6.71012 17.7908C10.1501 19.3608 13.8601 19.3608 17.2601 17.7908C17.2801 17.7808 17.3101 17.7808 17.3301 17.8008C17.4401 17.8908 17.5501 17.9708 17.6601 18.0608C17.7001 18.0908 17.7001 18.1508 17.6501 18.1708C17.1301 18.4808 16.5801 18.7308 16.0101 18.9508C15.9701 18.9608 15.9601 19.0108 15.9701 19.0408C16.2901 19.6508 16.6501 20.2308 17.0401 20.7808C17.0701 20.7908 17.1001 20.8008 17.1301 20.7908C18.8501 20.2608 20.5801 19.4608 22.3801 18.1408C22.4001 18.1308 22.4101 18.1108 22.4101 18.0908C22.8501 13.5608 21.6801 9.63077 19.3101 6.14077C19.3001 6.13077 19.2901 6.12077 19.2701 6.12077ZM8.52012 15.7008C7.49012 15.7008 6.63012 14.7508 6.63012 13.5808C6.63012 12.4108 7.47012 11.4608 8.52012 11.4608C9.58012 11.4608 10.4201 12.4208 10.4101 13.5808C10.4101 14.7508 9.57012 15.7008 8.52012 15.7008ZM15.4901 15.7008C14.4601 15.7008 13.6001 14.7508 13.6001 13.5808C13.6001 12.4108 14.4401 11.4608 15.4901 11.4608C16.5501 11.4608 17.3901 12.4208 17.3801 13.5808C17.3801 14.7508 16.5501 15.7008 15.4901 15.7008Z",
        fill: "#8BA4FF",
      }),
    }),
  tiktok: () =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "26",
      height: "27",
      viewBox: "0 0 26 27",
      fill: "none",
      children: _.jsx("path", {
        d: "M17.9835 7.09577C17.2431 6.25026 16.8351 5.16462 16.8352 4.04077H13.4877V17.4741C13.4624 18.2012 13.1556 18.8901 12.6322 19.3954C12.1087 19.9007 11.4094 20.1829 10.6818 20.1824C9.1435 20.1824 7.86517 18.9258 7.86517 17.3658C7.86517 15.5024 9.6635 14.1049 11.516 14.6791V11.2558C7.7785 10.7574 4.50684 13.6608 4.50684 17.3658C4.50684 20.9733 7.49684 23.5408 10.671 23.5408C14.0727 23.5408 16.8352 20.7783 16.8352 17.3658V10.5516C18.1926 11.5264 19.8223 12.0495 21.4935 12.0466V8.69911C21.4935 8.69911 19.4568 8.79661 17.9835 7.09577Z",
        fill: "white",
        "fill-opacity": "0.77",
      }),
    }),
  instagram: () =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "24",
      height: "25",
      viewBox: "0 0 24 25",
      fill: "none",
      children: _.jsx("path", {
        d: "M7.8 2.79077H16.2C19.4 2.79077 22 5.39077 22 8.59077V16.9908C22 18.529 21.3889 20.0043 20.3012 21.092C19.2135 22.1797 17.7383 22.7908 16.2 22.7908H7.8C4.6 22.7908 2 20.1908 2 16.9908V8.59077C2 7.05252 2.61107 5.57726 3.69878 4.48955C4.78649 3.40184 6.26174 2.79077 7.8 2.79077ZM7.6 4.79077C6.64522 4.79077 5.72955 5.17006 5.05442 5.84519C4.37928 6.52032 4 7.43599 4 8.39077V17.1908C4 19.1808 5.61 20.7908 7.6 20.7908H16.4C17.3548 20.7908 18.2705 20.4115 18.9456 19.7364C19.6207 19.0612 20 18.1456 20 17.1908V8.39077C20 6.40077 18.39 4.79077 16.4 4.79077H7.6ZM17.25 6.29077C17.5815 6.29077 17.8995 6.42247 18.1339 6.65689C18.3683 6.89131 18.5 7.20925 18.5 7.54077C18.5 7.87229 18.3683 8.19023 18.1339 8.42465C17.8995 8.65908 17.5815 8.79077 17.25 8.79077C16.9185 8.79077 16.6005 8.65908 16.3661 8.42465C16.1317 8.19023 16 7.87229 16 7.54077C16 7.20925 16.1317 6.89131 16.3661 6.65689C16.6005 6.42247 16.9185 6.29077 17.25 6.29077ZM12 7.79077C13.3261 7.79077 14.5979 8.31756 15.5355 9.25524C16.4732 10.1929 17 11.4647 17 12.7908C17 14.1169 16.4732 15.3886 15.5355 16.3263C14.5979 17.264 13.3261 17.7908 12 17.7908C10.6739 17.7908 9.40215 17.264 8.46447 16.3263C7.52678 15.3886 7 14.1169 7 12.7908C7 11.4647 7.52678 10.1929 8.46447 9.25524C9.40215 8.31756 10.6739 7.79077 12 7.79077ZM12 9.79077C11.2044 9.79077 10.4413 10.1068 9.87868 10.6695C9.31607 11.2321 9 11.9951 9 12.7908C9 13.5864 9.31607 14.3495 9.87868 14.9121C10.4413 15.4747 11.2044 15.7908 12 15.7908C12.7956 15.7908 13.5587 15.4747 14.1213 14.9121C14.6839 14.3495 15 13.5864 15 12.7908C15 11.9951 14.6839 11.2321 14.1213 10.6695C13.5587 10.1068 12.7956 9.79077 12 9.79077Z",
        fill: "#D479FF",
      }),
    }),
  youtube: () =>
    _.jsx("svg", {
      xmlns: "http://www.w3.org/2000/svg",
      width: "24",
      height: "24",
      viewBox: "0 0 24 24",
      fill: "none",
      children: _.jsx("path", {
        d: "M10 15L15.19 12L10 9V15ZM21.56 7.17C21.69 7.64 21.78 8.27 21.84 9.07C21.91 9.87 21.94 10.56 21.94 11.16L22 12C22 14.19 21.84 15.8 21.56 16.83C21.31 17.73 20.73 18.31 19.83 18.56C19.36 18.69 18.5 18.78 17.18 18.84C15.88 18.91 14.69 18.94 13.59 18.94L12 19C7.81 19 5.2 18.84 4.17 18.56C3.27 18.31 2.69 17.73 2.44 16.83C2.31 16.36 2.22 15.73 2.16 14.93C2.09 14.13 2.06 13.44 2.06 12.84L2 12C2 9.81 2.16 8.2 2.44 7.17C2.69 6.27 3.27 5.69 4.17 5.44C4.64 5.31 5.5 5.22 6.82 5.16C8.12 5.09 9.31 5.06 10.41 5.06L12 5C16.19 5 18.8 5.16 19.83 5.44C20.73 5.69 21.31 6.27 21.56 7.17Z",
        fill: "#FF4D4D",
      }),
    }),
};
function J6() {
  const { team: e } = je();
  return _.jsx("div", {
    className: "mt-[0.8125rem]",
    children: _.jsx(Dg, {
      autoplay: {
        delay: 1500,
        pauseOnMouseEnter: !0,
        disableOnInteraction: !1,
      },
      modules: [Q6],
      speed: 500,
      slidesPerView: 1,
      spaceBetween: 10,
      children: e.map((t, n) =>
        _.jsx(Rg, { children: _.jsx(eS, { data: t }) }, n)
      ),
    }),
  });
}
function eS({ data: e }) {
  return _.jsxs("div", {
    style: { backdropFilter: "blur(32.650001525878906px)" },
    className: "w-full bg-[#07080D66] h-[21.9375rem] rounded-[0.6875rem] p-4",
    children: [
      _.jsxs("div", {
        className: "flex items-start gap-4 ",
        children: [
          _.jsx("img", {
            className: "w-[12.125rem] h-[11.0625rem] object-cover rounded-xl",
            src: e.avatar,
          }),
          _.jsxs("div", {
            className: "flex-1",
            children: [
              _.jsx("p", {
                className:
                  "font-roboto text-[1.875rem] text-white font-semibold",
                children: e.name,
              }),
              _.jsx("p", {
                className: "font-roboto text-base text-white/50 ",
                children: e.tag,
              }),
              _.jsx("hr", { className: "border-white/10 my-[0.8125rem]" }),
              _.jsx("p", {
                className: "font-roboto text-base text-white/60 font-medium",
                children: "Information",
              }),
              _.jsx("p", {
                className: "font-roboto text-sm text-white/20 leading-[140%] ",
                children: e.description,
              }),
            ],
          }),
        ],
      }),
      _.jsx("div", {
        className: "grid grid-cols-2 gap-[0.6875rem] mt-[0.9375rem]",
        children: Object.entries(e.medias).map(([t, n]) =>
          _.jsx(tS, { name: t, value: n }, t)
        ),
      }),
    ],
  });
}
function tS({ name: e, value: t }) {
  const n = q6[e];
  return _.jsxs("div", {
    className:
      "flex items-center p-[0.4375rem] bg-[#07080D1A] gap-[0.625rem] rounded-[0.4375rem]",
    children: [
      _.jsx("div", {
        className:
          "w-[2.3125rem] h-[2.3125rem] rounded-[0.3125rem] bg-[#07080D1A] flex items-center justify-center",
        children: _.jsx(n, {}),
      }),
      _.jsxs("p", { className: "font-roboto text-white", children: ["@", t] }),
    ],
  });
}
function nS() {
  const { socials: e } = je();
  return _.jsx("div", {
    className:
      "w-full flex flex-wrap gap-2 max-h-[40.5rem] overflow-y-auto mt-[0.8125rem]",
    children: e.map((t, n) => _.jsx(rS, { data: t }, t.photo)),
  });
}
function rS({ data: e }) {
  return (
    je(),
    _.jsxs("div", {
      style: { backdropFilter: "blur(21.111047744750977px)" },
      className:
        " group rounded-[0.4375rem] overflow-hidden relative p-4 w-[15.5625rem] duration-500 h-[15.875rem] transition-all cursor-pointer hover:bg-[#07080D99] bg-[#07080D66]",
      children: [
        _.jsxs("div", {
          children: [
            _.jsx("p", {
              className:
                "text-white font-roboto text-base font-semibold leading-[90%]",
              children: e.name,
            }),
            _.jsx("p", {
              className: "text-white/50 font-roboto text-xs leading-[90%]",
              children: "",
            }),
          ],
        }),
        _.jsx("div", {
          className:
            "absolute top-0 left-0 flex items-center justify-center w-full h-full",
          children: _.jsx("img", {
            className:
              "w-[6.8125rem] mt-3 h-[6.8125rem] rounded-xl group-hover:scale-110 transition-all duration-500",
            src: `./socials/${e.icon}`,
          }),
        }),
        _.jsx("img", {
          className:
            "w-[15.8078rem] group-hover:scale-125 transition-all duration-500 h-[15.8078rem] absolute bottom-0 right-0 -z-10 translate-x-10 translate-y-10 opacity-10",
          src: `./socials/${e.icon}`,
        }),
      ],
    })
  );
}
const Fi = [
  { name: "Rules", icon: Rw, component: g8 },
  { name: "Gallery", icon: Lw, component: y8 },
  { name: "Team", icon: Dw, component: J6 },
  { name: "Game", icon: Vw, component: x8 },
  { name: "Media", icon: Ow, component: nS },
];
function iS() {
  const [e, t] = C.useState(1),
    [n, r] = C.useState(!1),
    { lang: i } = je(),
    s = {
      hidden: (o) => ({ x: o > 0 ? 150 : -150, position: "absolute" }),
      visible: {
        x: 0,
        opacity: 1,
        transition: { duration: 0.3 },
        position: "relative",
      },
      exit: (o) => ({
        x: o < 0 ? 150 : -150,
        opacity: 0,
        transition: { duration: 0.3 },
        position: "absolute",
      }),
    };
  return _.jsxs("div", {
    className: "w-[31.8125rem] ",
    children: [
      _.jsx("div", {
        style: { backdropFilter: "blur(32.650001525878906px)" },
        className:
          "p-[1.375rem] bg-[#07080D66] transition-all rounded-[0.6875rem] flex items-center justify-between gap-10",
        children: Fi.map((o, u) =>
          _.jsx(
            sS,
            {
              active: e == u,
              onClick: () => {
                r(!1), t(u);
              },
              page: { ...o, name: i[o.name.toLowerCase()] },
            },
            u
          )
        ),
      }),
      _.jsx(ks, {
        custom: e,
        children: _.jsx(
          cr.div,
          {
            custom: e,
            variants: s,
            initial: "hidden",
            animate: "visible",
            exit: "exit",
            children: _.jsx(Gw, {
              open: n,
              setOpen: r,
              page: {
                ...Fi[e],
                name: i[Fi[e].name.toLowerCase()],
                description: i[`${Fi[e].name.toLowerCase()}Description`],
              },
            }),
          },
          e
        ),
      }),
      _.jsx(ks, { children: n && C.createElement(Fi[e].component) }),
    ],
  });
}
function sS({ page: e, active: t, onClick: n }) {
  return _.jsxs("div", {
    onClick: n,
    className: ii(
      "flex items-center gap-2 relative cursor-pointer transition-all"
    ),
    children: [
      t && C.createElement(e.icon),
      _.jsx("p", {
        className: ii({
          "text-[1.25rem] text-white/30 font-roboto": !0,
          "!text-white": t,
        }),
        children: e.name,
      }),
      t &&
        _.jsx("div", {
          style: { boxShadow: "0px 0px 23.8px 0px rgba(255, 255, 255, 0.61)" },
          className:
            "w-full h-0.5 rounded-full  bg-white absolute bottom-0 translate-y-4",
        }),
    ],
  });
}
function oS() {
  const { imagepopup: e, update: t } = je(),
    n = C.useRef(null);
  return (
    C.useEffect(() => {
      const r = (i) => {
        n.current && !n.current.contains(i.target) && t("SET_IMAGEPOPUP", !1);
      };
      return (
        document.addEventListener("mousedown", r),
        () => {
          document.removeEventListener("mousedown", r);
        }
      );
    }, [e]),
    _.jsx(ks, {
      children:
        e &&
        _.jsx(cr.div, {
          initial: { opacity: 0 },
          animate: { opacity: 1 },
          exit: { opacity: 0 },
          className:
            "flex items-center justify-center absolute top-0 left-0 bg-black/50 z-[99999] w-full h-full",
          children: _.jsx(cr.img, {
            initial: { opacity: 0, scale: 0.5 },
            animate: { opacity: 1, scale: 1 },
            exit: { opacity: 0, scale: 0.5 },
            transition: { duration: 0.5 },
            ref: n,
            className: "w-[70%]",
            src: e,
          }),
        }),
    })
  );
}
function lS() {
  const { selectedgame: e, update: t } = je(),
    n = C.useRef(null);
  return (
    C.useEffect(() => {
      const r = (i) => {
        n.current && !n.current.contains(i.target) && t("SET_SELECTEDGAME", !1);
      };
      return (
        document.addEventListener("mousedown", r),
        () => {
          document.removeEventListener("mousedown", r);
        }
      );
    }, [e]),
    _.jsx(ks, {
      children:
        e &&
        _.jsx(cr.div, {
          initial: { opacity: 0 },
          animate: { opacity: 1 },
          exit: { opacity: 0 },
          className:
            "flex items-center justify-center absolute top-0 left-0 bg-black/50 z-[99999] w-full h-full",
          children: _.jsx(cr.iframe, {
            initial: { opacity: 0, scale: 0.5 },
            animate: { opacity: 1, scale: 1 },
            exit: { opacity: 0, scale: 0.5 },
            transition: { duration: 0.5 },
            ref: n,
            className: "w-[70%] h-[70%]",
            src: e,
          }),
        }),
    })
  );
}
const li = Math.min,
  ir = Math.max,
  fl = Math.round,
  go = Math.floor,
  Rn = (e) => ({ x: e, y: e }),
  aS = { left: "right", right: "left", bottom: "top", top: "bottom" },
  uS = { start: "end", end: "start" };
function qu(e, t, n) {
  return ir(e, li(t, n));
}
function Fs(e, t) {
  return typeof e == "function" ? e(t) : e;
}
function fr(e) {
  return e.split("-")[0];
}
function zs(e) {
  return e.split("-")[1];
}
function Vg(e) {
  return e === "x" ? "y" : "x";
}
function kd(e) {
  return e === "y" ? "height" : "width";
}
function ai(e) {
  return ["top", "bottom"].includes(fr(e)) ? "y" : "x";
}
function Md(e) {
  return Vg(ai(e));
}
function cS(e, t, n) {
  n === void 0 && (n = !1);
  const r = zs(e),
    i = Md(e),
    s = kd(i);
  let o =
    i === "x"
      ? r === (n ? "end" : "start")
        ? "right"
        : "left"
      : r === "start"
      ? "bottom"
      : "top";
  return t.reference[s] > t.floating[s] && (o = pl(o)), [o, pl(o)];
}
function dS(e) {
  const t = pl(e);
  return [Ju(e), t, Ju(t)];
}
function Ju(e) {
  return e.replace(/start|end/g, (t) => uS[t]);
}
function fS(e, t, n) {
  const r = ["left", "right"],
    i = ["right", "left"],
    s = ["top", "bottom"],
    o = ["bottom", "top"];
  switch (e) {
    case "top":
    case "bottom":
      return n ? (t ? i : r) : t ? r : i;
    case "left":
    case "right":
      return t ? s : o;
    default:
      return [];
  }
}
function pS(e, t, n, r) {
  const i = zs(e);
  let s = fS(fr(e), n === "start", r);
  return (
    i && ((s = s.map((o) => o + "-" + i)), t && (s = s.concat(s.map(Ju)))), s
  );
}
function pl(e) {
  return e.replace(/left|right|bottom|top/g, (t) => aS[t]);
}
function hS(e) {
  return { top: 0, right: 0, bottom: 0, left: 0, ...e };
}
function Ig(e) {
  return typeof e != "number"
    ? hS(e)
    : { top: e, right: e, bottom: e, left: e };
}
function hl(e) {
  const { x: t, y: n, width: r, height: i } = e;
  return {
    width: r,
    height: i,
    top: n,
    left: t,
    right: t + r,
    bottom: n + i,
    x: t,
    y: n,
  };
}
function vh(e, t, n) {
  let { reference: r, floating: i } = e;
  const s = ai(t),
    o = Md(t),
    u = kd(o),
    a = fr(t),
    d = s === "y",
    p = r.x + r.width / 2 - i.width / 2,
    l = r.y + r.height / 2 - i.height / 2,
    c = r[u] / 2 - i[u] / 2;
  let f;
  switch (a) {
    case "top":
      f = { x: p, y: r.y - i.height };
      break;
    case "bottom":
      f = { x: p, y: r.y + r.height };
      break;
    case "right":
      f = { x: r.x + r.width, y: l };
      break;
    case "left":
      f = { x: r.x - i.width, y: l };
      break;
    default:
      f = { x: r.x, y: r.y };
  }
  switch (zs(t)) {
    case "start":
      f[o] -= c * (n && d ? -1 : 1);
      break;
    case "end":
      f[o] += c * (n && d ? -1 : 1);
      break;
  }
  return f;
}
const mS = async (e, t, n) => {
  const {
      placement: r = "bottom",
      strategy: i = "absolute",
      middleware: s = [],
      platform: o,
    } = n,
    u = s.filter(Boolean),
    a = await (o.isRTL == null ? void 0 : o.isRTL(t));
  let d = await o.getElementRects({ reference: e, floating: t, strategy: i }),
    { x: p, y: l } = vh(d, r, a),
    c = r,
    f = {},
    m = 0;
  for (let v = 0; v < u.length; v++) {
    const { name: w, fn: h } = u[v],
      {
        x: g,
        y,
        data: x,
        reset: S,
      } = await h({
        x: p,
        y: l,
        initialPlacement: r,
        placement: c,
        strategy: i,
        middlewareData: f,
        rects: d,
        platform: o,
        elements: { reference: e, floating: t },
      });
    (p = g ?? p),
      (l = y ?? l),
      (f = { ...f, [w]: { ...f[w], ...x } }),
      S &&
        m <= 50 &&
        (m++,
        typeof S == "object" &&
          (S.placement && (c = S.placement),
          S.rects &&
            (d =
              S.rects === !0
                ? await o.getElementRects({
                    reference: e,
                    floating: t,
                    strategy: i,
                  })
                : S.rects),
          ({ x: p, y: l } = vh(d, c, a))),
        (v = -1));
  }
  return { x: p, y: l, placement: c, strategy: i, middlewareData: f };
};
async function Ng(e, t) {
  var n;
  t === void 0 && (t = {});
  const { x: r, y: i, platform: s, rects: o, elements: u, strategy: a } = e,
    {
      boundary: d = "clippingAncestors",
      rootBoundary: p = "viewport",
      elementContext: l = "floating",
      altBoundary: c = !1,
      padding: f = 0,
    } = Fs(t, e),
    m = Ig(f),
    w = u[c ? (l === "floating" ? "reference" : "floating") : l],
    h = hl(
      await s.getClippingRect({
        element:
          (n = await (s.isElement == null ? void 0 : s.isElement(w))) == null ||
          n
            ? w
            : w.contextElement ||
              (await (s.getDocumentElement == null
                ? void 0
                : s.getDocumentElement(u.floating))),
        boundary: d,
        rootBoundary: p,
        strategy: a,
      })
    ),
    g =
      l === "floating"
        ? { x: r, y: i, width: o.floating.width, height: o.floating.height }
        : o.reference,
    y = await (s.getOffsetParent == null
      ? void 0
      : s.getOffsetParent(u.floating)),
    x = (await (s.isElement == null ? void 0 : s.isElement(y)))
      ? (await (s.getScale == null ? void 0 : s.getScale(y))) || { x: 1, y: 1 }
      : { x: 1, y: 1 },
    S = hl(
      s.convertOffsetParentRelativeRectToViewportRelativeRect
        ? await s.convertOffsetParentRelativeRectToViewportRelativeRect({
            elements: u,
            rect: g,
            offsetParent: y,
            strategy: a,
          })
        : g
    );
  return {
    top: (h.top - S.top + m.top) / x.y,
    bottom: (S.bottom - h.bottom + m.bottom) / x.y,
    left: (h.left - S.left + m.left) / x.x,
    right: (S.right - h.right + m.right) / x.x,
  };
}
const gS = (e) => ({
    name: "arrow",
    options: e,
    async fn(t) {
      const {
          x: n,
          y: r,
          placement: i,
          rects: s,
          platform: o,
          elements: u,
          middlewareData: a,
        } = t,
        { element: d, padding: p = 0 } = Fs(e, t) || {};
      if (d == null) return {};
      const l = Ig(p),
        c = { x: n, y: r },
        f = Md(i),
        m = kd(f),
        v = await o.getDimensions(d),
        w = f === "y",
        h = w ? "top" : "left",
        g = w ? "bottom" : "right",
        y = w ? "clientHeight" : "clientWidth",
        x = s.reference[m] + s.reference[f] - c[f] - s.floating[m],
        S = c[f] - s.reference[f],
        T = await (o.getOffsetParent == null ? void 0 : o.getOffsetParent(d));
      let M = T ? T[y] : 0;
      (!M || !(await (o.isElement == null ? void 0 : o.isElement(T)))) &&
        (M = u.floating[y] || s.floating[m]);
      const E = x / 2 - S / 2,
        k = M / 2 - v[m] / 2 - 1,
        P = li(l[h], k),
        O = li(l[g], k),
        V = P,
        R = M - v[m] - O,
        N = M / 2 - v[m] / 2 + E,
        W = qu(V, N, R),
        Y =
          !a.arrow &&
          zs(i) != null &&
          N !== W &&
          s.reference[m] / 2 - (N < V ? P : O) - v[m] / 2 < 0,
        $ = Y ? (N < V ? N - V : N - R) : 0;
      return {
        [f]: c[f] + $,
        data: {
          [f]: W,
          centerOffset: N - W - $,
          ...(Y && { alignmentOffset: $ }),
        },
        reset: Y,
      };
    },
  }),
  vS = function (e) {
    return (
      e === void 0 && (e = {}),
      {
        name: "flip",
        options: e,
        async fn(t) {
          var n, r;
          const {
              placement: i,
              middlewareData: s,
              rects: o,
              initialPlacement: u,
              platform: a,
              elements: d,
            } = t,
            {
              mainAxis: p = !0,
              crossAxis: l = !0,
              fallbackPlacements: c,
              fallbackStrategy: f = "bestFit",
              fallbackAxisSideDirection: m = "none",
              flipAlignment: v = !0,
              ...w
            } = Fs(e, t);
          if ((n = s.arrow) != null && n.alignmentOffset) return {};
          const h = fr(i),
            g = ai(u),
            y = fr(u) === u,
            x = await (a.isRTL == null ? void 0 : a.isRTL(d.floating)),
            S = c || (y || !v ? [pl(u)] : dS(u)),
            T = m !== "none";
          !c && T && S.push(...pS(u, v, m, x));
          const M = [u, ...S],
            E = await Ng(t, w),
            k = [];
          let P = ((r = s.flip) == null ? void 0 : r.overflows) || [];
          if ((p && k.push(E[h]), l)) {
            const N = cS(i, o, x);
            k.push(E[N[0]], E[N[1]]);
          }
          if (
            ((P = [...P, { placement: i, overflows: k }]),
            !k.every((N) => N <= 0))
          ) {
            var O, V;
            const N = (((O = s.flip) == null ? void 0 : O.index) || 0) + 1,
              W = M[N];
            if (W)
              return {
                data: { index: N, overflows: P },
                reset: { placement: W },
              };
            let Y =
              (V = P.filter(($) => $.overflows[0] <= 0).sort(
                ($, A) => $.overflows[1] - A.overflows[1]
              )[0]) == null
                ? void 0
                : V.placement;
            if (!Y)
              switch (f) {
                case "bestFit": {
                  var R;
                  const $ =
                    (R = P.filter((A) => {
                      if (T) {
                        const L = ai(A.placement);
                        return L === g || L === "y";
                      }
                      return !0;
                    })
                      .map((A) => [
                        A.placement,
                        A.overflows
                          .filter((L) => L > 0)
                          .reduce((L, D) => L + D, 0),
                      ])
                      .sort((A, L) => A[1] - L[1])[0]) == null
                      ? void 0
                      : R[0];
                  $ && (Y = $);
                  break;
                }
                case "initialPlacement":
                  Y = u;
                  break;
              }
            if (i !== Y) return { reset: { placement: Y } };
          }
          return {};
        },
      }
    );
  };
async function yS(e, t) {
  const { placement: n, platform: r, elements: i } = e,
    s = await (r.isRTL == null ? void 0 : r.isRTL(i.floating)),
    o = fr(n),
    u = zs(n),
    a = ai(n) === "y",
    d = ["left", "top"].includes(o) ? -1 : 1,
    p = s && a ? -1 : 1,
    l = Fs(t, e);
  let {
    mainAxis: c,
    crossAxis: f,
    alignmentAxis: m,
  } = typeof l == "number"
    ? { mainAxis: l, crossAxis: 0, alignmentAxis: null }
    : {
        mainAxis: l.mainAxis || 0,
        crossAxis: l.crossAxis || 0,
        alignmentAxis: l.alignmentAxis,
      };
  return (
    u && typeof m == "number" && (f = u === "end" ? m * -1 : m),
    a ? { x: f * p, y: c * d } : { x: c * d, y: f * p }
  );
}
const wS = function (e) {
    return (
      e === void 0 && (e = 0),
      {
        name: "offset",
        options: e,
        async fn(t) {
          var n, r;
          const { x: i, y: s, placement: o, middlewareData: u } = t,
            a = await yS(t, e);
          return o === ((n = u.offset) == null ? void 0 : n.placement) &&
            (r = u.arrow) != null &&
            r.alignmentOffset
            ? {}
            : { x: i + a.x, y: s + a.y, data: { ...a, placement: o } };
        },
      }
    );
  },
  xS = function (e) {
    return (
      e === void 0 && (e = {}),
      {
        name: "shift",
        options: e,
        async fn(t) {
          const { x: n, y: r, placement: i } = t,
            {
              mainAxis: s = !0,
              crossAxis: o = !1,
              limiter: u = {
                fn: (w) => {
                  let { x: h, y: g } = w;
                  return { x: h, y: g };
                },
              },
              ...a
            } = Fs(e, t),
            d = { x: n, y: r },
            p = await Ng(t, a),
            l = ai(fr(i)),
            c = Vg(l);
          let f = d[c],
            m = d[l];
          if (s) {
            const w = c === "y" ? "top" : "left",
              h = c === "y" ? "bottom" : "right",
              g = f + p[w],
              y = f - p[h];
            f = qu(g, f, y);
          }
          if (o) {
            const w = l === "y" ? "top" : "left",
              h = l === "y" ? "bottom" : "right",
              g = m + p[w],
              y = m - p[h];
            m = qu(g, m, y);
          }
          const v = u.fn({ ...t, [c]: f, [l]: m });
          return {
            ...v,
            data: { x: v.x - n, y: v.y - r, enabled: { [c]: s, [l]: o } },
          };
        },
      }
    );
  };
function zl() {
  return typeof window < "u";
}
function hi(e) {
  return jg(e) ? (e.nodeName || "").toLowerCase() : "#document";
}
function qe(e) {
  var t;
  return (
    (e == null || (t = e.ownerDocument) == null ? void 0 : t.defaultView) ||
    window
  );
}
function Ft(e) {
  var t;
  return (t = (jg(e) ? e.ownerDocument : e.document) || window.document) == null
    ? void 0
    : t.documentElement;
}
function jg(e) {
  return zl() ? e instanceof Node || e instanceof qe(e).Node : !1;
}
function Pt(e) {
  return zl() ? e instanceof Element || e instanceof qe(e).Element : !1;
}
function jt(e) {
  return zl() ? e instanceof HTMLElement || e instanceof qe(e).HTMLElement : !1;
}
function yh(e) {
  return !zl() || typeof ShadowRoot > "u"
    ? !1
    : e instanceof ShadowRoot || e instanceof qe(e).ShadowRoot;
}
function Bs(e) {
  const { overflow: t, overflowX: n, overflowY: r, display: i } = At(e);
  return (
    /auto|scroll|overlay|hidden|clip/.test(t + r + n) &&
    !["inline", "contents"].includes(i)
  );
}
function SS(e) {
  return ["table", "td", "th"].includes(hi(e));
}
function Bl(e) {
  return [":popover-open", ":modal"].some((t) => {
    try {
      return e.matches(t);
    } catch {
      return !1;
    }
  });
}
function bd(e) {
  const t = Ld(),
    n = Pt(e) ? At(e) : e;
  return (
    n.transform !== "none" ||
    n.perspective !== "none" ||
    (n.containerType ? n.containerType !== "normal" : !1) ||
    (!t && (n.backdropFilter ? n.backdropFilter !== "none" : !1)) ||
    (!t && (n.filter ? n.filter !== "none" : !1)) ||
    ["transform", "perspective", "filter"].some((r) =>
      (n.willChange || "").includes(r)
    ) ||
    ["paint", "layout", "strict", "content"].some((r) =>
      (n.contain || "").includes(r)
    )
  );
}
function _S(e) {
  let t = Vn(e);
  for (; jt(t) && !ui(t); ) {
    if (bd(t)) return t;
    if (Bl(t)) return null;
    t = Vn(t);
  }
  return null;
}
function Ld() {
  return typeof CSS > "u" || !CSS.supports
    ? !1
    : CSS.supports("-webkit-backdrop-filter", "none");
}
function ui(e) {
  return ["html", "body", "#document"].includes(hi(e));
}
function At(e) {
  return qe(e).getComputedStyle(e);
}
function Hl(e) {
  return Pt(e)
    ? { scrollLeft: e.scrollLeft, scrollTop: e.scrollTop }
    : { scrollLeft: e.scrollX, scrollTop: e.scrollY };
}
function Vn(e) {
  if (hi(e) === "html") return e;
  const t = e.assignedSlot || e.parentNode || (yh(e) && e.host) || Ft(e);
  return yh(t) ? t.host : t;
}
function Fg(e) {
  const t = Vn(e);
  return ui(t)
    ? e.ownerDocument
      ? e.ownerDocument.body
      : e.body
    : jt(t) && Bs(t)
    ? t
    : Fg(t);
}
function Ms(e, t, n) {
  var r;
  t === void 0 && (t = []), n === void 0 && (n = !0);
  const i = Fg(e),
    s = i === ((r = e.ownerDocument) == null ? void 0 : r.body),
    o = qe(i);
  if (s) {
    const u = ec(o);
    return t.concat(
      o,
      o.visualViewport || [],
      Bs(i) ? i : [],
      u && n ? Ms(u) : []
    );
  }
  return t.concat(i, Ms(i, [], n));
}
function ec(e) {
  return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null;
}
function zg(e) {
  const t = At(e);
  let n = parseFloat(t.width) || 0,
    r = parseFloat(t.height) || 0;
  const i = jt(e),
    s = i ? e.offsetWidth : n,
    o = i ? e.offsetHeight : r,
    u = fl(n) !== s || fl(r) !== o;
  return u && ((n = s), (r = o)), { width: n, height: r, $: u };
}
function Od(e) {
  return Pt(e) ? e : e.contextElement;
}
function Zr(e) {
  const t = Od(e);
  if (!jt(t)) return Rn(1);
  const n = t.getBoundingClientRect(),
    { width: r, height: i, $: s } = zg(t);
  let o = (s ? fl(n.width) : n.width) / r,
    u = (s ? fl(n.height) : n.height) / i;
  return (
    (!o || !Number.isFinite(o)) && (o = 1),
    (!u || !Number.isFinite(u)) && (u = 1),
    { x: o, y: u }
  );
}
const CS = Rn(0);
function Bg(e) {
  const t = qe(e);
  return !Ld() || !t.visualViewport
    ? CS
    : { x: t.visualViewport.offsetLeft, y: t.visualViewport.offsetTop };
}
function TS(e, t, n) {
  return t === void 0 && (t = !1), !n || (t && n !== qe(e)) ? !1 : t;
}
function pr(e, t, n, r) {
  t === void 0 && (t = !1), n === void 0 && (n = !1);
  const i = e.getBoundingClientRect(),
    s = Od(e);
  let o = Rn(1);
  t && (r ? Pt(r) && (o = Zr(r)) : (o = Zr(e)));
  const u = TS(s, n, r) ? Bg(s) : Rn(0);
  let a = (i.left + u.x) / o.x,
    d = (i.top + u.y) / o.y,
    p = i.width / o.x,
    l = i.height / o.y;
  if (s) {
    const c = qe(s),
      f = r && Pt(r) ? qe(r) : r;
    let m = c,
      v = ec(m);
    for (; v && r && f !== m; ) {
      const w = Zr(v),
        h = v.getBoundingClientRect(),
        g = At(v),
        y = h.left + (v.clientLeft + parseFloat(g.paddingLeft)) * w.x,
        x = h.top + (v.clientTop + parseFloat(g.paddingTop)) * w.y;
      (a *= w.x),
        (d *= w.y),
        (p *= w.x),
        (l *= w.y),
        (a += y),
        (d += x),
        (m = qe(v)),
        (v = ec(m));
    }
  }
  return hl({ width: p, height: l, x: a, y: d });
}
function ES(e) {
  let { elements: t, rect: n, offsetParent: r, strategy: i } = e;
  const s = i === "fixed",
    o = Ft(r),
    u = t ? Bl(t.floating) : !1;
  if (r === o || (u && s)) return n;
  let a = { scrollLeft: 0, scrollTop: 0 },
    d = Rn(1);
  const p = Rn(0),
    l = jt(r);
  if (
    (l || (!l && !s)) &&
    ((hi(r) !== "body" || Bs(o)) && (a = Hl(r)), jt(r))
  ) {
    const c = pr(r);
    (d = Zr(r)), (p.x = c.x + r.clientLeft), (p.y = c.y + r.clientTop);
  }
  return {
    width: n.width * d.x,
    height: n.height * d.y,
    x: n.x * d.x - a.scrollLeft * d.x + p.x,
    y: n.y * d.y - a.scrollTop * d.y + p.y,
  };
}
function PS(e) {
  return Array.from(e.getClientRects());
}
function tc(e, t) {
  const n = Hl(e).scrollLeft;
  return t ? t.left + n : pr(Ft(e)).left + n;
}
function AS(e) {
  const t = Ft(e),
    n = Hl(e),
    r = e.ownerDocument.body,
    i = ir(t.scrollWidth, t.clientWidth, r.scrollWidth, r.clientWidth),
    s = ir(t.scrollHeight, t.clientHeight, r.scrollHeight, r.clientHeight);
  let o = -n.scrollLeft + tc(e);
  const u = -n.scrollTop;
  return (
    At(r).direction === "rtl" && (o += ir(t.clientWidth, r.clientWidth) - i),
    { width: i, height: s, x: o, y: u }
  );
}
function kS(e, t) {
  const n = qe(e),
    r = Ft(e),
    i = n.visualViewport;
  let s = r.clientWidth,
    o = r.clientHeight,
    u = 0,
    a = 0;
  if (i) {
    (s = i.width), (o = i.height);
    const d = Ld();
    (!d || (d && t === "fixed")) && ((u = i.offsetLeft), (a = i.offsetTop));
  }
  return { width: s, height: o, x: u, y: a };
}
function MS(e, t) {
  const n = pr(e, !0, t === "fixed"),
    r = n.top + e.clientTop,
    i = n.left + e.clientLeft,
    s = jt(e) ? Zr(e) : Rn(1),
    o = e.clientWidth * s.x,
    u = e.clientHeight * s.y,
    a = i * s.x,
    d = r * s.y;
  return { width: o, height: u, x: a, y: d };
}
function wh(e, t, n) {
  let r;
  if (t === "viewport") r = kS(e, n);
  else if (t === "document") r = AS(Ft(e));
  else if (Pt(t)) r = MS(t, n);
  else {
    const i = Bg(e);
    r = { ...t, x: t.x - i.x, y: t.y - i.y };
  }
  return hl(r);
}
function Hg(e, t) {
  const n = Vn(e);
  return n === t || !Pt(n) || ui(n)
    ? !1
    : At(n).position === "fixed" || Hg(n, t);
}
function bS(e, t) {
  const n = t.get(e);
  if (n) return n;
  let r = Ms(e, [], !1).filter((u) => Pt(u) && hi(u) !== "body"),
    i = null;
  const s = At(e).position === "fixed";
  let o = s ? Vn(e) : e;
  for (; Pt(o) && !ui(o); ) {
    const u = At(o),
      a = bd(o);
    !a && u.position === "fixed" && (i = null),
      (
        s
          ? !a && !i
          : (!a &&
              u.position === "static" &&
              !!i &&
              ["absolute", "fixed"].includes(i.position)) ||
            (Bs(o) && !a && Hg(e, o))
      )
        ? (r = r.filter((p) => p !== o))
        : (i = u),
      (o = Vn(o));
  }
  return t.set(e, r), r;
}
function LS(e) {
  let { element: t, boundary: n, rootBoundary: r, strategy: i } = e;
  const o = [
      ...(n === "clippingAncestors"
        ? Bl(t)
          ? []
          : bS(t, this._c)
        : [].concat(n)),
      r,
    ],
    u = o[0],
    a = o.reduce((d, p) => {
      const l = wh(t, p, i);
      return (
        (d.top = ir(l.top, d.top)),
        (d.right = li(l.right, d.right)),
        (d.bottom = li(l.bottom, d.bottom)),
        (d.left = ir(l.left, d.left)),
        d
      );
    }, wh(t, u, i));
  return {
    width: a.right - a.left,
    height: a.bottom - a.top,
    x: a.left,
    y: a.top,
  };
}
function OS(e) {
  const { width: t, height: n } = zg(e);
  return { width: t, height: n };
}
function DS(e, t, n) {
  const r = jt(t),
    i = Ft(t),
    s = n === "fixed",
    o = pr(e, !0, s, t);
  let u = { scrollLeft: 0, scrollTop: 0 };
  const a = Rn(0);
  if (r || (!r && !s))
    if (((hi(t) !== "body" || Bs(i)) && (u = Hl(t)), r)) {
      const f = pr(t, !0, s, t);
      (a.x = f.x + t.clientLeft), (a.y = f.y + t.clientTop);
    } else i && (a.x = tc(i));
  let d = 0,
    p = 0;
  if (i && !r && !s) {
    const f = i.getBoundingClientRect();
    (p = f.top + u.scrollTop), (d = f.left + u.scrollLeft - tc(i, f));
  }
  const l = o.left + u.scrollLeft - a.x - d,
    c = o.top + u.scrollTop - a.y - p;
  return { x: l, y: c, width: o.width, height: o.height };
}
function ja(e) {
  return At(e).position === "static";
}
function xh(e, t) {
  if (!jt(e) || At(e).position === "fixed") return null;
  if (t) return t(e);
  let n = e.offsetParent;
  return Ft(e) === n && (n = n.ownerDocument.body), n;
}
function $g(e, t) {
  const n = qe(e);
  if (Bl(e)) return n;
  if (!jt(e)) {
    let i = Vn(e);
    for (; i && !ui(i); ) {
      if (Pt(i) && !ja(i)) return i;
      i = Vn(i);
    }
    return n;
  }
  let r = xh(e, t);
  for (; r && SS(r) && ja(r); ) r = xh(r, t);
  return r && ui(r) && ja(r) && !bd(r) ? n : r || _S(e) || n;
}
const RS = async function (e) {
  const t = this.getOffsetParent || $g,
    n = this.getDimensions,
    r = await n(e.floating);
  return {
    reference: DS(e.reference, await t(e.floating), e.strategy),
    floating: { x: 0, y: 0, width: r.width, height: r.height },
  };
};
function VS(e) {
  return At(e).direction === "rtl";
}
const IS = {
  convertOffsetParentRelativeRectToViewportRelativeRect: ES,
  getDocumentElement: Ft,
  getClippingRect: LS,
  getOffsetParent: $g,
  getElementRects: RS,
  getClientRects: PS,
  getDimensions: OS,
  getScale: Zr,
  isElement: Pt,
  isRTL: VS,
};
function NS(e, t) {
  let n = null,
    r;
  const i = Ft(e);
  function s() {
    var u;
    clearTimeout(r), (u = n) == null || u.disconnect(), (n = null);
  }
  function o(u, a) {
    u === void 0 && (u = !1), a === void 0 && (a = 1), s();
    const { left: d, top: p, width: l, height: c } = e.getBoundingClientRect();
    if ((u || t(), !l || !c)) return;
    const f = go(p),
      m = go(i.clientWidth - (d + l)),
      v = go(i.clientHeight - (p + c)),
      w = go(d),
      g = {
        rootMargin: -f + "px " + -m + "px " + -v + "px " + -w + "px",
        threshold: ir(0, li(1, a)) || 1,
      };
    let y = !0;
    function x(S) {
      const T = S[0].intersectionRatio;
      if (T !== a) {
        if (!y) return o();
        T
          ? o(!1, T)
          : (r = setTimeout(() => {
              o(!1, 1e-7);
            }, 1e3));
      }
      y = !1;
    }
    try {
      n = new IntersectionObserver(x, { ...g, root: i.ownerDocument });
    } catch {
      n = new IntersectionObserver(x, g);
    }
    n.observe(e);
  }
  return o(!0), s;
}
function jS(e, t, n, r) {
  r === void 0 && (r = {});
  const {
      ancestorScroll: i = !0,
      ancestorResize: s = !0,
      elementResize: o = typeof ResizeObserver == "function",
      layoutShift: u = typeof IntersectionObserver == "function",
      animationFrame: a = !1,
    } = r,
    d = Od(e),
    p = i || s ? [...(d ? Ms(d) : []), ...Ms(t)] : [];
  p.forEach((h) => {
    i && h.addEventListener("scroll", n, { passive: !0 }),
      s && h.addEventListener("resize", n);
  });
  const l = d && u ? NS(d, n) : null;
  let c = -1,
    f = null;
  o &&
    ((f = new ResizeObserver((h) => {
      let [g] = h;
      g &&
        g.target === d &&
        f &&
        (f.unobserve(t),
        cancelAnimationFrame(c),
        (c = requestAnimationFrame(() => {
          var y;
          (y = f) == null || y.observe(t);
        }))),
        n();
    })),
    d && !a && f.observe(d),
    f.observe(t));
  let m,
    v = a ? pr(e) : null;
  a && w();
  function w() {
    const h = pr(e);
    v &&
      (h.x !== v.x ||
        h.y !== v.y ||
        h.width !== v.width ||
        h.height !== v.height) &&
      n(),
      (v = h),
      (m = requestAnimationFrame(w));
  }
  return (
    n(),
    () => {
      var h;
      p.forEach((g) => {
        i && g.removeEventListener("scroll", n),
          s && g.removeEventListener("resize", n);
      }),
        l == null || l(),
        (h = f) == null || h.disconnect(),
        (f = null),
        a && cancelAnimationFrame(m);
    }
  );
}
const FS = wS,
  zS = xS,
  BS = vS,
  HS = gS,
  Sh = (e, t, n) => {
    const r = new Map(),
      i = { platform: IS, ...n },
      s = { ...i.platform, _c: r };
    return mS(e, t, { ...i, platform: s });
  };
/*
 * React Tooltip
 * {@link https://github.com/ReactTooltip/react-tooltip}
 * @copyright ReactTooltip Team
 * @license MIT
 */ const $S = "react-tooltip-core-styles",
  GS = "react-tooltip-base-styles",
  _h = { core: !1, base: !1 };
function Ch({ css: e, id: t = GS, type: n = "base", ref: r }) {
  var i, s;
  if (
    !e ||
    typeof document > "u" ||
    _h[n] ||
    (n === "core" &&
      typeof process < "u" &&
      !(
        (i = process == null ? void 0 : process.env) === null || i === void 0
      ) &&
      i.REACT_TOOLTIP_DISABLE_CORE_STYLES) ||
    (n !== "base" &&
      typeof process < "u" &&
      !(
        (s = process == null ? void 0 : process.env) === null || s === void 0
      ) &&
      s.REACT_TOOLTIP_DISABLE_BASE_STYLES)
  )
    return;
  n === "core" && (t = $S), r || (r = {});
  const { insertAt: o } = r;
  if (document.getElementById(t)) return;
  const u = document.head || document.getElementsByTagName("head")[0],
    a = document.createElement("style");
  (a.id = t),
    (a.type = "text/css"),
    o === "top" && u.firstChild
      ? u.insertBefore(a, u.firstChild)
      : u.appendChild(a),
    a.styleSheet
      ? (a.styleSheet.cssText = e)
      : a.appendChild(document.createTextNode(e)),
    (_h[n] = !0);
}
const Th = async ({
    elementReference: e = null,
    tooltipReference: t = null,
    tooltipArrowReference: n = null,
    place: r = "top",
    offset: i = 10,
    strategy: s = "absolute",
    middlewares: o = [
      FS(Number(i)),
      BS({ fallbackAxisSideDirection: "start" }),
      zS({ padding: 5 }),
    ],
    border: u,
  }) => {
    if (!e) return { tooltipStyles: {}, tooltipArrowStyles: {}, place: r };
    if (t === null)
      return { tooltipStyles: {}, tooltipArrowStyles: {}, place: r };
    const a = o;
    return n
      ? (a.push(HS({ element: n, padding: 5 })),
        Sh(e, t, { placement: r, strategy: s, middleware: a }).then(
          ({ x: d, y: p, placement: l, middlewareData: c }) => {
            var f, m;
            const v = { left: `${d}px`, top: `${p}px`, border: u },
              { x: w, y: h } =
                (f = c.arrow) !== null && f !== void 0 ? f : { x: 0, y: 0 },
              g =
                (m = {
                  top: "bottom",
                  right: "left",
                  bottom: "top",
                  left: "right",
                }[l.split("-")[0]]) !== null && m !== void 0
                  ? m
                  : "bottom",
              y = u && { borderBottom: u, borderRight: u };
            let x = 0;
            if (u) {
              const S = `${u}`.match(/(\d+)px/);
              x = S != null && S[1] ? Number(S[1]) : 1;
            }
            return {
              tooltipStyles: v,
              tooltipArrowStyles: {
                left: w != null ? `${w}px` : "",
                top: h != null ? `${h}px` : "",
                right: "",
                bottom: "",
                ...y,
                [g]: `-${4 + x}px`,
              },
              place: l,
            };
          }
        ))
      : Sh(e, t, { placement: "bottom", strategy: s, middleware: a }).then(
          ({ x: d, y: p, placement: l }) => ({
            tooltipStyles: { left: `${d}px`, top: `${p}px` },
            tooltipArrowStyles: {},
            place: l,
          })
        );
  },
  Eh = (e, t) =>
    !("CSS" in window && "supports" in window.CSS) || window.CSS.supports(e, t),
  Ph = (e, t, n) => {
    let r = null;
    const i = function (...s) {
      const o = () => {
        (r = null), n || e.apply(this, s);
      };
      n && !r && (e.apply(this, s), (r = setTimeout(o, t))),
        n || (r && clearTimeout(r), (r = setTimeout(o, t)));
    };
    return (
      (i.cancel = () => {
        r && (clearTimeout(r), (r = null));
      }),
      i
    );
  },
  Ah = (e) => e !== null && !Array.isArray(e) && typeof e == "object",
  nc = (e, t) => {
    if (e === t) return !0;
    if (Array.isArray(e) && Array.isArray(t))
      return e.length === t.length && e.every((i, s) => nc(i, t[s]));
    if (Array.isArray(e) !== Array.isArray(t)) return !1;
    if (!Ah(e) || !Ah(t)) return e === t;
    const n = Object.keys(e),
      r = Object.keys(t);
    return n.length === r.length && n.every((i) => nc(e[i], t[i]));
  },
  WS = (e) => {
    if (!(e instanceof HTMLElement || e instanceof SVGElement)) return !1;
    const t = getComputedStyle(e);
    return ["overflow", "overflow-x", "overflow-y"].some((n) => {
      const r = t.getPropertyValue(n);
      return r === "auto" || r === "scroll";
    });
  },
  kh = (e) => {
    if (!e) return null;
    let t = e.parentElement;
    for (; t; ) {
      if (WS(t)) return t;
      t = t.parentElement;
    }
    return document.scrollingElement || document.documentElement;
  },
  US = typeof window < "u" ? C.useLayoutEffect : C.useEffect,
  at = (e) => {
    e.current && (clearTimeout(e.current), (e.current = null));
  },
  KS = "DEFAULT_TOOLTIP_ID",
  YS = {
    anchorRefs: new Set(),
    activeAnchor: { current: null },
    attach: () => {},
    detach: () => {},
    setActiveAnchor: () => {},
  },
  XS = C.createContext({ getTooltipData: () => YS });
function Gg(e = KS) {
  return C.useContext(XS).getTooltipData(e);
}
var Er = {
    tooltip: "core-styles-module_tooltip__3vRRp",
    fixed: "core-styles-module_fixed__pcSol",
    arrow: "core-styles-module_arrow__cvMwQ",
    noArrow: "core-styles-module_noArrow__xock6",
    clickable: "core-styles-module_clickable__ZuTTB",
    show: "core-styles-module_show__Nt9eE",
    closing: "core-styles-module_closing__sGnxF",
  },
  Fa = {
    tooltip: "styles-module_tooltip__mnnfp",
    arrow: "styles-module_arrow__K0L3T",
    dark: "styles-module_dark__xNqje",
    light: "styles-module_light__Z6W-X",
    success: "styles-module_success__A2AKt",
    warning: "styles-module_warning__SCK0X",
    error: "styles-module_error__JvumD",
    info: "styles-module_info__BWdHW",
  };
const ZS = ({
    forwardRef: e,
    id: t,
    className: n,
    classNameArrow: r,
    variant: i = "dark",
    anchorId: s,
    anchorSelect: o,
    place: u = "top",
    offset: a = 10,
    events: d = ["hover"],
    openOnClick: p = !1,
    positionStrategy: l = "absolute",
    middlewares: c,
    wrapper: f,
    delayShow: m = 0,
    delayHide: v = 0,
    float: w = !1,
    hidden: h = !1,
    noArrow: g = !1,
    clickable: y = !1,
    closeOnEsc: x = !1,
    closeOnScroll: S = !1,
    closeOnResize: T = !1,
    openEvents: M,
    closeEvents: E,
    globalCloseEvents: k,
    imperativeModeOnly: P,
    style: O,
    position: V,
    afterShow: R,
    afterHide: N,
    disableTooltip: W,
    content: Y,
    contentWrapperRef: $,
    isOpen: A,
    defaultIsOpen: L = !1,
    setIsOpen: D,
    activeAnchor: z,
    setActiveAnchor: Z,
    border: zt,
    opacity: it,
    arrowColor: an,
    role: gt = "tooltip",
  }) => {
    var kt;
    const Re = C.useRef(null),
      gr = C.useRef(null),
      vt = C.useRef(null),
      un = C.useRef(null),
      mi = C.useRef(null),
      [cn, $l] = C.useState({
        tooltipStyles: {},
        tooltipArrowStyles: {},
        place: u,
      }),
      [Ue, Hs] = C.useState(!1),
      [Bn, Hn] = C.useState(!1),
      [oe, gi] = C.useState(null),
      vi = C.useRef(!1),
      yi = C.useRef(null),
      { anchorRefs: wi, setActiveAnchor: $s } = Gg(t),
      vr = C.useRef(!1),
      [dn, xi] = C.useState([]),
      $n = C.useRef(!1),
      yr = p || d.includes("click"),
      Si =
        yr ||
        (M == null ? void 0 : M.click) ||
        (M == null ? void 0 : M.dblclick) ||
        (M == null ? void 0 : M.mousedown),
      wr = M
        ? { ...M }
        : {
            mouseover: !0,
            focus: !0,
            mouseenter: !1,
            click: !1,
            dblclick: !1,
            mousedown: !1,
          };
    !M &&
      yr &&
      Object.assign(wr, {
        mouseenter: !1,
        focus: !1,
        mouseover: !1,
        click: !0,
      });
    const _i = E
      ? { ...E }
      : {
          mouseout: !0,
          blur: !0,
          mouseleave: !1,
          click: !1,
          dblclick: !1,
          mouseup: !1,
        };
    !E && yr && Object.assign(_i, { mouseleave: !1, blur: !1, mouseout: !1 });
    const yt = k
      ? { ...k }
      : {
          escape: x || !1,
          scroll: S || !1,
          resize: T || !1,
          clickOutsideAnchor: Si || !1,
        };
    P &&
      (Object.assign(wr, {
        mouseenter: !1,
        focus: !1,
        click: !1,
        dblclick: !1,
        mousedown: !1,
      }),
      Object.assign(_i, {
        mouseleave: !1,
        blur: !1,
        click: !1,
        dblclick: !1,
        mouseup: !1,
      }),
      Object.assign(yt, {
        escape: !1,
        scroll: !1,
        resize: !1,
        clickOutsideAnchor: !1,
      })),
      US(
        () => (
          ($n.current = !0),
          () => {
            $n.current = !1;
          }
        ),
        []
      );
    const he = (I) => {
      $n.current &&
        (I && Hn(!0),
        setTimeout(() => {
          $n.current && (D == null || D(I), A === void 0 && Hs(I));
        }, 10));
    };
    C.useEffect(() => {
      if (A === void 0) return () => null;
      A && Hn(!0);
      const I = setTimeout(() => {
        Hs(A);
      }, 10);
      return () => {
        clearTimeout(I);
      };
    }, [A]),
      C.useEffect(() => {
        if (Ue !== vi.current)
          if ((at(mi), (vi.current = Ue), Ue)) R == null || R();
          else {
            const I = ((H) => {
              const G = H.match(/^([\d.]+)(ms|s)$/);
              if (!G) return 0;
              const [, ge, Ae] = G;
              return Number(ge) * (Ae === "ms" ? 1 : 1e3);
            })(
              getComputedStyle(document.body).getPropertyValue(
                "--rt-transition-show-delay"
              )
            );
            mi.current = setTimeout(() => {
              Hn(!1), gi(null), N == null || N();
            }, I + 25);
          }
      }, [Ue]);
    const Gs = (I) => {
        $l((H) => (nc(H, I) ? H : I));
      },
      Ci = (I = m) => {
        at(vt),
          Bn
            ? he(!0)
            : (vt.current = setTimeout(() => {
                he(!0);
              }, I));
      },
      xr = (I = v) => {
        at(un),
          (un.current = setTimeout(() => {
            vr.current || he(!1);
          }, I));
      },
      Ti = (I) => {
        var H;
        if (!I) return;
        const G = (H = I.currentTarget) !== null && H !== void 0 ? H : I.target;
        if (!(G != null && G.isConnected))
          return Z(null), void $s({ current: null });
        m ? Ci() : he(!0), Z(G), $s({ current: G }), at(un);
      },
      Sr = () => {
        y ? xr(v || 100) : v ? xr() : he(!1), at(vt);
      },
      _r = ({ x: I, y: H }) => {
        var G;
        const ge = {
          getBoundingClientRect: () => ({
            x: I,
            y: H,
            width: 0,
            height: 0,
            top: H,
            left: I,
            right: I,
            bottom: H,
          }),
        };
        Th({
          place:
            (G = oe == null ? void 0 : oe.place) !== null && G !== void 0
              ? G
              : u,
          offset: a,
          elementReference: ge,
          tooltipReference: Re.current,
          tooltipArrowReference: gr.current,
          strategy: l,
          middlewares: c,
          border: zt,
        }).then((Ae) => {
          Gs(Ae);
        });
      },
      Cr = (I) => {
        if (!I) return;
        const H = I,
          G = { x: H.clientX, y: H.clientY };
        _r(G), (yi.current = G);
      },
      Ei = (I) => {
        var H;
        if (!Ue) return;
        const G = I.target;
        G.isConnected &&
          ((!((H = Re.current) === null || H === void 0) && H.contains(G)) ||
            [document.querySelector(`[id='${s}']`), ...dn].some((ge) =>
              ge == null ? void 0 : ge.contains(G)
            ) ||
            (he(!1), at(vt)));
      },
      Ws = Ph(Ti, 50, !0),
      we = Ph(Sr, 50, !0),
      st = (I) => {
        we.cancel(), Ws(I);
      },
      B = () => {
        Ws.cancel(), we();
      },
      K = C.useCallback(() => {
        var I, H;
        const G =
          (I = oe == null ? void 0 : oe.position) !== null && I !== void 0
            ? I
            : V;
        G
          ? _r(G)
          : w
          ? yi.current && _r(yi.current)
          : z != null &&
            z.isConnected &&
            Th({
              place:
                (H = oe == null ? void 0 : oe.place) !== null && H !== void 0
                  ? H
                  : u,
              offset: a,
              elementReference: z,
              tooltipReference: Re.current,
              tooltipArrowReference: gr.current,
              strategy: l,
              middlewares: c,
              border: zt,
            }).then((ge) => {
              $n.current && Gs(ge);
            });
      }, [
        Ue,
        z,
        Y,
        O,
        u,
        oe == null ? void 0 : oe.place,
        a,
        l,
        V,
        oe == null ? void 0 : oe.position,
        w,
      ]);
    C.useEffect(() => {
      var I, H;
      const G = new Set(wi);
      dn.forEach((J) => {
        (W != null && W(J)) || G.add({ current: J });
      });
      const ge = document.querySelector(`[id='${s}']`);
      ge && !(W != null && W(ge)) && G.add({ current: ge });
      const Ae = () => {
          he(!1);
        },
        Mt = kh(z),
        bt = kh(Re.current);
      yt.scroll &&
        (window.addEventListener("scroll", Ae),
        Mt == null || Mt.addEventListener("scroll", Ae),
        bt == null || bt.addEventListener("scroll", Ae));
      let Ve = null;
      yt.resize
        ? window.addEventListener("resize", Ae)
        : z &&
          Re.current &&
          (Ve = jS(z, Re.current, K, {
            ancestorResize: !0,
            elementResize: !0,
            layoutShift: !0,
          }));
      const ot = (J) => {
        J.key === "Escape" && he(!1);
      };
      yt.escape && window.addEventListener("keydown", ot),
        yt.clickOutsideAnchor && window.addEventListener("click", Ei);
      const ie = [],
        Pi = (J) => {
          (Ue && (J == null ? void 0 : J.target) === z) || Ti(J);
        },
        Ug = (J) => {
          Ue && (J == null ? void 0 : J.target) === z && Sr();
        },
        Dd = [
          "mouseover",
          "mouseout",
          "mouseenter",
          "mouseleave",
          "focus",
          "blur",
        ],
        Rd = ["click", "dblclick", "mousedown", "mouseup"];
      Object.entries(wr).forEach(([J, Bt]) => {
        Bt &&
          (Dd.includes(J)
            ? ie.push({ event: J, listener: st })
            : Rd.includes(J) && ie.push({ event: J, listener: Pi }));
      }),
        Object.entries(_i).forEach(([J, Bt]) => {
          Bt &&
            (Dd.includes(J)
              ? ie.push({ event: J, listener: B })
              : Rd.includes(J) && ie.push({ event: J, listener: Ug }));
        }),
        w && ie.push({ event: "pointermove", listener: Cr });
      const Vd = () => {
          vr.current = !0;
        },
        Id = () => {
          (vr.current = !1), Sr();
        };
      return (
        y &&
          !Si &&
          ((I = Re.current) === null ||
            I === void 0 ||
            I.addEventListener("mouseenter", Vd),
          (H = Re.current) === null ||
            H === void 0 ||
            H.addEventListener("mouseleave", Id)),
        ie.forEach(({ event: J, listener: Bt }) => {
          G.forEach((Gl) => {
            var Ai;
            (Ai = Gl.current) === null ||
              Ai === void 0 ||
              Ai.addEventListener(J, Bt);
          });
        }),
        () => {
          var J, Bt;
          yt.scroll &&
            (window.removeEventListener("scroll", Ae),
            Mt == null || Mt.removeEventListener("scroll", Ae),
            bt == null || bt.removeEventListener("scroll", Ae)),
            yt.resize
              ? window.removeEventListener("resize", Ae)
              : Ve == null || Ve(),
            yt.clickOutsideAnchor && window.removeEventListener("click", Ei),
            yt.escape && window.removeEventListener("keydown", ot),
            y &&
              !Si &&
              ((J = Re.current) === null ||
                J === void 0 ||
                J.removeEventListener("mouseenter", Vd),
              (Bt = Re.current) === null ||
                Bt === void 0 ||
                Bt.removeEventListener("mouseleave", Id)),
            ie.forEach(({ event: Gl, listener: Ai }) => {
              G.forEach((Kg) => {
                var Wl;
                (Wl = Kg.current) === null ||
                  Wl === void 0 ||
                  Wl.removeEventListener(Gl, Ai);
              });
            });
        }
      );
    }, [z, K, Bn, wi, dn, M, E, k, yr, m, v]),
      C.useEffect(() => {
        var I, H;
        let G =
          (H =
            (I = oe == null ? void 0 : oe.anchorSelect) !== null && I !== void 0
              ? I
              : o) !== null && H !== void 0
            ? H
            : "";
        !G && t && (G = `[data-tooltip-id='${t.replace(/'/g, "\\'")}']`);
        const ge = new MutationObserver((Ae) => {
          const Mt = [],
            bt = [];
          Ae.forEach((Ve) => {
            if (
              (Ve.type === "attributes" &&
                Ve.attributeName === "data-tooltip-id" &&
                (Ve.target.getAttribute("data-tooltip-id") === t
                  ? Mt.push(Ve.target)
                  : Ve.oldValue === t && bt.push(Ve.target)),
              Ve.type === "childList")
            ) {
              if (z) {
                const ot = [...Ve.removedNodes].filter(
                  (ie) => ie.nodeType === 1
                );
                if (G)
                  try {
                    bt.push(...ot.filter((ie) => ie.matches(G))),
                      bt.push(
                        ...ot.flatMap((ie) => [...ie.querySelectorAll(G)])
                      );
                  } catch {}
                ot.some((ie) => {
                  var Pi;
                  return (
                    !!(
                      !(
                        (Pi = ie == null ? void 0 : ie.contains) === null ||
                        Pi === void 0
                      ) && Pi.call(ie, z)
                    ) && (Hn(!1), he(!1), Z(null), at(vt), at(un), !0)
                  );
                });
              }
              if (G)
                try {
                  const ot = [...Ve.addedNodes].filter(
                    (ie) => ie.nodeType === 1
                  );
                  Mt.push(...ot.filter((ie) => ie.matches(G))),
                    Mt.push(...ot.flatMap((ie) => [...ie.querySelectorAll(G)]));
                } catch {}
            }
          }),
            (Mt.length || bt.length) &&
              xi((Ve) => [...Ve.filter((ot) => !bt.includes(ot)), ...Mt]);
        });
        return (
          ge.observe(document.body, {
            childList: !0,
            subtree: !0,
            attributes: !0,
            attributeFilter: ["data-tooltip-id"],
            attributeOldValue: !0,
          }),
          () => {
            ge.disconnect();
          }
        );
      }, [t, o, oe == null ? void 0 : oe.anchorSelect, z]),
      C.useEffect(() => {
        K();
      }, [K]),
      C.useEffect(() => {
        if (!($ != null && $.current)) return () => null;
        const I = new ResizeObserver(() => {
          setTimeout(() => K());
        });
        return (
          I.observe($.current),
          () => {
            I.disconnect();
          }
        );
      }, [Y, $ == null ? void 0 : $.current]),
      C.useEffect(() => {
        var I;
        const H = document.querySelector(`[id='${s}']`),
          G = [...dn, H];
        (z && G.includes(z)) || Z((I = dn[0]) !== null && I !== void 0 ? I : H);
      }, [s, dn, z]),
      C.useEffect(
        () => (
          L && he(!0),
          () => {
            at(vt), at(un);
          }
        ),
        []
      ),
      C.useEffect(() => {
        var I;
        let H =
          (I = oe == null ? void 0 : oe.anchorSelect) !== null && I !== void 0
            ? I
            : o;
        if (
          (!H && t && (H = `[data-tooltip-id='${t.replace(/'/g, "\\'")}']`), H)
        )
          try {
            const G = Array.from(document.querySelectorAll(H));
            xi(G);
          } catch {
            xi([]);
          }
      }, [t, o, oe == null ? void 0 : oe.anchorSelect]),
      C.useEffect(() => {
        vt.current && (at(vt), Ci(m));
      }, [m]);
    const Ke =
        (kt = oe == null ? void 0 : oe.content) !== null && kt !== void 0
          ? kt
          : Y,
      Gn = Ue && Object.keys(cn.tooltipStyles).length > 0;
    return (
      C.useImperativeHandle(e, () => ({
        open: (I) => {
          if (I != null && I.anchorSelect)
            try {
              document.querySelector(I.anchorSelect);
            } catch {
              return void console.warn(
                `[react-tooltip] "${I.anchorSelect}" is not a valid CSS selector`
              );
            }
          gi(I ?? null), I != null && I.delay ? Ci(I.delay) : he(!0);
        },
        close: (I) => {
          I != null && I.delay ? xr(I.delay) : he(!1);
        },
        activeAnchor: z,
        place: cn.place,
        isOpen: !!(Bn && !h && Ke && Gn),
      })),
      Bn && !h && Ke
        ? ee.createElement(
            f,
            {
              id: t,
              role: gt,
              className: ii(
                "react-tooltip",
                Er.tooltip,
                Fa.tooltip,
                Fa[i],
                n,
                `react-tooltip__place-${cn.place}`,
                Er[Gn ? "show" : "closing"],
                Gn ? "react-tooltip__show" : "react-tooltip__closing",
                l === "fixed" && Er.fixed,
                y && Er.clickable
              ),
              onTransitionEnd: (I) => {
                at(mi),
                  Ue ||
                    I.propertyName !== "opacity" ||
                    (Hn(!1), gi(null), N == null || N());
              },
              style: {
                ...O,
                ...cn.tooltipStyles,
                opacity: it !== void 0 && Gn ? it : void 0,
              },
              ref: Re,
            },
            Ke,
            ee.createElement(f, {
              className: ii(
                "react-tooltip-arrow",
                Er.arrow,
                Fa.arrow,
                r,
                g && Er.noArrow
              ),
              style: {
                ...cn.tooltipArrowStyles,
                background: an
                  ? `linear-gradient(to right bottom, transparent 50%, ${an} 50%)`
                  : void 0,
              },
              ref: gr,
            })
          )
        : null
    );
  },
  QS = ({ content: e }) =>
    ee.createElement("span", { dangerouslySetInnerHTML: { __html: e } }),
  qS = ee.forwardRef(
    (
      {
        id: e,
        anchorId: t,
        anchorSelect: n,
        content: r,
        html: i,
        render: s,
        className: o,
        classNameArrow: u,
        variant: a = "dark",
        place: d = "top",
        offset: p = 10,
        wrapper: l = "div",
        children: c = null,
        events: f = ["hover"],
        openOnClick: m = !1,
        positionStrategy: v = "absolute",
        middlewares: w,
        delayShow: h = 0,
        delayHide: g = 0,
        float: y = !1,
        hidden: x = !1,
        noArrow: S = !1,
        clickable: T = !1,
        closeOnEsc: M = !1,
        closeOnScroll: E = !1,
        closeOnResize: k = !1,
        openEvents: P,
        closeEvents: O,
        globalCloseEvents: V,
        imperativeModeOnly: R = !1,
        style: N,
        position: W,
        isOpen: Y,
        defaultIsOpen: $ = !1,
        disableStyleInjection: A = !1,
        border: L,
        opacity: D,
        arrowColor: z,
        setIsOpen: Z,
        afterShow: zt,
        afterHide: it,
        disableTooltip: an,
        role: gt = "tooltip",
      },
      kt
    ) => {
      const [Re, gr] = C.useState(r),
        [vt, un] = C.useState(i),
        [mi, cn] = C.useState(d),
        [$l, Ue] = C.useState(a),
        [Hs, Bn] = C.useState(p),
        [Hn, oe] = C.useState(h),
        [gi, vi] = C.useState(g),
        [yi, wi] = C.useState(y),
        [$s, vr] = C.useState(x),
        [dn, xi] = C.useState(l),
        [$n, yr] = C.useState(f),
        [Si, wr] = C.useState(v),
        [_i, yt] = C.useState(null),
        [he, Gs] = C.useState(null),
        Ci = C.useRef(A),
        { anchorRefs: xr, activeAnchor: Ti } = Gg(e),
        Sr = (we) =>
          we == null
            ? void 0
            : we.getAttributeNames().reduce((st, B) => {
                var K;
                return (
                  B.startsWith("data-tooltip-") &&
                    (st[B.replace(/^data-tooltip-/, "")] =
                      (K = we == null ? void 0 : we.getAttribute(B)) !== null &&
                      K !== void 0
                        ? K
                        : null),
                  st
                );
              }, {}),
        _r = (we) => {
          const st = {
            place: (B) => {
              var K;
              cn((K = B) !== null && K !== void 0 ? K : d);
            },
            content: (B) => {
              gr(B ?? r);
            },
            html: (B) => {
              un(B ?? i);
            },
            variant: (B) => {
              var K;
              Ue((K = B) !== null && K !== void 0 ? K : a);
            },
            offset: (B) => {
              Bn(B === null ? p : Number(B));
            },
            wrapper: (B) => {
              var K;
              xi((K = B) !== null && K !== void 0 ? K : l);
            },
            events: (B) => {
              const K = B == null ? void 0 : B.split(" ");
              yr(K ?? f);
            },
            "position-strategy": (B) => {
              var K;
              wr((K = B) !== null && K !== void 0 ? K : v);
            },
            "delay-show": (B) => {
              oe(B === null ? h : Number(B));
            },
            "delay-hide": (B) => {
              vi(B === null ? g : Number(B));
            },
            float: (B) => {
              wi(B === null ? y : B === "true");
            },
            hidden: (B) => {
              vr(B === null ? x : B === "true");
            },
            "class-name": (B) => {
              yt(B);
            },
          };
          Object.values(st).forEach((B) => B(null)),
            Object.entries(we).forEach(([B, K]) => {
              var Ke;
              (Ke = st[B]) === null || Ke === void 0 || Ke.call(st, K);
            });
        };
      C.useEffect(() => {
        gr(r);
      }, [r]),
        C.useEffect(() => {
          un(i);
        }, [i]),
        C.useEffect(() => {
          cn(d);
        }, [d]),
        C.useEffect(() => {
          Ue(a);
        }, [a]),
        C.useEffect(() => {
          Bn(p);
        }, [p]),
        C.useEffect(() => {
          oe(h);
        }, [h]),
        C.useEffect(() => {
          vi(g);
        }, [g]),
        C.useEffect(() => {
          wi(y);
        }, [y]),
        C.useEffect(() => {
          vr(x);
        }, [x]),
        C.useEffect(() => {
          wr(v);
        }, [v]),
        C.useEffect(() => {
          Ci.current !== A &&
            console.warn(
              "[react-tooltip] Do not change `disableStyleInjection` dynamically."
            );
        }, [A]),
        C.useEffect(() => {
          typeof window < "u" &&
            window.dispatchEvent(
              new CustomEvent("react-tooltip-inject-styles", {
                detail: { disableCore: A === "core", disableBase: A },
              })
            );
        }, []),
        C.useEffect(() => {
          var we;
          const st = new Set(xr);
          let B = n;
          if (
            (!B && e && (B = `[data-tooltip-id='${e.replace(/'/g, "\\'")}']`),
            B)
          )
            try {
              document.querySelectorAll(B).forEach((H) => {
                st.add({ current: H });
              });
            } catch {
              console.warn(
                `[react-tooltip] "${B}" is not a valid CSS selector`
              );
            }
          const K = document.querySelector(`[id='${t}']`);
          if ((K && st.add({ current: K }), !st.size)) return () => null;
          const Ke = (we = he ?? K) !== null && we !== void 0 ? we : Ti.current,
            Gn = new MutationObserver((H) => {
              H.forEach((G) => {
                var ge;
                if (
                  !Ke ||
                  G.type !== "attributes" ||
                  !(
                    !((ge = G.attributeName) === null || ge === void 0) &&
                    ge.startsWith("data-tooltip-")
                  )
                )
                  return;
                const Ae = Sr(Ke);
                _r(Ae);
              });
            }),
            I = { attributes: !0, childList: !1, subtree: !1 };
          if (Ke) {
            const H = Sr(Ke);
            _r(H), Gn.observe(Ke, I);
          }
          return () => {
            Gn.disconnect();
          };
        }, [xr, Ti, he, t, n]),
        C.useEffect(() => {
          N != null &&
            N.border &&
            console.warn(
              "[react-tooltip] Do not set `style.border`. Use `border` prop instead."
            ),
            L &&
              !Eh("border", `${L}`) &&
              console.warn(`[react-tooltip] "${L}" is not a valid \`border\`.`),
            N != null &&
              N.opacity &&
              console.warn(
                "[react-tooltip] Do not set `style.opacity`. Use `opacity` prop instead."
              ),
            D &&
              !Eh("opacity", `${D}`) &&
              console.warn(
                `[react-tooltip] "${D}" is not a valid \`opacity\`.`
              );
        }, []);
      let Cr = c;
      const Ei = C.useRef(null);
      if (s) {
        const we = s({
          content:
            (he == null ? void 0 : he.getAttribute("data-tooltip-content")) ||
            Re ||
            null,
          activeAnchor: he,
        });
        Cr = we
          ? ee.createElement(
              "div",
              { ref: Ei, className: "react-tooltip-content-wrapper" },
              we
            )
          : null;
      } else Re && (Cr = Re);
      vt && (Cr = ee.createElement(QS, { content: vt }));
      const Ws = {
        forwardRef: kt,
        id: e,
        anchorId: t,
        anchorSelect: n,
        className: ii(o, _i),
        classNameArrow: u,
        content: Cr,
        contentWrapperRef: Ei,
        place: mi,
        variant: $l,
        offset: Hs,
        wrapper: dn,
        events: $n,
        openOnClick: m,
        positionStrategy: Si,
        middlewares: w,
        delayShow: Hn,
        delayHide: gi,
        float: yi,
        hidden: $s,
        noArrow: S,
        clickable: T,
        closeOnEsc: M,
        closeOnScroll: E,
        closeOnResize: k,
        openEvents: P,
        closeEvents: O,
        globalCloseEvents: V,
        imperativeModeOnly: R,
        style: N,
        position: W,
        isOpen: Y,
        defaultIsOpen: $,
        border: L,
        opacity: D,
        arrowColor: z,
        setIsOpen: Z,
        afterShow: zt,
        afterHide: it,
        disableTooltip: an,
        activeAnchor: he,
        setActiveAnchor: (we) => Gs(we),
        role: gt,
      };
      return ee.createElement(ZS, { ...Ws });
    }
  );
typeof window < "u" &&
  window.addEventListener("react-tooltip-inject-styles", (e) => {
    e.detail.disableCore ||
      Ch({
        css: ":root{--rt-color-white:#fff;--rt-color-dark:#222;--rt-color-success:#8dc572;--rt-color-error:#be6464;--rt-color-warning:#f0ad4e;--rt-color-info:#337ab7;--rt-opacity:0.9;--rt-transition-show-delay:0.15s;--rt-transition-closing-delay:0.15s}.core-styles-module_tooltip__3vRRp{position:absolute;top:0;left:0;pointer-events:none;opacity:0;will-change:opacity}.core-styles-module_fixed__pcSol{position:fixed}.core-styles-module_arrow__cvMwQ{position:absolute;background:inherit}.core-styles-module_noArrow__xock6{display:none}.core-styles-module_clickable__ZuTTB{pointer-events:auto}.core-styles-module_show__Nt9eE{opacity:var(--rt-opacity);transition:opacity var(--rt-transition-show-delay)ease-out}.core-styles-module_closing__sGnxF{opacity:0;transition:opacity var(--rt-transition-closing-delay)ease-in}",
        type: "core",
      }),
      e.detail.disableBase ||
        Ch({
          css: `
.styles-module_tooltip__mnnfp{padding:8px 16px;border-radius:3px;font-size:90%;width:max-content}.styles-module_arrow__K0L3T{width:8px;height:8px}[class*='react-tooltip__place-top']>.styles-module_arrow__K0L3T{transform:rotate(45deg)}[class*='react-tooltip__place-right']>.styles-module_arrow__K0L3T{transform:rotate(135deg)}[class*='react-tooltip__place-bottom']>.styles-module_arrow__K0L3T{transform:rotate(225deg)}[class*='react-tooltip__place-left']>.styles-module_arrow__K0L3T{transform:rotate(315deg)}.styles-module_dark__xNqje{background:var(--rt-color-dark);color:var(--rt-color-white)}.styles-module_light__Z6W-X{background-color:var(--rt-color-white);color:var(--rt-color-dark)}.styles-module_success__A2AKt{background-color:var(--rt-color-success);color:var(--rt-color-white)}.styles-module_warning__SCK0X{background-color:var(--rt-color-warning);color:var(--rt-color-white)}.styles-module_error__JvumD{background-color:var(--rt-color-error);color:var(--rt-color-white)}.styles-module_info__BWdHW{background-color:var(--rt-color-info);color:var(--rt-color-white)}`,
          type: "base",
        });
  });
const JS = [
    {
      ESC: "4.0419rem",
      1: "4.0419rem",
      2: "4.0419rem",
      3: "4.0419rem",
      4: "4.0419rem",
      5: "4.0419rem",
      6: "4.0419rem",
      7: "4.0419rem",
      8: "4.0419rem",
      9: "4.0419rem",
      0: "4.0419rem",
      "-": "4.0419rem",
      "=": "4.0419rem",
      Backspace: "5.36rem",
    },
    {
      Tab: "5.4479rem",
      Q: "4.0419rem",
      W: "4.0419rem",
      E: "4.0419rem",
      R: "4.0419rem",
      T: "4.0419rem",
      Y: "4.0419rem",
      U: "4.0419rem",
      I: "4.0419rem",
      O: "4.0419rem",
      P: "4.0419rem",
      "[": "4.0419rem",
      "]": "4.0419rem",
      "/": "4.0419rem",
    },
    {
      "Caps Lock": "6.8537rem",
      A: "4.0419rem",
      S: "4.0419rem",
      D: "4.0419rem",
      F: "4.0419rem",
      G: "4.0419rem",
      H: "4.0419rem",
      J: "4.0419rem",
      K: "4.0419rem",
      L: "4.0419rem",
      ";": "4.0419rem",
      "‘": "4.0419rem",
      Enter: "6.9416rem",
    },
    {
      Shift: "9.1383rem",
      Z: "4.0419rem",
      X: "4.0419rem",
      C: "4.0419rem",
      V: "4.0419rem",
      B: "4.0419rem",
      N: "4.0419rem",
      M: "4.0419rem",
      "<": "4.0419rem",
      ">": "4.0419rem",
      "?": "4.0419rem",
      RShift: "9.0505rem",
    },
    {
      Ctrl: "4.0419rem",
      Win: "4.0419rem",
      Alt: "4.0419rem",
      Space: "26.7121rem",
      RAlt: "6.45rem",
      fn: "4.0419rem",
      RCtrl: "10.9375rem",
    },
  ],
  pn = { E: "echo 'Hello, World!'", ESC: "exit the current mode" },
  e7 = "#75CC1652";
function t7() {
  const [e, t] = C.useState(Object.keys(pn)[0]),
    [n, r] = C.useState(null);
  return _.jsx(Ed, {
    children: _.jsxs("div", {
      className: "flex flex-col gap-y-2 p-3.5",
      children: [
        _.jsx(qS, {
          style: { backdropFilter: "blur(32.650001525878906px)" },
          className: "!p-0 !bg-[#07080D66] !rounded-xl",
          place: "right",
          id: "my-tooltip",
          children: _.jsxs("div", {
            className: "py-3 px-3",
            children: [
              _.jsxs("div", {
                className: "flex items-center gap-2",
                children: [
                  _.jsx("div", {
                    className:
                      "w-8 h-8  rounded border-[0.889px] flex items-center font-semibold  justify-center font-roboto bg-[#75CC1652] border-white/10",
                    children: n,
                  }),
                  _.jsxs("div", {
                    children: [
                      _.jsxs("p", {
                        className:
                          "font-roboto text-white font-semibold leading-[90%]",
                        children: [n, " Key"],
                      }),
                      _.jsx("p", {
                        className: "font-roboto text-white/50 text-sm",
                        children: "Keyboard Shortcut",
                      }),
                    ],
                  }),
                ],
              }),
              _.jsx("hr", {
                className: "my-2 border-[1.5px] border-[#ffffff12]",
              }),
              _.jsxs("div", {
                children: [
                  _.jsx("p", {
                    className:
                      "font-roboto text-white font-semibold leading-[90%]",
                    children: "Information",
                  }),
                  _.jsx("p", {
                    className: "font-roboto text-white/50 text-sm",
                    children: pn[n] || "No Information",
                  }),
                ],
              }),
            ],
          }),
        }),
        JS.map((i, s) =>
          _.jsx("div", {
            className: "flex gap-x-[.3513rem]",
            children: Object.keys(i).map((o) =>
              _.jsx("div", {
                onClick: (u) => pn[o] && t(o),
                onMouseEnter: () => r(o),
                onMouseLeave: () => r(null),
                style: {
                  width: i[o],
                  color: pn[o] ? "#fff" : "#FFFFFF70",
                  background: pn[o] ? `${e7}` : "#00000047",
                  border: pn[o]
                    ? "1.287px solid rgba(255, 255, 255, 0.12)"
                    : "none",
                },
                "data-tooltip-id": pn[o] && "my-tooltip",
                className: ii(
                  "h-[2.875rem] rounded flex font-bold items-center justify-center font-roboto text-base pt-px select-none",
                  { "cursor-pointer": pn[o] }
                ),
                children: o,
              })
            ),
          })
        ),
      ],
    }),
  });
}
var Wg = {};
/*!
 *  howler.js v2.2.4
 *  howlerjs.com
 *
 *  (c) 2013-2020, James Simpson of GoldFire Studios
 *  goldfirestudios.com
 *
 *  MIT License
 */ (function (e) {
  (function () {
    var t = function () {
      this.init();
    };
    t.prototype = {
      init: function () {
        var l = this || n;
        return (
          (l._counter = 1e3),
          (l._html5AudioPool = []),
          (l.html5PoolSize = 10),
          (l._codecs = {}),
          (l._howls = []),
          (l._muted = !1),
          (l._volume = 1),
          (l._canPlayEvent = "canplaythrough"),
          (l._navigator =
            typeof window < "u" && window.navigator ? window.navigator : null),
          (l.masterGain = null),
          (l.noAudio = !1),
          (l.usingWebAudio = !0),
          (l.autoSuspend = !0),
          (l.ctx = null),
          (l.autoUnlock = !0),
          l._setup(),
          l
        );
      },
      volume: function (l) {
        var c = this || n;
        if (
          ((l = parseFloat(l)),
          c.ctx || p(),
          typeof l < "u" && l >= 0 && l <= 1)
        ) {
          if (((c._volume = l), c._muted)) return c;
          c.usingWebAudio &&
            c.masterGain.gain.setValueAtTime(l, n.ctx.currentTime);
          for (var f = 0; f < c._howls.length; f++)
            if (!c._howls[f]._webAudio)
              for (
                var m = c._howls[f]._getSoundIds(), v = 0;
                v < m.length;
                v++
              ) {
                var w = c._howls[f]._soundById(m[v]);
                w && w._node && (w._node.volume = w._volume * l);
              }
          return c;
        }
        return c._volume;
      },
      mute: function (l) {
        var c = this || n;
        c.ctx || p(),
          (c._muted = l),
          c.usingWebAudio &&
            c.masterGain.gain.setValueAtTime(
              l ? 0 : c._volume,
              n.ctx.currentTime
            );
        for (var f = 0; f < c._howls.length; f++)
          if (!c._howls[f]._webAudio)
            for (var m = c._howls[f]._getSoundIds(), v = 0; v < m.length; v++) {
              var w = c._howls[f]._soundById(m[v]);
              w && w._node && (w._node.muted = l ? !0 : w._muted);
            }
        return c;
      },
      stop: function () {
        for (var l = this || n, c = 0; c < l._howls.length; c++)
          l._howls[c].stop();
        return l;
      },
      unload: function () {
        for (var l = this || n, c = l._howls.length - 1; c >= 0; c--)
          l._howls[c].unload();
        return (
          l.usingWebAudio &&
            l.ctx &&
            typeof l.ctx.close < "u" &&
            (l.ctx.close(), (l.ctx = null), p()),
          l
        );
      },
      codecs: function (l) {
        return (this || n)._codecs[l.replace(/^x-/, "")];
      },
      _setup: function () {
        var l = this || n;
        if (
          ((l.state = (l.ctx && l.ctx.state) || "suspended"),
          l._autoSuspend(),
          !l.usingWebAudio)
        )
          if (typeof Audio < "u")
            try {
              var c = new Audio();
              typeof c.oncanplaythrough > "u" && (l._canPlayEvent = "canplay");
            } catch {
              l.noAudio = !0;
            }
          else l.noAudio = !0;
        try {
          var c = new Audio();
          c.muted && (l.noAudio = !0);
        } catch {}
        return l.noAudio || l._setupCodecs(), l;
      },
      _setupCodecs: function () {
        var l = this || n,
          c = null;
        try {
          c = typeof Audio < "u" ? new Audio() : null;
        } catch {
          return l;
        }
        if (!c || typeof c.canPlayType != "function") return l;
        var f = c.canPlayType("audio/mpeg;").replace(/^no$/, ""),
          m = l._navigator ? l._navigator.userAgent : "",
          v = m.match(/OPR\/(\d+)/g),
          w = v && parseInt(v[0].split("/")[1], 10) < 33,
          h = m.indexOf("Safari") !== -1 && m.indexOf("Chrome") === -1,
          g = m.match(/Version\/(.*?) /),
          y = h && g && parseInt(g[1], 10) < 15;
        return (
          (l._codecs = {
            mp3: !!(
              !w &&
              (f || c.canPlayType("audio/mp3;").replace(/^no$/, ""))
            ),
            mpeg: !!f,
            opus: !!c
              .canPlayType('audio/ogg; codecs="opus"')
              .replace(/^no$/, ""),
            ogg: !!c
              .canPlayType('audio/ogg; codecs="vorbis"')
              .replace(/^no$/, ""),
            oga: !!c
              .canPlayType('audio/ogg; codecs="vorbis"')
              .replace(/^no$/, ""),
            wav: !!(
              c.canPlayType('audio/wav; codecs="1"') ||
              c.canPlayType("audio/wav")
            ).replace(/^no$/, ""),
            aac: !!c.canPlayType("audio/aac;").replace(/^no$/, ""),
            caf: !!c.canPlayType("audio/x-caf;").replace(/^no$/, ""),
            m4a: !!(
              c.canPlayType("audio/x-m4a;") ||
              c.canPlayType("audio/m4a;") ||
              c.canPlayType("audio/aac;")
            ).replace(/^no$/, ""),
            m4b: !!(
              c.canPlayType("audio/x-m4b;") ||
              c.canPlayType("audio/m4b;") ||
              c.canPlayType("audio/aac;")
            ).replace(/^no$/, ""),
            mp4: !!(
              c.canPlayType("audio/x-mp4;") ||
              c.canPlayType("audio/mp4;") ||
              c.canPlayType("audio/aac;")
            ).replace(/^no$/, ""),
            weba: !!(
              !y &&
              c.canPlayType('audio/webm; codecs="vorbis"').replace(/^no$/, "")
            ),
            webm: !!(
              !y &&
              c.canPlayType('audio/webm; codecs="vorbis"').replace(/^no$/, "")
            ),
            dolby: !!c
              .canPlayType('audio/mp4; codecs="ec-3"')
              .replace(/^no$/, ""),
            flac: !!(
              c.canPlayType("audio/x-flac;") || c.canPlayType("audio/flac;")
            ).replace(/^no$/, ""),
          }),
          l
        );
      },
      _unlockAudio: function () {
        var l = this || n;
        if (!(l._audioUnlocked || !l.ctx)) {
          (l._audioUnlocked = !1),
            (l.autoUnlock = !1),
            !l._mobileUnloaded &&
              l.ctx.sampleRate !== 44100 &&
              ((l._mobileUnloaded = !0), l.unload()),
            (l._scratchBuffer = l.ctx.createBuffer(1, 1, 22050));
          var c = function (f) {
            for (; l._html5AudioPool.length < l.html5PoolSize; )
              try {
                var m = new Audio();
                (m._unlocked = !0), l._releaseHtml5Audio(m);
              } catch {
                l.noAudio = !0;
                break;
              }
            for (var v = 0; v < l._howls.length; v++)
              if (!l._howls[v]._webAudio)
                for (
                  var w = l._howls[v]._getSoundIds(), h = 0;
                  h < w.length;
                  h++
                ) {
                  var g = l._howls[v]._soundById(w[h]);
                  g &&
                    g._node &&
                    !g._node._unlocked &&
                    ((g._node._unlocked = !0), g._node.load());
                }
            l._autoResume();
            var y = l.ctx.createBufferSource();
            (y.buffer = l._scratchBuffer),
              y.connect(l.ctx.destination),
              typeof y.start > "u" ? y.noteOn(0) : y.start(0),
              typeof l.ctx.resume == "function" && l.ctx.resume(),
              (y.onended = function () {
                y.disconnect(0),
                  (l._audioUnlocked = !0),
                  document.removeEventListener("touchstart", c, !0),
                  document.removeEventListener("touchend", c, !0),
                  document.removeEventListener("click", c, !0),
                  document.removeEventListener("keydown", c, !0);
                for (var x = 0; x < l._howls.length; x++)
                  l._howls[x]._emit("unlock");
              });
          };
          return (
            document.addEventListener("touchstart", c, !0),
            document.addEventListener("touchend", c, !0),
            document.addEventListener("click", c, !0),
            document.addEventListener("keydown", c, !0),
            l
          );
        }
      },
      _obtainHtml5Audio: function () {
        var l = this || n;
        if (l._html5AudioPool.length) return l._html5AudioPool.pop();
        var c = new Audio().play();
        return (
          c &&
            typeof Promise < "u" &&
            (c instanceof Promise || typeof c.then == "function") &&
            c.catch(function () {
              console.warn(
                "HTML5 Audio pool exhausted, returning potentially locked audio object."
              );
            }),
          new Audio()
        );
      },
      _releaseHtml5Audio: function (l) {
        var c = this || n;
        return l._unlocked && c._html5AudioPool.push(l), c;
      },
      _autoSuspend: function () {
        var l = this;
        if (
          !(
            !l.autoSuspend ||
            !l.ctx ||
            typeof l.ctx.suspend > "u" ||
            !n.usingWebAudio
          )
        ) {
          for (var c = 0; c < l._howls.length; c++)
            if (l._howls[c]._webAudio) {
              for (var f = 0; f < l._howls[c]._sounds.length; f++)
                if (!l._howls[c]._sounds[f]._paused) return l;
            }
          return (
            l._suspendTimer && clearTimeout(l._suspendTimer),
            (l._suspendTimer = setTimeout(function () {
              if (l.autoSuspend) {
                (l._suspendTimer = null), (l.state = "suspending");
                var m = function () {
                  (l.state = "suspended"),
                    l._resumeAfterSuspend &&
                      (delete l._resumeAfterSuspend, l._autoResume());
                };
                l.ctx.suspend().then(m, m);
              }
            }, 3e4)),
            l
          );
        }
      },
      _autoResume: function () {
        var l = this;
        if (!(!l.ctx || typeof l.ctx.resume > "u" || !n.usingWebAudio))
          return (
            l.state === "running" &&
            l.ctx.state !== "interrupted" &&
            l._suspendTimer
              ? (clearTimeout(l._suspendTimer), (l._suspendTimer = null))
              : l.state === "suspended" ||
                (l.state === "running" && l.ctx.state === "interrupted")
              ? (l.ctx.resume().then(function () {
                  l.state = "running";
                  for (var c = 0; c < l._howls.length; c++)
                    l._howls[c]._emit("resume");
                }),
                l._suspendTimer &&
                  (clearTimeout(l._suspendTimer), (l._suspendTimer = null)))
              : l.state === "suspending" && (l._resumeAfterSuspend = !0),
            l
          );
      },
    };
    var n = new t(),
      r = function (l) {
        var c = this;
        if (!l.src || l.src.length === 0) {
          console.error(
            "An array of source files must be passed with any new Howl."
          );
          return;
        }
        c.init(l);
      };
    r.prototype = {
      init: function (l) {
        var c = this;
        return (
          n.ctx || p(),
          (c._autoplay = l.autoplay || !1),
          (c._format = typeof l.format != "string" ? l.format : [l.format]),
          (c._html5 = l.html5 || !1),
          (c._muted = l.mute || !1),
          (c._loop = l.loop || !1),
          (c._pool = l.pool || 5),
          (c._preload =
            typeof l.preload == "boolean" || l.preload === "metadata"
              ? l.preload
              : !0),
          (c._rate = l.rate || 1),
          (c._sprite = l.sprite || {}),
          (c._src = typeof l.src != "string" ? l.src : [l.src]),
          (c._volume = l.volume !== void 0 ? l.volume : 1),
          (c._xhr = {
            method: l.xhr && l.xhr.method ? l.xhr.method : "GET",
            headers: l.xhr && l.xhr.headers ? l.xhr.headers : null,
            withCredentials:
              l.xhr && l.xhr.withCredentials ? l.xhr.withCredentials : !1,
          }),
          (c._duration = 0),
          (c._state = "unloaded"),
          (c._sounds = []),
          (c._endTimers = {}),
          (c._queue = []),
          (c._playLock = !1),
          (c._onend = l.onend ? [{ fn: l.onend }] : []),
          (c._onfade = l.onfade ? [{ fn: l.onfade }] : []),
          (c._onload = l.onload ? [{ fn: l.onload }] : []),
          (c._onloaderror = l.onloaderror ? [{ fn: l.onloaderror }] : []),
          (c._onplayerror = l.onplayerror ? [{ fn: l.onplayerror }] : []),
          (c._onpause = l.onpause ? [{ fn: l.onpause }] : []),
          (c._onplay = l.onplay ? [{ fn: l.onplay }] : []),
          (c._onstop = l.onstop ? [{ fn: l.onstop }] : []),
          (c._onmute = l.onmute ? [{ fn: l.onmute }] : []),
          (c._onvolume = l.onvolume ? [{ fn: l.onvolume }] : []),
          (c._onrate = l.onrate ? [{ fn: l.onrate }] : []),
          (c._onseek = l.onseek ? [{ fn: l.onseek }] : []),
          (c._onunlock = l.onunlock ? [{ fn: l.onunlock }] : []),
          (c._onresume = []),
          (c._webAudio = n.usingWebAudio && !c._html5),
          typeof n.ctx < "u" && n.ctx && n.autoUnlock && n._unlockAudio(),
          n._howls.push(c),
          c._autoplay &&
            c._queue.push({
              event: "play",
              action: function () {
                c.play();
              },
            }),
          c._preload && c._preload !== "none" && c.load(),
          c
        );
      },
      load: function () {
        var l = this,
          c = null;
        if (n.noAudio) {
          l._emit("loaderror", null, "No audio support.");
          return;
        }
        typeof l._src == "string" && (l._src = [l._src]);
        for (var f = 0; f < l._src.length; f++) {
          var m, v;
          if (l._format && l._format[f]) m = l._format[f];
          else {
            if (((v = l._src[f]), typeof v != "string")) {
              l._emit(
                "loaderror",
                null,
                "Non-string found in selected audio sources - ignoring."
              );
              continue;
            }
            (m = /^data:audio\/([^;,]+);/i.exec(v)),
              m || (m = /\.([^.]+)$/.exec(v.split("?", 1)[0])),
              m && (m = m[1].toLowerCase());
          }
          if (
            (m ||
              console.warn(
                'No file extension was found. Consider using the "format" property or specify an extension.'
              ),
            m && n.codecs(m))
          ) {
            c = l._src[f];
            break;
          }
        }
        if (!c) {
          l._emit(
            "loaderror",
            null,
            "No codec support for selected audio sources."
          );
          return;
        }
        return (
          (l._src = c),
          (l._state = "loading"),
          window.location.protocol === "https:" &&
            c.slice(0, 5) === "http:" &&
            ((l._html5 = !0), (l._webAudio = !1)),
          new i(l),
          l._webAudio && o(l),
          l
        );
      },
      play: function (l, c) {
        var f = this,
          m = null;
        if (typeof l == "number") (m = l), (l = null);
        else {
          if (typeof l == "string" && f._state === "loaded" && !f._sprite[l])
            return null;
          if (typeof l > "u" && ((l = "__default"), !f._playLock)) {
            for (var v = 0, w = 0; w < f._sounds.length; w++)
              f._sounds[w]._paused &&
                !f._sounds[w]._ended &&
                (v++, (m = f._sounds[w]._id));
            v === 1 ? (l = null) : (m = null);
          }
        }
        var h = m ? f._soundById(m) : f._inactiveSound();
        if (!h) return null;
        if (
          (m && !l && (l = h._sprite || "__default"), f._state !== "loaded")
        ) {
          (h._sprite = l), (h._ended = !1);
          var g = h._id;
          return (
            f._queue.push({
              event: "play",
              action: function () {
                f.play(g);
              },
            }),
            g
          );
        }
        if (m && !h._paused) return c || f._loadQueue("play"), h._id;
        f._webAudio && n._autoResume();
        var y = Math.max(0, h._seek > 0 ? h._seek : f._sprite[l][0] / 1e3),
          x = Math.max(0, (f._sprite[l][0] + f._sprite[l][1]) / 1e3 - y),
          S = (x * 1e3) / Math.abs(h._rate),
          T = f._sprite[l][0] / 1e3,
          M = (f._sprite[l][0] + f._sprite[l][1]) / 1e3;
        (h._sprite = l), (h._ended = !1);
        var E = function () {
          (h._paused = !1),
            (h._seek = y),
            (h._start = T),
            (h._stop = M),
            (h._loop = !!(h._loop || f._sprite[l][2]));
        };
        if (y >= M) {
          f._ended(h);
          return;
        }
        var k = h._node;
        if (f._webAudio) {
          var P = function () {
            (f._playLock = !1), E(), f._refreshBuffer(h);
            var N = h._muted || f._muted ? 0 : h._volume;
            k.gain.setValueAtTime(N, n.ctx.currentTime),
              (h._playStart = n.ctx.currentTime),
              typeof k.bufferSource.start > "u"
                ? h._loop
                  ? k.bufferSource.noteGrainOn(0, y, 86400)
                  : k.bufferSource.noteGrainOn(0, y, x)
                : h._loop
                ? k.bufferSource.start(0, y, 86400)
                : k.bufferSource.start(0, y, x),
              S !== 1 / 0 &&
                (f._endTimers[h._id] = setTimeout(f._ended.bind(f, h), S)),
              c ||
                setTimeout(function () {
                  f._emit("play", h._id), f._loadQueue();
                }, 0);
          };
          n.state === "running" && n.ctx.state !== "interrupted"
            ? P()
            : ((f._playLock = !0), f.once("resume", P), f._clearTimer(h._id));
        } else {
          var O = function () {
            (k.currentTime = y),
              (k.muted = h._muted || f._muted || n._muted || k.muted),
              (k.volume = h._volume * n.volume()),
              (k.playbackRate = h._rate);
            try {
              var N = k.play();
              if (
                (N &&
                typeof Promise < "u" &&
                (N instanceof Promise || typeof N.then == "function")
                  ? ((f._playLock = !0),
                    E(),
                    N.then(function () {
                      (f._playLock = !1),
                        (k._unlocked = !0),
                        c ? f._loadQueue() : f._emit("play", h._id);
                    }).catch(function () {
                      (f._playLock = !1),
                        f._emit(
                          "playerror",
                          h._id,
                          "Playback was unable to start. This is most commonly an issue on mobile devices and Chrome where playback was not within a user interaction."
                        ),
                        (h._ended = !0),
                        (h._paused = !0);
                    }))
                  : c || ((f._playLock = !1), E(), f._emit("play", h._id)),
                (k.playbackRate = h._rate),
                k.paused)
              ) {
                f._emit(
                  "playerror",
                  h._id,
                  "Playback was unable to start. This is most commonly an issue on mobile devices and Chrome where playback was not within a user interaction."
                );
                return;
              }
              l !== "__default" || h._loop
                ? (f._endTimers[h._id] = setTimeout(f._ended.bind(f, h), S))
                : ((f._endTimers[h._id] = function () {
                    f._ended(h),
                      k.removeEventListener("ended", f._endTimers[h._id], !1);
                  }),
                  k.addEventListener("ended", f._endTimers[h._id], !1));
            } catch (W) {
              f._emit("playerror", h._id, W);
            }
          };
          k.src ===
            "data:audio/wav;base64,UklGRigAAABXQVZFZm10IBIAAAABAAEARKwAAIhYAQACABAAAABkYXRhAgAAAAEA" &&
            ((k.src = f._src), k.load());
          var V =
            (window && window.ejecta) ||
            (!k.readyState && n._navigator.isCocoonJS);
          if (k.readyState >= 3 || V) O();
          else {
            (f._playLock = !0), (f._state = "loading");
            var R = function () {
              (f._state = "loaded"),
                O(),
                k.removeEventListener(n._canPlayEvent, R, !1);
            };
            k.addEventListener(n._canPlayEvent, R, !1), f._clearTimer(h._id);
          }
        }
        return h._id;
      },
      pause: function (l) {
        var c = this;
        if (c._state !== "loaded" || c._playLock)
          return (
            c._queue.push({
              event: "pause",
              action: function () {
                c.pause(l);
              },
            }),
            c
          );
        for (var f = c._getSoundIds(l), m = 0; m < f.length; m++) {
          c._clearTimer(f[m]);
          var v = c._soundById(f[m]);
          if (
            v &&
            !v._paused &&
            ((v._seek = c.seek(f[m])),
            (v._rateSeek = 0),
            (v._paused = !0),
            c._stopFade(f[m]),
            v._node)
          )
            if (c._webAudio) {
              if (!v._node.bufferSource) continue;
              typeof v._node.bufferSource.stop > "u"
                ? v._node.bufferSource.noteOff(0)
                : v._node.bufferSource.stop(0),
                c._cleanBuffer(v._node);
            } else
              (!isNaN(v._node.duration) || v._node.duration === 1 / 0) &&
                v._node.pause();
          arguments[1] || c._emit("pause", v ? v._id : null);
        }
        return c;
      },
      stop: function (l, c) {
        var f = this;
        if (f._state !== "loaded" || f._playLock)
          return (
            f._queue.push({
              event: "stop",
              action: function () {
                f.stop(l);
              },
            }),
            f
          );
        for (var m = f._getSoundIds(l), v = 0; v < m.length; v++) {
          f._clearTimer(m[v]);
          var w = f._soundById(m[v]);
          w &&
            ((w._seek = w._start || 0),
            (w._rateSeek = 0),
            (w._paused = !0),
            (w._ended = !0),
            f._stopFade(m[v]),
            w._node &&
              (f._webAudio
                ? w._node.bufferSource &&
                  (typeof w._node.bufferSource.stop > "u"
                    ? w._node.bufferSource.noteOff(0)
                    : w._node.bufferSource.stop(0),
                  f._cleanBuffer(w._node))
                : (!isNaN(w._node.duration) || w._node.duration === 1 / 0) &&
                  ((w._node.currentTime = w._start || 0),
                  w._node.pause(),
                  w._node.duration === 1 / 0 && f._clearSound(w._node))),
            c || f._emit("stop", w._id));
        }
        return f;
      },
      mute: function (l, c) {
        var f = this;
        if (f._state !== "loaded" || f._playLock)
          return (
            f._queue.push({
              event: "mute",
              action: function () {
                f.mute(l, c);
              },
            }),
            f
          );
        if (typeof c > "u")
          if (typeof l == "boolean") f._muted = l;
          else return f._muted;
        for (var m = f._getSoundIds(c), v = 0; v < m.length; v++) {
          var w = f._soundById(m[v]);
          w &&
            ((w._muted = l),
            w._interval && f._stopFade(w._id),
            f._webAudio && w._node
              ? w._node.gain.setValueAtTime(
                  l ? 0 : w._volume,
                  n.ctx.currentTime
                )
              : w._node && (w._node.muted = n._muted ? !0 : l),
            f._emit("mute", w._id));
        }
        return f;
      },
      volume: function () {
        var l = this,
          c = arguments,
          f,
          m;
        if (c.length === 0) return l._volume;
        if (c.length === 1 || (c.length === 2 && typeof c[1] > "u")) {
          var v = l._getSoundIds(),
            w = v.indexOf(c[0]);
          w >= 0 ? (m = parseInt(c[0], 10)) : (f = parseFloat(c[0]));
        } else
          c.length >= 2 && ((f = parseFloat(c[0])), (m = parseInt(c[1], 10)));
        var h;
        if (typeof f < "u" && f >= 0 && f <= 1) {
          if (l._state !== "loaded" || l._playLock)
            return (
              l._queue.push({
                event: "volume",
                action: function () {
                  l.volume.apply(l, c);
                },
              }),
              l
            );
          typeof m > "u" && (l._volume = f), (m = l._getSoundIds(m));
          for (var g = 0; g < m.length; g++)
            (h = l._soundById(m[g])),
              h &&
                ((h._volume = f),
                c[2] || l._stopFade(m[g]),
                l._webAudio && h._node && !h._muted
                  ? h._node.gain.setValueAtTime(f, n.ctx.currentTime)
                  : h._node && !h._muted && (h._node.volume = f * n.volume()),
                l._emit("volume", h._id));
        } else
          return (h = m ? l._soundById(m) : l._sounds[0]), h ? h._volume : 0;
        return l;
      },
      fade: function (l, c, f, m) {
        var v = this;
        if (v._state !== "loaded" || v._playLock)
          return (
            v._queue.push({
              event: "fade",
              action: function () {
                v.fade(l, c, f, m);
              },
            }),
            v
          );
        (l = Math.min(Math.max(0, parseFloat(l)), 1)),
          (c = Math.min(Math.max(0, parseFloat(c)), 1)),
          (f = parseFloat(f)),
          v.volume(l, m);
        for (var w = v._getSoundIds(m), h = 0; h < w.length; h++) {
          var g = v._soundById(w[h]);
          if (g) {
            if ((m || v._stopFade(w[h]), v._webAudio && !g._muted)) {
              var y = n.ctx.currentTime,
                x = y + f / 1e3;
              (g._volume = l),
                g._node.gain.setValueAtTime(l, y),
                g._node.gain.linearRampToValueAtTime(c, x);
            }
            v._startFadeInterval(g, l, c, f, w[h], typeof m > "u");
          }
        }
        return v;
      },
      _startFadeInterval: function (l, c, f, m, v, w) {
        var h = this,
          g = c,
          y = f - c,
          x = Math.abs(y / 0.01),
          S = Math.max(4, x > 0 ? m / x : m),
          T = Date.now();
        (l._fadeTo = f),
          (l._interval = setInterval(function () {
            var M = (Date.now() - T) / m;
            (T = Date.now()),
              (g += y * M),
              (g = Math.round(g * 100) / 100),
              y < 0 ? (g = Math.max(f, g)) : (g = Math.min(f, g)),
              h._webAudio ? (l._volume = g) : h.volume(g, l._id, !0),
              w && (h._volume = g),
              ((f < c && g <= f) || (f > c && g >= f)) &&
                (clearInterval(l._interval),
                (l._interval = null),
                (l._fadeTo = null),
                h.volume(f, l._id),
                h._emit("fade", l._id));
          }, S));
      },
      _stopFade: function (l) {
        var c = this,
          f = c._soundById(l);
        return (
          f &&
            f._interval &&
            (c._webAudio &&
              f._node.gain.cancelScheduledValues(n.ctx.currentTime),
            clearInterval(f._interval),
            (f._interval = null),
            c.volume(f._fadeTo, l),
            (f._fadeTo = null),
            c._emit("fade", l)),
          c
        );
      },
      loop: function () {
        var l = this,
          c = arguments,
          f,
          m,
          v;
        if (c.length === 0) return l._loop;
        if (c.length === 1)
          if (typeof c[0] == "boolean") (f = c[0]), (l._loop = f);
          else return (v = l._soundById(parseInt(c[0], 10))), v ? v._loop : !1;
        else c.length === 2 && ((f = c[0]), (m = parseInt(c[1], 10)));
        for (var w = l._getSoundIds(m), h = 0; h < w.length; h++)
          (v = l._soundById(w[h])),
            v &&
              ((v._loop = f),
              l._webAudio &&
                v._node &&
                v._node.bufferSource &&
                ((v._node.bufferSource.loop = f),
                f &&
                  ((v._node.bufferSource.loopStart = v._start || 0),
                  (v._node.bufferSource.loopEnd = v._stop),
                  l.playing(w[h]) && (l.pause(w[h], !0), l.play(w[h], !0)))));
        return l;
      },
      rate: function () {
        var l = this,
          c = arguments,
          f,
          m;
        if (c.length === 0) m = l._sounds[0]._id;
        else if (c.length === 1) {
          var v = l._getSoundIds(),
            w = v.indexOf(c[0]);
          w >= 0 ? (m = parseInt(c[0], 10)) : (f = parseFloat(c[0]));
        } else
          c.length === 2 && ((f = parseFloat(c[0])), (m = parseInt(c[1], 10)));
        var h;
        if (typeof f == "number") {
          if (l._state !== "loaded" || l._playLock)
            return (
              l._queue.push({
                event: "rate",
                action: function () {
                  l.rate.apply(l, c);
                },
              }),
              l
            );
          typeof m > "u" && (l._rate = f), (m = l._getSoundIds(m));
          for (var g = 0; g < m.length; g++)
            if (((h = l._soundById(m[g])), h)) {
              l.playing(m[g]) &&
                ((h._rateSeek = l.seek(m[g])),
                (h._playStart = l._webAudio
                  ? n.ctx.currentTime
                  : h._playStart)),
                (h._rate = f),
                l._webAudio && h._node && h._node.bufferSource
                  ? h._node.bufferSource.playbackRate.setValueAtTime(
                      f,
                      n.ctx.currentTime
                    )
                  : h._node && (h._node.playbackRate = f);
              var y = l.seek(m[g]),
                x =
                  (l._sprite[h._sprite][0] + l._sprite[h._sprite][1]) / 1e3 - y,
                S = (x * 1e3) / Math.abs(h._rate);
              (l._endTimers[m[g]] || !h._paused) &&
                (l._clearTimer(m[g]),
                (l._endTimers[m[g]] = setTimeout(l._ended.bind(l, h), S))),
                l._emit("rate", h._id);
            }
        } else return (h = l._soundById(m)), h ? h._rate : l._rate;
        return l;
      },
      seek: function () {
        var l = this,
          c = arguments,
          f,
          m;
        if (c.length === 0) l._sounds.length && (m = l._sounds[0]._id);
        else if (c.length === 1) {
          var v = l._getSoundIds(),
            w = v.indexOf(c[0]);
          w >= 0
            ? (m = parseInt(c[0], 10))
            : l._sounds.length &&
              ((m = l._sounds[0]._id), (f = parseFloat(c[0])));
        } else
          c.length === 2 && ((f = parseFloat(c[0])), (m = parseInt(c[1], 10)));
        if (typeof m > "u") return 0;
        if (typeof f == "number" && (l._state !== "loaded" || l._playLock))
          return (
            l._queue.push({
              event: "seek",
              action: function () {
                l.seek.apply(l, c);
              },
            }),
            l
          );
        var h = l._soundById(m);
        if (h)
          if (typeof f == "number" && f >= 0) {
            var g = l.playing(m);
            g && l.pause(m, !0),
              (h._seek = f),
              (h._ended = !1),
              l._clearTimer(m),
              !l._webAudio &&
                h._node &&
                !isNaN(h._node.duration) &&
                (h._node.currentTime = f);
            var y = function () {
              g && l.play(m, !0), l._emit("seek", m);
            };
            if (g && !l._webAudio) {
              var x = function () {
                l._playLock ? setTimeout(x, 0) : y();
              };
              setTimeout(x, 0);
            } else y();
          } else if (l._webAudio) {
            var S = l.playing(m) ? n.ctx.currentTime - h._playStart : 0,
              T = h._rateSeek ? h._rateSeek - h._seek : 0;
            return h._seek + (T + S * Math.abs(h._rate));
          } else return h._node.currentTime;
        return l;
      },
      playing: function (l) {
        var c = this;
        if (typeof l == "number") {
          var f = c._soundById(l);
          return f ? !f._paused : !1;
        }
        for (var m = 0; m < c._sounds.length; m++)
          if (!c._sounds[m]._paused) return !0;
        return !1;
      },
      duration: function (l) {
        var c = this,
          f = c._duration,
          m = c._soundById(l);
        return m && (f = c._sprite[m._sprite][1] / 1e3), f;
      },
      state: function () {
        return this._state;
      },
      unload: function () {
        for (var l = this, c = l._sounds, f = 0; f < c.length; f++)
          c[f]._paused || l.stop(c[f]._id),
            l._webAudio ||
              (l._clearSound(c[f]._node),
              c[f]._node.removeEventListener("error", c[f]._errorFn, !1),
              c[f]._node.removeEventListener(n._canPlayEvent, c[f]._loadFn, !1),
              c[f]._node.removeEventListener("ended", c[f]._endFn, !1),
              n._releaseHtml5Audio(c[f]._node)),
            delete c[f]._node,
            l._clearTimer(c[f]._id);
        var m = n._howls.indexOf(l);
        m >= 0 && n._howls.splice(m, 1);
        var v = !0;
        for (f = 0; f < n._howls.length; f++)
          if (
            n._howls[f]._src === l._src ||
            l._src.indexOf(n._howls[f]._src) >= 0
          ) {
            v = !1;
            break;
          }
        return (
          s && v && delete s[l._src],
          (n.noAudio = !1),
          (l._state = "unloaded"),
          (l._sounds = []),
          (l = null),
          null
        );
      },
      on: function (l, c, f, m) {
        var v = this,
          w = v["_on" + l];
        return (
          typeof c == "function" &&
            w.push(m ? { id: f, fn: c, once: m } : { id: f, fn: c }),
          v
        );
      },
      off: function (l, c, f) {
        var m = this,
          v = m["_on" + l],
          w = 0;
        if ((typeof c == "number" && ((f = c), (c = null)), c || f))
          for (w = 0; w < v.length; w++) {
            var h = f === v[w].id;
            if ((c === v[w].fn && h) || (!c && h)) {
              v.splice(w, 1);
              break;
            }
          }
        else if (l) m["_on" + l] = [];
        else {
          var g = Object.keys(m);
          for (w = 0; w < g.length; w++)
            g[w].indexOf("_on") === 0 &&
              Array.isArray(m[g[w]]) &&
              (m[g[w]] = []);
        }
        return m;
      },
      once: function (l, c, f) {
        var m = this;
        return m.on(l, c, f, 1), m;
      },
      _emit: function (l, c, f) {
        for (var m = this, v = m["_on" + l], w = v.length - 1; w >= 0; w--)
          (!v[w].id || v[w].id === c || l === "load") &&
            (setTimeout(
              function (h) {
                h.call(this, c, f);
              }.bind(m, v[w].fn),
              0
            ),
            v[w].once && m.off(l, v[w].fn, v[w].id));
        return m._loadQueue(l), m;
      },
      _loadQueue: function (l) {
        var c = this;
        if (c._queue.length > 0) {
          var f = c._queue[0];
          f.event === l && (c._queue.shift(), c._loadQueue()), l || f.action();
        }
        return c;
      },
      _ended: function (l) {
        var c = this,
          f = l._sprite;
        if (
          !c._webAudio &&
          l._node &&
          !l._node.paused &&
          !l._node.ended &&
          l._node.currentTime < l._stop
        )
          return setTimeout(c._ended.bind(c, l), 100), c;
        var m = !!(l._loop || c._sprite[f][2]);
        if (
          (c._emit("end", l._id),
          !c._webAudio && m && c.stop(l._id, !0).play(l._id),
          c._webAudio && m)
        ) {
          c._emit("play", l._id),
            (l._seek = l._start || 0),
            (l._rateSeek = 0),
            (l._playStart = n.ctx.currentTime);
          var v = ((l._stop - l._start) * 1e3) / Math.abs(l._rate);
          c._endTimers[l._id] = setTimeout(c._ended.bind(c, l), v);
        }
        return (
          c._webAudio &&
            !m &&
            ((l._paused = !0),
            (l._ended = !0),
            (l._seek = l._start || 0),
            (l._rateSeek = 0),
            c._clearTimer(l._id),
            c._cleanBuffer(l._node),
            n._autoSuspend()),
          !c._webAudio && !m && c.stop(l._id, !0),
          c
        );
      },
      _clearTimer: function (l) {
        var c = this;
        if (c._endTimers[l]) {
          if (typeof c._endTimers[l] != "function")
            clearTimeout(c._endTimers[l]);
          else {
            var f = c._soundById(l);
            f &&
              f._node &&
              f._node.removeEventListener("ended", c._endTimers[l], !1);
          }
          delete c._endTimers[l];
        }
        return c;
      },
      _soundById: function (l) {
        for (var c = this, f = 0; f < c._sounds.length; f++)
          if (l === c._sounds[f]._id) return c._sounds[f];
        return null;
      },
      _inactiveSound: function () {
        var l = this;
        l._drain();
        for (var c = 0; c < l._sounds.length; c++)
          if (l._sounds[c]._ended) return l._sounds[c].reset();
        return new i(l);
      },
      _drain: function () {
        var l = this,
          c = l._pool,
          f = 0,
          m = 0;
        if (!(l._sounds.length < c)) {
          for (m = 0; m < l._sounds.length; m++) l._sounds[m]._ended && f++;
          for (m = l._sounds.length - 1; m >= 0; m--) {
            if (f <= c) return;
            l._sounds[m]._ended &&
              (l._webAudio &&
                l._sounds[m]._node &&
                l._sounds[m]._node.disconnect(0),
              l._sounds.splice(m, 1),
              f--);
          }
        }
      },
      _getSoundIds: function (l) {
        var c = this;
        if (typeof l > "u") {
          for (var f = [], m = 0; m < c._sounds.length; m++)
            f.push(c._sounds[m]._id);
          return f;
        } else return [l];
      },
      _refreshBuffer: function (l) {
        var c = this;
        return (
          (l._node.bufferSource = n.ctx.createBufferSource()),
          (l._node.bufferSource.buffer = s[c._src]),
          l._panner
            ? l._node.bufferSource.connect(l._panner)
            : l._node.bufferSource.connect(l._node),
          (l._node.bufferSource.loop = l._loop),
          l._loop &&
            ((l._node.bufferSource.loopStart = l._start || 0),
            (l._node.bufferSource.loopEnd = l._stop || 0)),
          l._node.bufferSource.playbackRate.setValueAtTime(
            l._rate,
            n.ctx.currentTime
          ),
          c
        );
      },
      _cleanBuffer: function (l) {
        var c = this,
          f = n._navigator && n._navigator.vendor.indexOf("Apple") >= 0;
        if (!l.bufferSource) return c;
        if (
          n._scratchBuffer &&
          l.bufferSource &&
          ((l.bufferSource.onended = null), l.bufferSource.disconnect(0), f)
        )
          try {
            l.bufferSource.buffer = n._scratchBuffer;
          } catch {}
        return (l.bufferSource = null), c;
      },
      _clearSound: function (l) {
        var c = /MSIE |Trident\//.test(n._navigator && n._navigator.userAgent);
        c ||
          (l.src =
            "data:audio/wav;base64,UklGRigAAABXQVZFZm10IBIAAAABAAEARKwAAIhYAQACABAAAABkYXRhAgAAAAEA");
      },
    };
    var i = function (l) {
      (this._parent = l), this.init();
    };
    i.prototype = {
      init: function () {
        var l = this,
          c = l._parent;
        return (
          (l._muted = c._muted),
          (l._loop = c._loop),
          (l._volume = c._volume),
          (l._rate = c._rate),
          (l._seek = 0),
          (l._paused = !0),
          (l._ended = !0),
          (l._sprite = "__default"),
          (l._id = ++n._counter),
          c._sounds.push(l),
          l.create(),
          l
        );
      },
      create: function () {
        var l = this,
          c = l._parent,
          f = n._muted || l._muted || l._parent._muted ? 0 : l._volume;
        return (
          c._webAudio
            ? ((l._node =
                typeof n.ctx.createGain > "u"
                  ? n.ctx.createGainNode()
                  : n.ctx.createGain()),
              l._node.gain.setValueAtTime(f, n.ctx.currentTime),
              (l._node.paused = !0),
              l._node.connect(n.masterGain))
            : n.noAudio ||
              ((l._node = n._obtainHtml5Audio()),
              (l._errorFn = l._errorListener.bind(l)),
              l._node.addEventListener("error", l._errorFn, !1),
              (l._loadFn = l._loadListener.bind(l)),
              l._node.addEventListener(n._canPlayEvent, l._loadFn, !1),
              (l._endFn = l._endListener.bind(l)),
              l._node.addEventListener("ended", l._endFn, !1),
              (l._node.src = c._src),
              (l._node.preload = c._preload === !0 ? "auto" : c._preload),
              (l._node.volume = f * n.volume()),
              l._node.load()),
          l
        );
      },
      reset: function () {
        var l = this,
          c = l._parent;
        return (
          (l._muted = c._muted),
          (l._loop = c._loop),
          (l._volume = c._volume),
          (l._rate = c._rate),
          (l._seek = 0),
          (l._rateSeek = 0),
          (l._paused = !0),
          (l._ended = !0),
          (l._sprite = "__default"),
          (l._id = ++n._counter),
          l
        );
      },
      _errorListener: function () {
        var l = this;
        l._parent._emit(
          "loaderror",
          l._id,
          l._node.error ? l._node.error.code : 0
        ),
          l._node.removeEventListener("error", l._errorFn, !1);
      },
      _loadListener: function () {
        var l = this,
          c = l._parent;
        (c._duration = Math.ceil(l._node.duration * 10) / 10),
          Object.keys(c._sprite).length === 0 &&
            (c._sprite = { __default: [0, c._duration * 1e3] }),
          c._state !== "loaded" &&
            ((c._state = "loaded"), c._emit("load"), c._loadQueue()),
          l._node.removeEventListener(n._canPlayEvent, l._loadFn, !1);
      },
      _endListener: function () {
        var l = this,
          c = l._parent;
        c._duration === 1 / 0 &&
          ((c._duration = Math.ceil(l._node.duration * 10) / 10),
          c._sprite.__default[1] === 1 / 0 &&
            (c._sprite.__default[1] = c._duration * 1e3),
          c._ended(l)),
          l._node.removeEventListener("ended", l._endFn, !1);
      },
    };
    var s = {},
      o = function (l) {
        var c = l._src;
        if (s[c]) {
          (l._duration = s[c].duration), d(l);
          return;
        }
        if (/^data:[^;]+;base64,/.test(c)) {
          for (
            var f = atob(c.split(",")[1]), m = new Uint8Array(f.length), v = 0;
            v < f.length;
            ++v
          )
            m[v] = f.charCodeAt(v);
          a(m.buffer, l);
        } else {
          var w = new XMLHttpRequest();
          w.open(l._xhr.method, c, !0),
            (w.withCredentials = l._xhr.withCredentials),
            (w.responseType = "arraybuffer"),
            l._xhr.headers &&
              Object.keys(l._xhr.headers).forEach(function (h) {
                w.setRequestHeader(h, l._xhr.headers[h]);
              }),
            (w.onload = function () {
              var h = (w.status + "")[0];
              if (h !== "0" && h !== "2" && h !== "3") {
                l._emit(
                  "loaderror",
                  null,
                  "Failed loading audio file with status: " + w.status + "."
                );
                return;
              }
              a(w.response, l);
            }),
            (w.onerror = function () {
              l._webAudio &&
                ((l._html5 = !0),
                (l._webAudio = !1),
                (l._sounds = []),
                delete s[c],
                l.load());
            }),
            u(w);
        }
      },
      u = function (l) {
        try {
          l.send();
        } catch {
          l.onerror();
        }
      },
      a = function (l, c) {
        var f = function () {
            c._emit("loaderror", null, "Decoding audio data failed.");
          },
          m = function (v) {
            v && c._sounds.length > 0 ? ((s[c._src] = v), d(c, v)) : f();
          };
        typeof Promise < "u" && n.ctx.decodeAudioData.length === 1
          ? n.ctx.decodeAudioData(l).then(m).catch(f)
          : n.ctx.decodeAudioData(l, m, f);
      },
      d = function (l, c) {
        c && !l._duration && (l._duration = c.duration),
          Object.keys(l._sprite).length === 0 &&
            (l._sprite = { __default: [0, l._duration * 1e3] }),
          l._state !== "loaded" &&
            ((l._state = "loaded"), l._emit("load"), l._loadQueue());
      },
      p = function () {
        if (n.usingWebAudio) {
          try {
            typeof AudioContext < "u"
              ? (n.ctx = new AudioContext())
              : typeof webkitAudioContext < "u"
              ? (n.ctx = new webkitAudioContext())
              : (n.usingWebAudio = !1);
          } catch {
            n.usingWebAudio = !1;
          }
          n.ctx || (n.usingWebAudio = !1);
          var l = /iP(hone|od|ad)/.test(n._navigator && n._navigator.platform),
            c =
              n._navigator &&
              n._navigator.appVersion.match(/OS (\d+)_(\d+)_?(\d+)?/),
            f = c ? parseInt(c[1], 10) : null;
          if (l && f && f < 9) {
            var m = /safari/.test(
              n._navigator && n._navigator.userAgent.toLowerCase()
            );
            n._navigator && !m && (n.usingWebAudio = !1);
          }
          n.usingWebAudio &&
            ((n.masterGain =
              typeof n.ctx.createGain > "u"
                ? n.ctx.createGainNode()
                : n.ctx.createGain()),
            n.masterGain.gain.setValueAtTime(
              n._muted ? 0 : n._volume,
              n.ctx.currentTime
            ),
            n.masterGain.connect(n.ctx.destination)),
            n._setup();
        }
      };
    (e.Howler = n),
      (e.Howl = r),
      typeof ki < "u"
        ? ((ki.HowlerGlobal = t),
          (ki.Howler = n),
          (ki.Howl = r),
          (ki.Sound = i))
        : typeof window < "u" &&
          ((window.HowlerGlobal = t),
          (window.Howler = n),
          (window.Howl = r),
          (window.Sound = i));
  })();
  /*!
   *  Spatial Plugin - Adds support for stereo and 3D audio where Web Audio is supported.
   *
   *  howler.js v2.2.4
   *  howlerjs.com
   *
   *  (c) 2013-2020, James Simpson of GoldFire Studios
   *  goldfirestudios.com
   *
   *  MIT License
   */ (function () {
    (HowlerGlobal.prototype._pos = [0, 0, 0]),
      (HowlerGlobal.prototype._orientation = [0, 0, -1, 0, 1, 0]),
      (HowlerGlobal.prototype.stereo = function (n) {
        var r = this;
        if (!r.ctx || !r.ctx.listener) return r;
        for (var i = r._howls.length - 1; i >= 0; i--) r._howls[i].stereo(n);
        return r;
      }),
      (HowlerGlobal.prototype.pos = function (n, r, i) {
        var s = this;
        if (!s.ctx || !s.ctx.listener) return s;
        if (
          ((r = typeof r != "number" ? s._pos[1] : r),
          (i = typeof i != "number" ? s._pos[2] : i),
          typeof n == "number")
        )
          (s._pos = [n, r, i]),
            typeof s.ctx.listener.positionX < "u"
              ? (s.ctx.listener.positionX.setTargetAtTime(
                  s._pos[0],
                  Howler.ctx.currentTime,
                  0.1
                ),
                s.ctx.listener.positionY.setTargetAtTime(
                  s._pos[1],
                  Howler.ctx.currentTime,
                  0.1
                ),
                s.ctx.listener.positionZ.setTargetAtTime(
                  s._pos[2],
                  Howler.ctx.currentTime,
                  0.1
                ))
              : s.ctx.listener.setPosition(s._pos[0], s._pos[1], s._pos[2]);
        else return s._pos;
        return s;
      }),
      (HowlerGlobal.prototype.orientation = function (n, r, i, s, o, u) {
        var a = this;
        if (!a.ctx || !a.ctx.listener) return a;
        var d = a._orientation;
        if (
          ((r = typeof r != "number" ? d[1] : r),
          (i = typeof i != "number" ? d[2] : i),
          (s = typeof s != "number" ? d[3] : s),
          (o = typeof o != "number" ? d[4] : o),
          (u = typeof u != "number" ? d[5] : u),
          typeof n == "number")
        )
          (a._orientation = [n, r, i, s, o, u]),
            typeof a.ctx.listener.forwardX < "u"
              ? (a.ctx.listener.forwardX.setTargetAtTime(
                  n,
                  Howler.ctx.currentTime,
                  0.1
                ),
                a.ctx.listener.forwardY.setTargetAtTime(
                  r,
                  Howler.ctx.currentTime,
                  0.1
                ),
                a.ctx.listener.forwardZ.setTargetAtTime(
                  i,
                  Howler.ctx.currentTime,
                  0.1
                ),
                a.ctx.listener.upX.setTargetAtTime(
                  s,
                  Howler.ctx.currentTime,
                  0.1
                ),
                a.ctx.listener.upY.setTargetAtTime(
                  o,
                  Howler.ctx.currentTime,
                  0.1
                ),
                a.ctx.listener.upZ.setTargetAtTime(
                  u,
                  Howler.ctx.currentTime,
                  0.1
                ))
              : a.ctx.listener.setOrientation(n, r, i, s, o, u);
        else return d;
        return a;
      }),
      (Howl.prototype.init = (function (n) {
        return function (r) {
          var i = this;
          return (
            (i._orientation = r.orientation || [1, 0, 0]),
            (i._stereo = r.stereo || null),
            (i._pos = r.pos || null),
            (i._pannerAttr = {
              coneInnerAngle:
                typeof r.coneInnerAngle < "u" ? r.coneInnerAngle : 360,
              coneOuterAngle:
                typeof r.coneOuterAngle < "u" ? r.coneOuterAngle : 360,
              coneOuterGain: typeof r.coneOuterGain < "u" ? r.coneOuterGain : 0,
              distanceModel:
                typeof r.distanceModel < "u" ? r.distanceModel : "inverse",
              maxDistance: typeof r.maxDistance < "u" ? r.maxDistance : 1e4,
              panningModel:
                typeof r.panningModel < "u" ? r.panningModel : "HRTF",
              refDistance: typeof r.refDistance < "u" ? r.refDistance : 1,
              rolloffFactor: typeof r.rolloffFactor < "u" ? r.rolloffFactor : 1,
            }),
            (i._onstereo = r.onstereo ? [{ fn: r.onstereo }] : []),
            (i._onpos = r.onpos ? [{ fn: r.onpos }] : []),
            (i._onorientation = r.onorientation
              ? [{ fn: r.onorientation }]
              : []),
            n.call(this, r)
          );
        };
      })(Howl.prototype.init)),
      (Howl.prototype.stereo = function (n, r) {
        var i = this;
        if (!i._webAudio) return i;
        if (i._state !== "loaded")
          return (
            i._queue.push({
              event: "stereo",
              action: function () {
                i.stereo(n, r);
              },
            }),
            i
          );
        var s =
          typeof Howler.ctx.createStereoPanner > "u" ? "spatial" : "stereo";
        if (typeof r > "u")
          if (typeof n == "number") (i._stereo = n), (i._pos = [n, 0, 0]);
          else return i._stereo;
        for (var o = i._getSoundIds(r), u = 0; u < o.length; u++) {
          var a = i._soundById(o[u]);
          if (a)
            if (typeof n == "number")
              (a._stereo = n),
                (a._pos = [n, 0, 0]),
                a._node &&
                  ((a._pannerAttr.panningModel = "equalpower"),
                  (!a._panner || !a._panner.pan) && t(a, s),
                  s === "spatial"
                    ? typeof a._panner.positionX < "u"
                      ? (a._panner.positionX.setValueAtTime(
                          n,
                          Howler.ctx.currentTime
                        ),
                        a._panner.positionY.setValueAtTime(
                          0,
                          Howler.ctx.currentTime
                        ),
                        a._panner.positionZ.setValueAtTime(
                          0,
                          Howler.ctx.currentTime
                        ))
                      : a._panner.setPosition(n, 0, 0)
                    : a._panner.pan.setValueAtTime(n, Howler.ctx.currentTime)),
                i._emit("stereo", a._id);
            else return a._stereo;
        }
        return i;
      }),
      (Howl.prototype.pos = function (n, r, i, s) {
        var o = this;
        if (!o._webAudio) return o;
        if (o._state !== "loaded")
          return (
            o._queue.push({
              event: "pos",
              action: function () {
                o.pos(n, r, i, s);
              },
            }),
            o
          );
        if (
          ((r = typeof r != "number" ? 0 : r),
          (i = typeof i != "number" ? -0.5 : i),
          typeof s > "u")
        )
          if (typeof n == "number") o._pos = [n, r, i];
          else return o._pos;
        for (var u = o._getSoundIds(s), a = 0; a < u.length; a++) {
          var d = o._soundById(u[a]);
          if (d)
            if (typeof n == "number")
              (d._pos = [n, r, i]),
                d._node &&
                  ((!d._panner || d._panner.pan) && t(d, "spatial"),
                  typeof d._panner.positionX < "u"
                    ? (d._panner.positionX.setValueAtTime(
                        n,
                        Howler.ctx.currentTime
                      ),
                      d._panner.positionY.setValueAtTime(
                        r,
                        Howler.ctx.currentTime
                      ),
                      d._panner.positionZ.setValueAtTime(
                        i,
                        Howler.ctx.currentTime
                      ))
                    : d._panner.setPosition(n, r, i)),
                o._emit("pos", d._id);
            else return d._pos;
        }
        return o;
      }),
      (Howl.prototype.orientation = function (n, r, i, s) {
        var o = this;
        if (!o._webAudio) return o;
        if (o._state !== "loaded")
          return (
            o._queue.push({
              event: "orientation",
              action: function () {
                o.orientation(n, r, i, s);
              },
            }),
            o
          );
        if (
          ((r = typeof r != "number" ? o._orientation[1] : r),
          (i = typeof i != "number" ? o._orientation[2] : i),
          typeof s > "u")
        )
          if (typeof n == "number") o._orientation = [n, r, i];
          else return o._orientation;
        for (var u = o._getSoundIds(s), a = 0; a < u.length; a++) {
          var d = o._soundById(u[a]);
          if (d)
            if (typeof n == "number")
              (d._orientation = [n, r, i]),
                d._node &&
                  (d._panner ||
                    (d._pos || (d._pos = o._pos || [0, 0, -0.5]),
                    t(d, "spatial")),
                  typeof d._panner.orientationX < "u"
                    ? (d._panner.orientationX.setValueAtTime(
                        n,
                        Howler.ctx.currentTime
                      ),
                      d._panner.orientationY.setValueAtTime(
                        r,
                        Howler.ctx.currentTime
                      ),
                      d._panner.orientationZ.setValueAtTime(
                        i,
                        Howler.ctx.currentTime
                      ))
                    : d._panner.setOrientation(n, r, i)),
                o._emit("orientation", d._id);
            else return d._orientation;
        }
        return o;
      }),
      (Howl.prototype.pannerAttr = function () {
        var n = this,
          r = arguments,
          i,
          s,
          o;
        if (!n._webAudio) return n;
        if (r.length === 0) return n._pannerAttr;
        if (r.length === 1)
          if (typeof r[0] == "object")
            (i = r[0]),
              typeof s > "u" &&
                (i.pannerAttr ||
                  (i.pannerAttr = {
                    coneInnerAngle: i.coneInnerAngle,
                    coneOuterAngle: i.coneOuterAngle,
                    coneOuterGain: i.coneOuterGain,
                    distanceModel: i.distanceModel,
                    maxDistance: i.maxDistance,
                    refDistance: i.refDistance,
                    rolloffFactor: i.rolloffFactor,
                    panningModel: i.panningModel,
                  }),
                (n._pannerAttr = {
                  coneInnerAngle:
                    typeof i.pannerAttr.coneInnerAngle < "u"
                      ? i.pannerAttr.coneInnerAngle
                      : n._coneInnerAngle,
                  coneOuterAngle:
                    typeof i.pannerAttr.coneOuterAngle < "u"
                      ? i.pannerAttr.coneOuterAngle
                      : n._coneOuterAngle,
                  coneOuterGain:
                    typeof i.pannerAttr.coneOuterGain < "u"
                      ? i.pannerAttr.coneOuterGain
                      : n._coneOuterGain,
                  distanceModel:
                    typeof i.pannerAttr.distanceModel < "u"
                      ? i.pannerAttr.distanceModel
                      : n._distanceModel,
                  maxDistance:
                    typeof i.pannerAttr.maxDistance < "u"
                      ? i.pannerAttr.maxDistance
                      : n._maxDistance,
                  refDistance:
                    typeof i.pannerAttr.refDistance < "u"
                      ? i.pannerAttr.refDistance
                      : n._refDistance,
                  rolloffFactor:
                    typeof i.pannerAttr.rolloffFactor < "u"
                      ? i.pannerAttr.rolloffFactor
                      : n._rolloffFactor,
                  panningModel:
                    typeof i.pannerAttr.panningModel < "u"
                      ? i.pannerAttr.panningModel
                      : n._panningModel,
                }));
          else
            return (
              (o = n._soundById(parseInt(r[0], 10))),
              o ? o._pannerAttr : n._pannerAttr
            );
        else r.length === 2 && ((i = r[0]), (s = parseInt(r[1], 10)));
        for (var u = n._getSoundIds(s), a = 0; a < u.length; a++)
          if (((o = n._soundById(u[a])), o)) {
            var d = o._pannerAttr;
            d = {
              coneInnerAngle:
                typeof i.coneInnerAngle < "u"
                  ? i.coneInnerAngle
                  : d.coneInnerAngle,
              coneOuterAngle:
                typeof i.coneOuterAngle < "u"
                  ? i.coneOuterAngle
                  : d.coneOuterAngle,
              coneOuterGain:
                typeof i.coneOuterGain < "u"
                  ? i.coneOuterGain
                  : d.coneOuterGain,
              distanceModel:
                typeof i.distanceModel < "u"
                  ? i.distanceModel
                  : d.distanceModel,
              maxDistance:
                typeof i.maxDistance < "u" ? i.maxDistance : d.maxDistance,
              refDistance:
                typeof i.refDistance < "u" ? i.refDistance : d.refDistance,
              rolloffFactor:
                typeof i.rolloffFactor < "u"
                  ? i.rolloffFactor
                  : d.rolloffFactor,
              panningModel:
                typeof i.panningModel < "u" ? i.panningModel : d.panningModel,
            };
            var p = o._panner;
            p ||
              (o._pos || (o._pos = n._pos || [0, 0, -0.5]),
              t(o, "spatial"),
              (p = o._panner)),
              (p.coneInnerAngle = d.coneInnerAngle),
              (p.coneOuterAngle = d.coneOuterAngle),
              (p.coneOuterGain = d.coneOuterGain),
              (p.distanceModel = d.distanceModel),
              (p.maxDistance = d.maxDistance),
              (p.refDistance = d.refDistance),
              (p.rolloffFactor = d.rolloffFactor),
              (p.panningModel = d.panningModel);
          }
        return n;
      }),
      (Sound.prototype.init = (function (n) {
        return function () {
          var r = this,
            i = r._parent;
          (r._orientation = i._orientation),
            (r._stereo = i._stereo),
            (r._pos = i._pos),
            (r._pannerAttr = i._pannerAttr),
            n.call(this),
            r._stereo
              ? i.stereo(r._stereo)
              : r._pos && i.pos(r._pos[0], r._pos[1], r._pos[2], r._id);
        };
      })(Sound.prototype.init)),
      (Sound.prototype.reset = (function (n) {
        return function () {
          var r = this,
            i = r._parent;
          return (
            (r._orientation = i._orientation),
            (r._stereo = i._stereo),
            (r._pos = i._pos),
            (r._pannerAttr = i._pannerAttr),
            r._stereo
              ? i.stereo(r._stereo)
              : r._pos
              ? i.pos(r._pos[0], r._pos[1], r._pos[2], r._id)
              : r._panner &&
                (r._panner.disconnect(0),
                (r._panner = void 0),
                i._refreshBuffer(r)),
            n.call(this)
          );
        };
      })(Sound.prototype.reset));
    var t = function (n, r) {
      (r = r || "spatial"),
        r === "spatial"
          ? ((n._panner = Howler.ctx.createPanner()),
            (n._panner.coneInnerAngle = n._pannerAttr.coneInnerAngle),
            (n._panner.coneOuterAngle = n._pannerAttr.coneOuterAngle),
            (n._panner.coneOuterGain = n._pannerAttr.coneOuterGain),
            (n._panner.distanceModel = n._pannerAttr.distanceModel),
            (n._panner.maxDistance = n._pannerAttr.maxDistance),
            (n._panner.refDistance = n._pannerAttr.refDistance),
            (n._panner.rolloffFactor = n._pannerAttr.rolloffFactor),
            (n._panner.panningModel = n._pannerAttr.panningModel),
            typeof n._panner.positionX < "u"
              ? (n._panner.positionX.setValueAtTime(
                  n._pos[0],
                  Howler.ctx.currentTime
                ),
                n._panner.positionY.setValueAtTime(
                  n._pos[1],
                  Howler.ctx.currentTime
                ),
                n._panner.positionZ.setValueAtTime(
                  n._pos[2],
                  Howler.ctx.currentTime
                ))
              : n._panner.setPosition(n._pos[0], n._pos[1], n._pos[2]),
            typeof n._panner.orientationX < "u"
              ? (n._panner.orientationX.setValueAtTime(
                  n._orientation[0],
                  Howler.ctx.currentTime
                ),
                n._panner.orientationY.setValueAtTime(
                  n._orientation[1],
                  Howler.ctx.currentTime
                ),
                n._panner.orientationZ.setValueAtTime(
                  n._orientation[2],
                  Howler.ctx.currentTime
                ))
              : n._panner.setOrientation(
                  n._orientation[0],
                  n._orientation[1],
                  n._orientation[2]
                ))
          : ((n._panner = Howler.ctx.createStereoPanner()),
            n._panner.pan.setValueAtTime(n._stereo, Howler.ctx.currentTime)),
        n._panner.connect(n._node),
        n._paused || n._parent.pause(n._id, !0).play(n._id, !0);
    };
  })();
})(Wg);
const za = 0.5;
function n7() {
  var l, c, f;
  const { playlist: e } = je(),
    [t, n] = C.useState({
      volume: za,
      paused: !1,
      currentSong: 0,
      currentTime: 0,
    });
  C.useEffect(() => {
    n((m) => ({ ...m, volume: za }));
  }, [za]);
  const [r, i] = C.useState(null),
    s = (m) => {
      var w;
      r && r.stop();
      const v = new Wg.Howl({
        src: [`./musics/${(w = e[m]) == null ? void 0 : w.file}.mp3`],
        autoplay: !0,
        loop: !0,
        volume: t.volume,
      });
      i(v), n((h) => ({ ...h, currentSong: m })), v.play();
    };
  C.useEffect(() => {
    const m = Math.floor(Math.random() * e.length);
    s(m);
  }, [e]),
    C.useEffect(() => {
      const m = (v) => {
        v.code === "Space" &&
          (v.preventDefault(),
          r &&
            (t.paused
              ? (r.play(), n((w) => ({ ...w, paused: !1 })))
              : (r.pause(), n((w) => ({ ...w, paused: !0 })))));
      };
      return (
        window.addEventListener("keydown", m),
        () => {
          window.removeEventListener("keydown", m);
        }
      );
    }, [r, t.paused]);
  const o = () => {
      r.pause(), n((m) => ({ ...m, paused: !0 }));
    },
    u = () => {
      r.play(), n((m) => ({ ...m, paused: !1 }));
    },
    [a, d] = C.useState("0%"),
    p = () => (r ? (r.seek() / r.duration()) * 100 + "%" : "0%");
  return (
    C.useEffect(() => {
      const m = setInterval(() => {
        d(p());
      }, 1e3);
      return () => {
        clearInterval(m);
      };
    }, []),
    _.jsxs("div", {
      className:
        "w-[19.625rem] p-3 rounded-[0.6875rem] bg-[#07080D33] flex items-center gap-4 relative z-[100]",
      style: { backdropFilter: "blur(35.915000915527344px)" },
      children: [
        _.jsx("img", {
          className:
            "w-[4.625rem] h-[4.625rem] object-cover rounded-[0.4375rem]",
          src: (l = e[t.currentSong]) == null ? void 0 : l.logo,
        }),
        _.jsxs("div", {
          className: "w-full",
          children: [
            _.jsx("p", {
              className:
                "font-roboto text-white font-semibold text-[1.125rem] leading-[90%]",
              children: (c = e[t.currentSong]) == null ? void 0 : c.songName,
            }),
            _.jsx("p", {
              className:
                "font-roboto text-white/50 font-normal text-sm leading-[90%]",
              children: (f = e[t.currentSong]) == null ? void 0 : f.author,
            }),
            _.jsxs("div", {
              className: "w-full mt-2 flex items-center",
              children: [
                _.jsx("div", {
                  className: "flex-1 h-[0.1875rem] bg-white/20",
                  children: _.jsx("div", {
                    className:
                      "h-full bg-white duration-500 transition-all rounded-full",
                    style: { width: p() },
                  }),
                }),
                t.paused
                  ? _.jsx(jw, { className: "cursor-pointer", onClick: u })
                  : _.jsx(Nw, { className: "cursor-pointer", onClick: o }),
              ],
            }),
          ],
        }),
      ],
    })
  );
}
function r7() {
  const [e, t] = C.useState(!0);
  ww("HandleDisplay", t);
  const { showKeyboard: n, showMusicPlayer: r, background: i } = je();
  return _.jsxs("div", {
    className: "w-full h-screen ",
    style: { visibility: e ? "visible" : "hidden" },
    children: [
      i &&
        _.jsx("iframe", {
          src: i,
          width: "100%",
          height: "100%",
          frameBorder: "0",
          allowFullScreen: !0,
          allow:
            "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture",
          className: "absolute left-0 top-0",
        }),
      _.jsx(oS, {}),
      _.jsx(lS, {}),
      _.jsx("div", {
        className: "z-50 absolute top-0 left-0 p-[3.75rem] w-full h-full",
        children: _.jsxs("div", {
          className: "w-full h-full  relative",
          children: [
            _.jsx(Cw, {}),
            _.jsx(zw, {}),
            _.jsx("div", {
              className: "absolute top-0 right-0",
              children: _.jsx(iS, {}),
            }),
            _.jsxs("div", {
              className: "absolute bottom-0",
              children: [
                _.jsx("div", {
                  className: "w-[51.875rem] mb-[1.375rem]",
                  children: _.jsxs(ks, {
                    children: [
                      _.jsx("div", {
                        style: { visibility: r ? "visible" : "hidden" },
                        children: _.jsx(n7, {}),
                      }),
                      n && _.jsx(t7, {}),
                    ],
                  }),
                }),
                _.jsx(Hw, {}),
              ],
            }),
          ],
        }),
      }),
    ],
  });
}
Ba.createRoot(document.getElementById("root")).render(
  _.jsx(_w, { children: _.jsx(r7, {}) })
);
