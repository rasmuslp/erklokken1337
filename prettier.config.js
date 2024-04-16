/** @type {import('prettier').Config & import('prettier-plugin-astro').PluginOptions & import('prettier-plugin-tailwindcss').PluginOptions} */
const config = {
	singleQuote: true,
	plugins: ['prettier-plugin-astro', 'prettier-plugin-tailwindcss'],
	overrides: [
		{
			files: '*.astro',
			options: {
				parser: 'astro',
			},
		},
	],
};

export default config;
