module.exports={
  devServer: {
    proxy: {
      '/': {
        target: `http://127.0.0.1:6060`,
        changeOrigin: true,
      }
    }
  }
}