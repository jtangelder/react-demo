module.exports = {
  module: {
    loaders: [
      { test: /\.coffee$/, loader: "jsx-loader!coffee-loader" },
      { test: /\.jsx?$/, loader: "jsx-loader" },   
      
      { test: /\.css/, loader: "style-loader/url!url-loader?limit=10000&minetype=text/css" },
      
      { test: /\.gif$/, loader: "url-loader?limit=10000&minetype=image/gif" },
      { test: /\.jpg$/, loader: "url-loader?limit=10000&minetype=image/jpg" },
      { test: /\.png$/, loader: "url-loader?limit=10000&minetype=image/png" },
    ]
  },
  define: {
    'process.env.NODE_ENV': JSON.stringify('production')
  }
};