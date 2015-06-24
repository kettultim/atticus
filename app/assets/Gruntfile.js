'use strict';

module.exports = function(grunt) {

    grunt.initConfig({
      pkg: grunt.file.readJSON('package.json'),

      bower: {
          install: {
             options: {
                 targetDir: './lib',
                 layout: 'byType',
                 install: true,
                 verbose: false,
                 cleanTargetDir: false,
                 cleanBowerDir: false,
                 bowerOptions: {}
             }
          }
        },

      project: {
          app: ['app'],
          assets: ['assets'],
          css: ['sass/application.scss']
      },

      sass: {
          dev: {
              options: {
                  style: 'expanded',
                  compass: false
              },
              files: {
                  '../../vendor/assets/stylesheets/application.css':'<%= project.css %>'
              }
          }
      },

      watch: {
          sass: {
              files: 'sass/{,*/}*.{scss,sass}',
              tasks: ['sass:dev']
          }
      }

    });

    grunt.loadNpmTasks('grunt-bower-task');
    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', [
        'watch'
    ]);

};