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
				cwd: './resources/wpconfigfiles/',
				src: ['wp-config-sample.php'],
				dest: './'
			},
			wp_config_folder: {
				expand: true,
				cwd: './resources/wpconfigfiles/',
				src: ['wp-config/**'],
				dest: './'
			},
			wp_theme_general: {
				expand: true,
				cwd: './resources/themes/',
				src: ['general/**'],
				dest: './wp-content/themes/'
			}
		},


	});

	grunt.loadNpmTasks('grunt-contrib-copy');

	//grunt.loadNpmTasks('grunt-browser-sync');
	
  	//grunt.loadNpmTasks('grunt-php');

	grunt.registerTask('default', ['copy:index', 'copy:wp_content', 'copy:wp_config_file', 'copy:wp_config_folder', 'delete_files']);

	grunt.registerTask('delete_files', function(){

		// remove wp/wp-config-sample.php so wordpress finds the correct one in the absolute root directory.
		grunt.file.delete('./wp/wp-config-sample.php');

		grunt.file.delete('./wp/wp-content/');

		grunt.file.delete('./resources/');
	});
}