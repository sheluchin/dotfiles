#!/usr/bin/env bb

(ns json-to-edn
  (:require [cheshire.core :as json]
            [clojure.java.shell :refer [sh]]
            [clojure.edn :as edn]
            [babashka.tasks :as tasks]))

(defn read-clipboard []
  (:out (sh "wl-paste")))

(defn clipboard-json->edn []
  (let [json-str (read-clipboard)
        edn-data (json/parse-string json-str true)]
    edn-data))

(defn clipboard-edn->json []
  (let [edn-str (read-clipboard)
        json-str (json/generate-string (edn/read-string edn-str))]
    json-str))

(defn ->clipboard [s]
  (tasks/shell {:in s} "clipman store"))

; (->clipboard (clipboard-edn->json))
(->clipboard (str (clipboard-json->edn)))
