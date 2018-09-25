/**
  --- gulp4 configure ---
  npm install gulpjs/gulp-cli -g 
  npm install -D @babel/core @babel/preset-env babelify browserify fancy-log gulp gulp@next gulp-autoprefixer gulp-sass gulp-uglify vinyl-buffer vinyl-source-stream watchify
*/
const { series, parallel, src, dest, watch} = require('gulp');
const sass = require('gulp-sass');
const autoprefixer = require('gulp-autoprefixer');
const uglify = require('gulp-uglify');
const log = require('fancy-log');
const browserify = require('browserify');
const buffer = require('vinyl-buffer');
const sourceStream = require('vinyl-source-stream');
const babelify = require('babelify');
const watchify = require('watchify');
const currentFolder = process.env.INIT_CWD;

// Path
const path = {
    src_sass:   ''+currentFolder+'/src/assets/scss/**/*.scss',
    src_js:     ''+currentFolder+'/src/assets/js/script.js',
    public_css: ''+currentFolder+'/build/css/',
    public_js:  ''+currentFolder+'/build/js/',
    public:     ''+currentFolder+'/build/'
}

function styles() {
  return src(path.src_sass)
    .pipe(sass({sourceComments: false, outputStyle: 'compressed'})
        .on('error', sass.logError))
    .pipe(autoprefixer())
    .pipe(dest(path.public));
}

function _watchify () {
    watchify.args.debug = true;
    const bundler = watchify(browserify(path.src_js, watchify.args)).transform(babelify, {
        presets : ["@babel/env"]
    });
    const rebundle = () => {
        return bundler.bundle()
            .on('error', (e) => {
                log.error('Browserify Error: ' + e.message);
            })
            .pipe(sourceStream('script.js'))
            .pipe(dest(path.public));
    };
    bundler.on('update', rebundle);
    bundler.on('log', log.bind(log));
    return rebundle();
}

// for build
function _browserify () {
    process.env.NODE_ENV = 'production';
    return browserify(path.src_js)
        .transform(babelify, {
        presets : ["@babel/env"]
        })
        .bundle()
        .on('error', (e) => {
            log.error('Browserify Error: ' + e.message);
        })
        .pipe(sourceStream('script.js'))
        .pipe(buffer({compress: true}))
        .pipe(uglify())
        .pipe(dest(path.public));
}

function watchTasks() {
  watch(path.src_sass, series(styles));
  _watchify();
}

exports.build = series(styles, _browserify);
exports.default = series(styles, _watchify, watchTasks);
