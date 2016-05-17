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
			wp_plugins: {
				cwd: './wp-content/plugins',  // set working folder / root to copy
			    src: '**/*',           // copy all files and subfolders
			    dest: 'wp/wp-content/plugins',    // destination folder
			    expand: true           // required when using cwd
			},
			wp_config_file: {
				filter: 'isFile',
				src: ['./resources/wpconfigfiles/wp-config-sample.php'],
				dest: './wp-config.php'
			},
			wp_config_folder: {
				expand: true,
				cwd: './resources/wpconfigfiles/',
				src: ['wp-config/**'],
				dest: './'
			}
			/* wp_theme_general: {
				expand: true,
				cwd: 'resources/themes/',
				src: ['general/**'],
				dest: 'wp-content/themes/'
			}*/
		},


	});

	grunt.loadNpmTasks('grunt-contrib-copy');

	//grunt.loadNpmTasks('grunt-browser-sync');
	
  	//grunt.loadNpmTasks('grunt-php');

	grunt.registerTask('default', ['copy:index', 'copy:wp_plugins', 'copy:wp_config_file', 'copy:wp_config_folder', 'delete_files']);

	grunt.registerTask('delete_files', function(){

		// remove wp/wp-config-sample.php so wordpress finds the correct one in the absolute root directory.
		grunt.file.delete('wp/wp-config-sample.php');

		grunt.file.delete('./resources/');

		grunt.file.delete('./wp-content/');

		grunt.file.delete('./wp/wp-content/plugins/hello.php');
	});
}