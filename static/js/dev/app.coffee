#======================
#! VARIABLES Y PÁGINAS
#======================

$j = jQuery 

# isVotacion = $j '.votacion'

# ------------------
#     FUNCIONES
# ------------------

$j ->
  
#   
#   if isRightColumn.length > 0
#     $j('.toggle-right').click ->
#       isRightColumn.toggleClass('right-closed')
#       $j('.reveal').addClass('hidden')
#       $j(this).toggleClass('gira')
#       $j('.left-bar').addClass('slideBar')
#       $j('.menu-hidden .btn.hideLeft').hide()
#       $j('.menu-hidden .btn.showLeft').show()
#       
#   if isReveal.length > 0
#     $j(isReveal).click ->
#       $j(this).next().toggleClass('hidden')
#   Select: Heredar clases para pasar atributos visuales
#   if selectpickercalled
#     selectp = $j '.bootstrap-select'
#     selectp.each ->
#       selectC = $j(this).children('.dropdown-toggle')
#       selectC.attr('class',$j(this).attr('class')).removeClass('btn-group bootstrap-select')
#       $j(this).removeClass('btn')
#   
#   Al pagar que aparezca el botón de paypal
#   if isPago.length > 0
#     $j('.btnPago').click ->
#       $j(this).css({'display':'none'})
#       $j('.paypago').css({'display':'inherit'})
#   Puntuar: iluminar estrellas
#   if isVotacion.length > 0
#     $j('.votacion.no-votado .icon-star').hover \
#       ( -> $j(this).prevAll().addClass('active')),
#       ( -> $j('.votacion.no-votado .icon-star').removeClass('active'))
#     
#   Banner: abrir al pulsar en más info
#   if isBannerAnimated.length > 0
#     $j('.more-info.azul').click ->
#       $j('.banner').toggleClass('open')
#   
#   Warning: ocultar con botón
#   $j('.infoBar.warning .btn').click ->
#     $j(this).parent().css({'display':'none'})
#     $j('.downBody').css({'margin-top':'0'})
#   
# 
#   
#   Animación pasos
#   if isPasos.length > 0
#     functionTimeOut = (a) ->
#       timer = undefined
#       delay = 500
#       timer = setTimeout(->
#         a.addClass('activo')
#       , delay)
#     liFirst = $j('.pasos li:first')
#     liLast = $j('.pasos li:last')
#     $j('.pasos li .play').click (->
#       li = $j(this).parent()
#       if li.is(liFirst)
#         li.removeClass('activo')
#         functionTimeOut(li.next())
#       else if li.is(liLast)
#         li.removeClass('activo')
#         functionTimeOut(liFirst)
#       else
#         li.removeClass('activo')
#         functionTimeOut(li.next())
#     )
#     $j('.pasos li .rewind').click (->
#       li = $j(this).parent()
#       if li.is(liFirst)
#         li.removeClass('activo')
#         functionTimeOut(liLast)
#       else if li.is(liLast)
#         li.removeClass('activo')
#         functionTimeOut(li.prev())
#       else
#         li.removeClass('activo')
#         functionTimeOut(li.prev())
#     )
#   
#   Search-results fade on focus search input
#   if isSearch.length > 0
#     results = $j('.results-content')
#     inputSearch = $j('.modal.fade .giant')
#     inputSearch.focus ->
#       results.removeClass('oculto')
#       
#     $j(document).mouseup (e) ->
#       if not results.is(e.target) and results.has(e.target).length is 0 and not inputSearch.is(e.target)
#         results.addClass('oculto')
# 
#   Tasks -> users aparecen después de más info
#   if isTasks.length > 0
#     task = $j('li.task')
#     userTask = $j('.asignada')
#     timer = undefined
#     delay = 200
#     task.hover (->
#       etask = $j(this)
#       timer = setTimeout(->
#         etask.find(userTask).addClass('show')
#       , delay)
#     ), ->
#       clearTimeout timer
#       userTask.removeClass('show')
#     
#   Para que bajen las barras de invitación o login
#   if isLogin.length > 0
#     barBaja = (barra,boton,input,verdad) ->
#       boton.click ->
#         barra.addClass('down')
#         input.focus()
#         if verdad
#           clase = $j('.darken')
#           clase.addClass('visible')
#       barra.click ->
#         barra.addClass('down')
#         Si la variable verdad es true añadimos la capa de opacidad verde
#         if verdad
#           clase = $j('.darken')
#           clase.addClass('visible')
#       $(document).mouseup (e) ->
#         if not barra.is(e.target) and barra.has(e.target).length is 0
#           if verdad
#             barra.removeClass('down')
#             $j('.darken').removeClass('visible')
# 
#     barBaja($j('.progress-top-bar form.login'),$j('.logbtn'),$j('.progress-top-bar form.login .first'),true)
#     barBaja($j('.progress-top-bar form.invite'),$j('.invitebtn'),$j('.progress-top-bar form.invite .second'),true)
#     barBaja($j('.progress-top-bar form.invite'),$j('.modal-invite'),$j('.progress-top-bar form.invite .second'),true)
# 
#   Si infobar mover body
#   if $j(".infoBar").length
#     $j('body').addClass('downBody') 
#     
#   Autoscroll home
#   if isHome.length > 0
#     offsetAfi = $j(".faficiones").offset().top
#     offsetFam = $j(".fandfriends").offset().top
#     offsetCom = $j(".fcompras").offset().top
#     $j(".aficat").click ->
#       $j("html,body").animate
#         scrollTop: offsetAfi - 90
#       , 800
#   
#     $j(".compracat").click ->
#       $j("html,body").animate
#         scrollTop: offsetCom - 90
#       , 800
#   
#     $j(".famcat").click ->
#       $j("html,body").animate
#         scrollTop: offsetFam - 90
#       , 800
#   
#   En joinities form intercambiar subida de archivos y escribir mensajes
#   if isWrite.length > 0
#     $j('.write .changeTo').click ->
#       $j('.photoUpload').removeClass('hide')
#       $j('.write').addClass 'hide'
#     $j('.photoUpload .changeTo').click ->
#       $j('.photoUpload').addClass('hide')
#       $j('.write').removeClass 'hide'
#   
#   Botón responder muestra comentarios
# 
#   if isResponderComentario.length > 0
#     $j('.answer').click ->
#       $j(this).next().removeClass 'hide'
#       $j(this).addClass 'hide'
#     
#   En tamaño tablet el menu hidden muestra la barra lateral izquierda
#   $j('.menu-hidden .btn.showLeft').click ->
#     $j('.left-bar').removeClass('slideBar')
#     $j(this).hide()
#     $j('.menu-hidden .btn.hideLeft').css({'display':'inline-block'})
#     $j('.right-column').addClass('right-closed')
#     $j('.toggle-right').removeClass('gira')
#   $j('.menu-hidden .btn.hideLeft').click ->
#     $j('.left-bar').addClass('slideBar')
#     $j(this).hide()
#     $j('.menu-hidden .btn.showLeft').show()
# 
#   Borrar esto y sustituirlo por código backend
#   if isUnlogged.length > 0
#     if $j('.progress-top-bar').hasClass('unlogged')
#       $j('body').addClass('unlogged')
# 
#   Para subir imágenes, cuando hay una imagen
#   if isSubeImagen.length > 0
#     $j('.cambiaImagen .img').click ->
#       $j('.upload').removeClass('existe')
#       $j(this).addClass('existe') 
# 
#   En formularios mostrar el campo siguiente si hacemos click en un radio
#   if isMuestraFormSiguiente.length > 0
#     $j('.muestra-siguiente').click ->
#       $j(this).parent().parent().addClass('hidden')
#       $j(this).parent().parent().next().removeClass('hidden')
#       
#   if isComprasReservas.length > 0
#     $j('.navRight a').click ->
#       if $j(this).hasClass('c0')
#         offTop = $j(".navLeft .c0").offset().top
#       if $j(this).hasClass('c1')
#         offTop = $j(".navLeft .c1").offset().top
#       if $j(this).hasClass('c2')
#         offTop = $j(".navLeft .c2").offset().top
#       if $j(this).hasClass('c3')
#         offTop = $j(".navLeft .c3").offset().top
#       $j("html,body").animate
#         scrollTop: offTop - 30
#       , 800
#     
#   Formulario creación de joinities: variables que me pide Toni
#   if isCreacionJoinities.length > 0
#     Función que duplica
#     duplicateF = (claseBase) ->
#       nombre = $j(claseBase).parent().attr('class')
#       numeroArray = nombre.split('\_')
#       numeroString = numeroArray[1]
#       numer = parseInt( numeroString, 10 );
#       numero = numer + 1
#       nuevo = '<div class="inputG"><div class="inputgrupo'+'_'+numero+'"><input type="hidden" name="n_lugares" value='+numero+'><input class="form-control normal input'+'_'+numero+'" name="lugar'+'_'+numero+'"><div class="btn amarillo small text-transform"><i class="icon-plus"></i></div></div></div>'
#       $j(claseBase).parent().parent().parent().append nuevo
#       nuevoInput = '.inputgrupo'+'_'+numero
#       $j(nuevoInput).children('.btn').click ->
#         $j(this).addClass('hidden')
#         duplicateF(this)
#       
#     $j('.inputG').children().children('.btn').click ->
#       $j(this).addClass('hidden')
#       duplicateF(this)
#       
#   AUTOSCROLL
#   if isAutoscroll.length > 0
#     $('.auto-scroll').click ->
#       event.preventDefault();
#       target = $(this).attr('href')
#       offsetTarget = $j(target).offset().top
#       $j("html,body").animate
#         scrollTop: offsetTarget - 90
#       , 800
#   
#   Borrar inputs con botón
#   if isInput.length > 0
#     $j('<div class="btn small icon-btn clearInput float-right"><i class="icon-remove-circle icon-large"></i></div><div class="clear-both"></div>').insertAfter '.second-column .form-control.normal'
#     $j('.clearInput').click ->
#       $j(this).parent().children('input').val('')
# 
#   if isListaLarga.length > 0
#     $j('.long-list').each ->
#       size = $j('li',this).length
#       sliceNumber = 5
#       if size <= sliceNumber
#         $j('.load-more',this).parent().hide()
#       $j('li.table',this).slice(sliceNumber).css({'display':'none'})
#       $j('.load-more',this).click ->
#         if size > sliceNumber
#           litable = $j(this).parent().parent().children('li.table')
#           sliceNumber = sliceNumber + 5
#           litable.css({'display':'inherit'})
#           litable.slice(sliceNumber).css({'display':'none'})
#         else
#           $j(this).text('No hay más resultados')
#           $j(this).fadeTo('slow',0)