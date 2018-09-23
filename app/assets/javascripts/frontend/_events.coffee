((window, document, $, ProJ) ->
  'use strict'

  ProJ.fn ?= {}


  ProJ.fn.onload = ->
    ProJ('[data-click]').each -> @.on 'click', @dataset.click
    ProJ
      .lazyload()
      .carousel()
      .ymaps()
      .fn.bgswitcher()
    # ProJ('.pro-header--home').canvasSnow()
    ProJ('.pro-header--grid').canvasGrid()
    $('.pro-navbar').addClass 'h-gradient--top'
    # $('.pro-preload').fadeOut 'slow'
    @


  ProJ.fn.onready = ->
    (new WOW offset: 0).init()
    ProJ('a.is-active, .is-active > a, a.active, .active > a').deactive()
    ProJ('[data-ymet]').ymet()
    ProJ('[data-w3c]').w3c()
    ProJ.fn.submit()
    ProJ
      .base64()
      .mailto()
      .scroll()
      .lightbox()
      .redactor()
    $ window
      .scroll ProJ.fn.scroll
    @

) window, document, jQuery, ProJ