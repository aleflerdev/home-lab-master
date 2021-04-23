# imagemin [![Build Status](https://camo.githubusercontent.com/8680a7d2afd695af3b459756beb678201d942c0d/68747470733a2f2f7472617669732d63692e636f6d2f696d6167656d696e2f696d6167656d696e2e7376673f6272616e63683d6d6173746572)](https://travis-ci.com/github/imagemin/imagemin)

> Minify images seamlessly

## Install

```
$ npm install imagemin
```

## Usage

```
const imagemin = require('imagemin');
const imageminJpegtran = require('imagemin-jpegtran');
const imageminPngquant = require('imagemin-pngquant');

(async () => {
	const files = await imagemin(['images/*.{jpg,png}'], {
		destination: 'build/images',
		plugins: [
			imageminJpegtran(),
			imageminPngquant({
				quality: [0.6, 0.8]
			})
		]
	});

	console.log(files);
	//=> [{data: <Buffer 89 50 4e …>, destinationPath: 'build/images/foo.jpg'}, …]
})();
```

## API

### imagemin(input, options?)

Returns `Promise<object[]>` in the format `{data: Buffer, sourcePath: string, destinationPath: string}`.

#### input

Type: `string[]`

File paths or [glob patterns](https://github.com/sindresorhus/globby#globbing-patterns).

#### options

Type: `object`

##### destination

Type: `string`

Set the destination folder to where your files will be written. If no destination is specified, no files will be written.

##### plugins

Type: `Array`

[Plugins](https://www.npmjs.com/browse/keyword/imageminplugin) to use.

##### glob

Type: `boolean`
Default: `true`

Enable globbing when matching file paths.

### imagemin.buffer(buffer, options?)

Returns `Promise<Buffer>`.

#### buffer

Type: `Buffer`

Buffer to optimize.

#### options

Type: `object`

##### plugins

Type: `Array`

[Plugins](https://www.npmjs.com/browse/keyword/imageminplugin) to use.

## Hosted API

We also provide a hosted API for imagemin which may simplify your use case.

[<img src="https://camo.githubusercontent.com/259fc5186d33d3625c7b79ecb80e32678fecf681/68747470733a2f2f6261646765732e736161736966792e73683f746578743d56696577253230486f73746564253230415049" alt="img" style="zoom:50%;" />](https://imagemin.saasify.sh/)

## Related

- [imagemin-cli](https://github.com/imagemin/imagemin-cli) - CLI for this module
- [imagemin-app](https://github.com/imagemin/imagemin-app) - GUI app for this module
- [gulp-imagemin](https://github.com/sindresorhus/gulp-imagemin) - Gulp plugin
- [grunt-contrib-imagemin](https://github.com/gruntjs/grunt-contrib-imagemin) - Grunt plugin