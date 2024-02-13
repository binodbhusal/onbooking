# Pin npm packages by running ./bin/importmap
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "el-transition" # @0.0.7
pin "geolib", to: "https://ga.jspm.io/npm:geolib@3.3.4/es/index.js"
pin "lodash-es", to: "https://ga.jspm.io/npm:lodash-es@4.17.21/lodash.js"
pin "vanillajs-datepicker", to:"https://ga.jspm.io/npm:vanillajs-datepicker@1.3.4/js/main.js"
