console.log 'Linking Script Definitions...'
reqall __dirname+"\\"

if props.autoGenEvents
   console.log 'Dynamically Creating Game Event Functions...'
   window.updateFunctions = []
   window.drawFunctions = []
   window.initFunctions = []


   # Add update functions
   for key of window
      if key.toLowerCase().replace('update_', "") isnt key.toLowerCase()
         if typeof window[key] is "function"
               updateFunctions.push window[key]

   # Add draw functions
   for key of window
      if key.toLowerCase().replace('draw_', "") isnt key.toLowerCase()
         if typeof window[key] is "function"
            drawFunctions.push window[key]

   # Add init functions
   for key of window
      if key.toLowerCase().replace('init_', "") isnt key.toLowerCase()
         if typeof window[key] is "function"
            initFunctions.push window[key]

   window.game_update = ()->
      for func in updateFunctions
         func()

   window.game_draw = (ctx)->
      game_update()
      for func in drawFunctions
         func(ctx)

   window.game_init = ()->
      for func in initFunctions
         func()
