module.exports = function(grunt){

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
	
		copy: {
			index: {
				expand: true,
				cwd: 'wp/',
				src: ['index.php'],
				dest: './',
				options: {
			     	process: function (content, srcpath) {
			        	return content.replace(/wp\-/g,"wp/wp-");
			        }	
			    }
			},
			wp_content: {
				expand: true,
				cwd: 'wp/',
				src: ['wp-content/**/*'],
				dest: './'
			},
			wp_config_file: {
				expand: true,
				cwd: 'wpconfigfiles/',
				src: ['wp-config-sample.php'],
				dest: './'
			},
			wp_config_folder: {
				expand: true,
				cwd: 'wpconfigfiles/',
				src: ['wp-config/**'],
				dest: './'
			}
		},


	});

	grunt.loadNpmTasks('grunt-contrib-copy');
	
  	//grunt.loadNpmTasks('grunt-php');

	grunt.registerTask('default', ['copy:index', 'copy:wp_content', 'copy:wp_config_file', 'copy:wp_config_folder', 'update_wp_paths']);

	grunt.registerTask('update_wp_paths', function(){

		// remove wp/wp-config-sample.php so wordpress finds the correct one in the absolute root directory.
		grunt.file.delete('wp/wp-config-sample.php');
	});
}