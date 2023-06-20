import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import tailwind from '@astrojs/tailwind';
import robotsTxt from 'astro-robots-txt';

// https://astro.build/config
export default defineConfig({
  site: 'https://erklokken1337.dk',
  integrations: [
      robotsTxt({
        policy: [{
          userAgent: '*',
          disallow: '\,'
        }]
      }),
      sitemap({
        lastmod: new Date()
      }),
      tailwind()
    ]
});