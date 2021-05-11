module.exports = 
{
    // If needed, you can supply custom PostCSS plugins in the array below and CodeKit will run them.
    // The plugins must be installed in your Project's "node_modules" folder. Use the Packages
    // area in CodeKit to do that.
    //
    // WARNING:
    // If you add 'autoprefixer', 'tailwindcss', 'postcss-import', 'purgeCSS', or 'postcss-csso'
    // to your plugins array and supply options, CodeKit will overwrite the options in this config file 
    // with the values specified in CodeKit's UI. Use the UI to configure options for these plugins. 
    // If you MUST have full control, you can disable each plugin in the UI and provide your own 
    // configuration here. That is not recommended; it's a last-resort workaround for edge cases.
    //
    // By default, CodeKit runs your custom plugins BEFORE those built into the app. To change that, 
    // list ALL the plugins you want to run (both custom and built-in ones) in the order you want to 
    // run them. CodeKit will honor the order you specify.

    plugins: [
        // require('some-plugin-name'),
        // require('some-other-plugin')
    ]

    // If you need to pass options to plugins, delete the plugins array above and use this format:
    // plugins: {
    //     'some-plugin-name': {
    //         option1: true,
    //         option2: false,
    //         option3: ['item1', 'item2']
    //     },
    //     'some-other-plugin': {
    //          option1: 'value'
    //     }
    // }
}