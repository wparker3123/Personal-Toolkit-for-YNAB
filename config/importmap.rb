# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers", preload: true
pin "chartkick", to: "chartkick.js"
pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.js"
pin "@rails/ujs", to: "https://cdn.jsdelivr.net/npm/@rails/ujs@7.1.3-4/app/assets/javascripts/rails-ujs.min.js"
pin "highcharts", to: "https://ga.jspm.io/npm:highcharts@11.0.1/highcharts.js"
pin "highcharts/modules/drilldown", to: "https://ga.jspm.io/npm:highcharts@11.0.1/modules/drilldown.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "chart_handler", to: "chart_handler.js"
