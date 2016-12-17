# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# quando a pagina for carregada, -> significa a função a ser ultilizada
# notar que identação tem uma importancia nesse caso
# rails usa turbo links e esse page change também é acionado 
# quando o rails o ultiliza por tras da cena, ou seja mesmo antes de ser carregado
# $(document).on "ready page:change", ->
# 	toggle = $('#comment-toggle')
# 	a = $('#comments-section')
# 	toggle.click ->
# 	  a.fadeToggle 1000, ->
# 	    $('#comment_body').focus() # controller e campo text
# 	    return
# 	  return
