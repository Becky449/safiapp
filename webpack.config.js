const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: './app/javascript/application.js',
  devServer: {
    static: './public',
    open: true,
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './app/views/layouts/application.html.erb',
      filename: 'application.html.erb',
    }),
  ],
  output: {
    filename: 'application.js',
    path: path.resolve(__dirname, 'public'),
    publicPath: '/public', 
  },
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: ['style-loader', 'css-loader'],
      },
      {
        test: /\.(woff(2)?|eot|ttf|otf|svg)$/,
        type: 'asset/inline', // Handle font files as inline assets
      },
    ],
  },
  mode: 'development',
};
