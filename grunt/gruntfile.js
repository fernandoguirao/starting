module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
coffee: {
  compile: {
    files: {
      '../static/js/dev/app.js': '../static/js/dev/app.coffee',
      '../static/js/dev/start.js': '../static/js/dev/start.coffee' 
    }
  }
},
less: {
  production: {
    options: {
      paths: ["../static/css"],
      cleancss: true
    },
    files: {
      "../static/css/app.css": "../static/css/app.less"
    }
    }
  },
    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src: ['../static/js/dev/jquery.js','../static/js/dev/tooltip.js','../static/js/dev/bootstrap/*.js','../static/js/dev/plugins/*.js','../static/js/dev/start.js','../static/js/dev/app.js'],
        dest: '../static/js/<%= pkg.name %>.js'
      }
    },
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
      },
      dist: {
        files: {
          '../static/js/<%= pkg.name %>.min.js': ['<%= concat.dist.dest %>']
        }
      }
    },
    jadephp: {
    compile: {
      expand: true,
      cwd: '../views',
      src: ['**/*.jade'],
      dest: '../views/',
      ext: '.phtml'
    }
  },
  prettify: {
        options: {
          prettifyrc: '.prettifyrc',
          indent: 2,
          indent_char: ' '
        },
        all: {
          expand: true,
          cwd: '../views',
          ext: '.phtml',
          src: ['**/*.phtml'],
          dest: '../views/'
        }
      },




      watch : {
          jadephp : {
              files: '../views/**/*.jade',
              tasks: ['jadephp']
          },
          less : {
              files: ['../static/css/app.less','../static/css/custom/**/*.less'],
              tasks: ['less']
          },
          coffee : {
              files: ['../static/js/dev/app.coffee','../static/js/dev/start.coffee'],
              tasks: ['coffee']
          },
          concat : {
              files: ['../static/js/dev/app.js','../static/js/dev/start.js'],
              tasks: ['concat']
          },
          uglify : {
              files: ['../static/js/app.js'],
              tasks: ['uglify']
          }
      }

  /*
  jadephp: {
    combine: {
      files: {
        'path/to/output.phtml': ['path/to/input_one.jade', 'path/to/input_two.jade']
      }
    }
  }
  */
  });

  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-jade-php');
  grunt.loadNpmTasks('grunt-prettify');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('default', ['coffee','less','concat', 'uglify','jadephp','prettify']);

};