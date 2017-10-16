module.exports = function(grunt){
	grunt.initConfig({
		coffee: {
			compile: {
		    files: {
		      'scripts/app.js': ['_source/scripts/app.coffee'] // compile and concat into single file 
		    }
		  },
		  compileJoined: {
		    options: {
		      join: true
		    },
		    files: {
		      'scripts/app.js': ['_source/scripts/app.coffee'] // compile and concat into single file 
		    }
		  }
		},
		sass: {                             
	    dist: {                         
	      files: {                         
	        'styles/app.css': '_source/styles/app.scss'       // 'destination': 'source'
	      }
	    }
	  },
	  watch: {
		  scripts: {
		    files: '_source/**/*.coffee',
		    tasks: ['coffee']
		  },
		  sass:    {
		  	files: '_source/**/*.scss',
		  	tasks: ['sass']
		  }
		},
		serve: {
        options: {
            port: 9000
        }
    }
	});
	grunt.loadNpmTasks('grunt-contrib-coffee');
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.registerTask('default', ['sass', 'coffee']);
	grunt.loadNpmTasks('grunt-serve');
};