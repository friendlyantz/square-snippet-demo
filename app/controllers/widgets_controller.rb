class WidgetsController < ApplicationController
  protect_from_forgery except: %i[vanillajs_demo bootstrap_demo]

  def show
    version = params[:id] if %w[vanillajs bootstrap react svelte].include? params[:id]
    @js_location = "/widgets/#{version}_demo.js"
    @js_location = Webpacker.manifest.lookup!("widget_demo_react.js") if version == "react"
    @js_location = Webpacker.manifest.lookup!("widget_demo_svelte.js") if version == "svelte"
  end
end