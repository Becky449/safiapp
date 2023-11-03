const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: './app/javascript/application.js', // Update the entry path to your Rails asset pipeline
  devServer: {
    static: './public', // Update the static path to your Rails public folder
    open: true, // Automatically open the default browser
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './app/views/layouts/application.html.erb', // Update the template path to your Rails layout
      filename: 'application.html.erb', // Output filename in your Rails app/views/layouts directory
    }),
  ],
  output: {
    filename: 'application.js', // Output filename in your Rails app/assets/javascripts directory
    path: path.resolve(__dirname, 'public'), // Update the output path to your Rails public folder
    publicPath: '/public', // Public path for assets in your Rails app
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
