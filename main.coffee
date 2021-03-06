module.exports = ()->
   {app, BrowserWindow} = require('electron')

   #make reference to window
   win = null

   createWindow = () ->
      #create window
      win = new BrowserWindow
         width: props.windowWidth
         height: props.windowHeight
         frame: props.windowFrame
         resizable: props.windowResize
         fullscreen: props.windowFullscreen
         thickFrame: props.windowFrameThick

      #Open html file
      win.loadURL "file://#{__dirname}/index.html"

      #Open dev tools if prop set
      if props.openDevToolsStart then win.webContents.openDevTools()

      #Close when told to
      win.on 'closed', () ->
         win = null

   #Create window when ready
   app.on 'ready', createWindow

   #This is a mac thing,
   app.on 'window-all-closed', () ->
     if process.platform isnt 'darwin'
       app.quit()

   #Another mac thing
   app.on 'activate', ()->
     if not win?
       createWindow()
