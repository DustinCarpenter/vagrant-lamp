module.exports = function (grunt) {
  grunt.loadNpmTasks('grunt-wiredep');

  grunt.initConfig({
    wiredep: {
      app: {
        src: 'application/views/welcome_message.php'
      }
    }
  });
};
