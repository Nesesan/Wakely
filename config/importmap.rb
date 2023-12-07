# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "picmo", to: "https://ga.jspm.io/npm:picmo@5.8.5/dist/index.js"
pin "timepicker-ui", to: "https://ga.jspm.io/npm:timepicker-ui@2.6.1/dist/timepicker-ui.esm.js"
