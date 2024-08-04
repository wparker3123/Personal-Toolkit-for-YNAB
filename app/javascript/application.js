// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "chartkick";
import "Chart.bundle";
import Highcharts from "highcharts";
import HC_drilldown from 'highcharts/modules/drilldown';
import "jquery"

HC_drilldown(Highcharts);
window.Highcharts = Highcharts;


//= require jquery3
//= require jquery_ujs
//= require_tree .
//= require jquery
