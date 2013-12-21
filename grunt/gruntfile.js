module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    
    /* COFFE */
    coffee: {
      compile: {
        files: {
          '../static/js/dev/app.js': '../static/js/dev/app.coffee',
          '../static/js/dev/start.js': '../static/js/dev/start.coffee' 
        }
      }
    },
    
    /* LESS */
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
    
    /* CONCAT JS */
    concat: {
      options: {
        separator: ';'
      },
      dist: {
        src: ['../static/js/dev/jquery.js','../static/js/dev/tooltip.js','../static/js/dev/bootstrap/*.js','../static/js/dev/jquery-ui.js','../static/js/dev/video.js','../static/js/dev/imagesloaded.js','../static/js/dev/plugins/*.js','../static/js/dev/start.js','../static/js/dev/app.js'],
        dest: '../static/js/<%= pkg.name %>.js'
      }
    },
    
    /* UGLIFY JS */
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
    
    /* JADE TO PHP */
    jadephp: {
      compile: {
        expand: true,
        cwd: '../views/jade',
        src: ['**/*.jade'],
        dest: '../views/phtml/',
        ext: '.phtml'
      }
    },
    
    /* PRETTIFY PHP */
    prettify: {
      options: {
        prettifyrc: '.prettifyrc',
        indent: 2,
        indent_char: ' '
      },
      all: {
        expand: true,
        cwd: '../views/phtml',
        ext: '.phtml',
        src: ['**/*.phtml'],
        dest: '../views/phtml/'
      }
    },
    
    /* WATCH */
    watch : {
      jadephp : {
        files: '../views/jade/**/*.jade',
        tasks: ['jadephp']
      },
      prettify : {
        files: '../views/phtml/**/*.phtml',
        tasks: ['prettify']
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