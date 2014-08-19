(defun ms-proxy-on ()
  (interactive)
  (setq url-proxy-services (quote (("http" . "proxyv.dpn.deere.com:81") ("https" . "proxyv.dpn.deere.com:81")))))

(defun ms-proxy-off ()
  (interactive)
  (setq url-proxy-services nil))
