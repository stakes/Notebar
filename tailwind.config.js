// This file controls how Tailwind processes your CSS. For details, see
// https://tailwindcss.com/docs/configuration

module.exports = 
{
  //
  // WARNING: CodeKit overwrites all properties of the "purge" object (except those below) with values from the UI.
  // Visit [Project Settings > Tools > PurgeCSS] to specify content and options. The values below can be
  // uncommented and edited if needed; all others are controlled by CodeKit.
  //
  // purge: {
  //   preserveHtmlElements: true,
  //   layers: ['base', 'components', 'utilities']
  // },


  //
  // All other TailwindCSS options are 100% under your control. Edit this config file as shown in the Tailwind Docs
  // to enable the settings or customizations you need.
  // 
  theme: {
    fontFamily: {
      'sans': ['Libre Franklin', '-apple-system', 'sans-serif']
    },
    extend: {}
  },

  variants: {},

  //
  // If you want to run any Tailwind plugins (such as 'tailwindcss-typography'), simply install those into the Project via the
  // Packages area in CodeKit, then pass their names (and, optionally, any configuration values) here. 
  // Full file paths are not necessary; CodeKit will find them.
  //
  plugins: []
}