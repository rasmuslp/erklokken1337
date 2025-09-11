import path from 'node:path';

import type { APIRoute } from 'astro';
import sharp from 'sharp';
import ico from 'sharp-ico';

// Relative to project root
const faviconSrc = path.resolve('src/images/favicon.png');

export const GET: APIRoute = async () => {
	const pngBuffer = await sharp(faviconSrc)
		.resize(32)
		.toFormat('png')
		.toBuffer();
	const icoBuffer = ico.encode([pngBuffer]);
	const buffer = Buffer.from(icoBuffer);

	return new Response(buffer, {
		headers: { 'Content-Type': 'image/x-icon' },
	});
};
