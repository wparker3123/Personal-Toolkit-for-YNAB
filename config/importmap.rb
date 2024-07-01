# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "chartkick", to: "chartkick.js"
pin "highcharts", to: "https://ga.jspm.io/npm:highcharts@11.0.1/highcharts.js"
pin "highcharts/modules/drilldown", to: "https://ga.jspm.io/npm:highcharts@11.0.1/modules/drilldown.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "chart_handler", to: "chart_handler.js"
