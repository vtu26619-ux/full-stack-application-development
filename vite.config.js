import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  build: {
    // Output directory into Spring Boot's static folder
    outDir: 'src/main/resources/static',
    emptyOutDir: true,
  },
  server: {
    port: 5173,
    proxy: {
      '/api/otp': 'http://localhost:5000',
      '/api': 'http://localhost:8080'
    }
  }
});
