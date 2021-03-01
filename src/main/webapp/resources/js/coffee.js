var aIndex = 0;
var dataCnt = 0 // 160928 상세검색 결과 값

$(function () {

  product_list();   //product_list 설정

  // product_list_wrap();   //product_list_wrap 설정

  content_tabmenu();   //content_tabmenu 설정

  finder_list();   //finder_list 설정 (나와 어울리는 커피 찾기 리스트)

  find_taste();   //find_taste 설정 (나와 어울리는 커피 찾기 질문)

  selectbox_init();              //selectbox 디자인 설정

  $("ul.opt").hide();

  //셀렉트바를 클릭했을 때
  $("#cf_select_wrap .select, #cf_select_wrap2 .select, #cf_select_wrap3 .select, #cf_select_wrap p span, #cf_select_wrap2 p span, #cf_select_wrap3 p span").bind("click", function () {
    $(this).parent().next().toggle();
  });

  //마우스가 셀렉트 영역을 벗어났을 때
  $("#cf_select_wrap, #cf_select_wrap2, #cf_select_wrap3").bind("mouseleave", function () {
    $(this).find(".opt").hide();
  });



  // 분류 보기 - 카테고리 별 & 서비스 별
  $("dl.product_kind_tab > dt > a:not(.selected)").parent().next().hide();

  $("dl.product_kind_tab > dt > a").bind("click", function () {
    $("dl.product_kind_tab > dt > a").removeClass("selected");
    $(this).addClass("selected");
    $("dl.product_kind_tab > dd").hide();
    $(this).parent().next().show();

    var index = $("dl.product_kind_tab > dt > a").index(this);
    aIndex = index;

    $(".product_result_wrap").hide();
    $(".product_result_wrap").eq(index).show();

    $('.product_select_wrap:eq(' + index + ') input[type=checkbox]').eq(0).prop('checked', true).change();
    $('.product_select_wrap:eq(' + index + ') input[type=checkbox]').not(':eq(0)').prop('checked', false).change();

    $('ul.opt').find('input[type=checkbox]').removeAttr('checked');
    $('ul.opt').find('input[type=checkbox]').trigger('change');

    $('.product_select_wrap:eq(' + index + ') input[type=checkbox]').unbind('click').bind('click', function (e) {
      cate_chk_idx = $('.product_select_wrap:eq(' + index + ') input[type=checkbox]').index($(this));
      cate_chk_stat = $(this).is(':checked');

      if (cate_chk_idx == 0 && cate_chk_stat) {
        $('.product_select_wrap:eq(' + index + ') input[type=checkbox]').not(':eq(0)').removeAttr('checked');
        $('.product_select_wrap:eq(' + index + ') input[type=checkbox]').not(':eq(0)').trigger('change');
      } else if (cate_chk_idx != 0 && cate_chk_stat) {
        $('.product_select_wrap:eq(' + index + ') input[type=checkbox]').eq(0).removeAttr('checked');
        $('.product_select_wrap:eq(' + index + ') input[type=checkbox]').eq(0).trigger('change');
      }

      showProductList();
    });

    showProductList();

    getCoffeeDataSet();

    return false;
  });

  $('.product_select_wrap:eq(0) input[type=checkbox]').bind('click', function (e) {
    cate_chk_idx = $('.product_select_wrap:eq(0) input[type=checkbox]').index($(this));
    cate_chk_stat = $(this).is(':checked');

    if (cate_chk_idx == 0 && cate_chk_stat) {
      $('.product_select_wrap:eq(0) input[type=checkbox]').not(':eq(0)').removeAttr('checked');
      $('.product_select_wrap:eq(0) input[type=checkbox]').not(':eq(0)').trigger('change');
    } else if (cate_chk_idx != 0 && cate_chk_stat) {
      $('.product_select_wrap:eq(0) input[type=checkbox]').eq(0).removeAttr('checked');
      $('.product_select_wrap:eq(0) input[type=checkbox]').eq(0).trigger('change');
    }

    showProductList();

  });


  $('ul.opt input[type=checkbox]').bind('click', function () {
    $('.product_no_result').hide();
    dataCnt = 0; // 160928 상세검색 결과 초기화
    var pIdx = $('ul.opt').index($(this).parents('ul.opt'));
    var chkTmp = false;
    $('ul.opt').eq(pIdx).find('input[type=checkbox]').each(function () {
      if ($(this).is(':checked')) {
        chkTmp = true;
      }
    });

    if (chkTmp == true) {
      $('div.product_list').eq(pIdx).find('.coffeeDataSet').hide();

      $('ul.opt').eq(pIdx).find('input[type=checkbox]').each(function () {
        var dTarget = $(this).attr('data-target');
        $('div.product_list').eq(pIdx).find('.coffeeDataSet').each(function () {
          $(this).hide();
          $(this).parent().parent().prev().hide();
        })
        if ($(this).is(':checked')) {
          if (dTarget == "new") {
            $('div.product_list').eq(pIdx).find('.coffeeDataSet').each(function () {
              if ($(this).attr("new") == "Y") {
                $(this).show();
                $(this).parent().parent().prev().show();
                dataCnt++; // 160928 상세검색 선택 시 데이터 존재
              }
            });
          }
          if (dTarget == "season") {
            $('div.product_list').eq(pIdx).find('.coffeeDataSet').each(function () {
              if ($(this).attr("season") == "1") {
                $(this).show();
                $(this).parent().parent().prev().show();
                dataCnt++; // 160928 상세검색 선택 시 데이터 존재
              }
            });
          }
          if (dTarget == "recomm") {
            $('div.product_list').eq(pIdx).find('.coffeeDataSet').each(function () {
              if ($(this).attr("recomm") != "0") {
                $(this).show();
              }
            });
          }
        } else {
          if (dTarget == "new") {
            $('div.product_list').eq(pIdx).find('.coffeeDataSet').each(function () {
              if ($(this).attr("new") == "Y" && dTarget != "new") {
                $(this).hide();
                $(this).parent().parent().prev().hide();
              }
            });
          }
          if (dTarget == "season") {
            $('div.product_list').eq(pIdx).find('.coffeeDataSet').each(function () {
              if ($(this).attr("season") == "1" && dTarget != "season") {
                $(this).hide();
                $(this).parent().parent().prev().hide();
              }
            });
          }
          if (dTarget == "recomm") {
            $('div.product_list').eq(pIdx).find('.coffeeDataSet').each(function () {
              if ($(this).attr("recomm") != "0" && dTarget != "recomm") {
                $(this).hide();
              }
            });
          }
        }
      });
      if (dataCnt < 1 && chkTmp) { // 160928 상세검색 아이콘 선택 후 검색 결과 없을 경우
        $('.product_no_result').show();
      } else { // 160928 상세검색 미선택 시 전체 상품 출력으로 해당 영역 숨김
        $('.product_no_result').hide();
      }
    } else {
      $('div.product_list').eq(pIdx).find('.coffeeDataSet').parent().parent().prev().show();
      $('div.product_list').eq(pIdx).find('.coffeeDataSet').show();
    }

    //coffeeDataSet
  });


  $(window).on("load", function () {
    if (location.href.toUpperCase().indexOf("STATUS=1") > -1) {

      setTimeout(function () {
        $("#select_kind1-1").trigger("click");
      }, 2000);
    }
  });

});

$(function getCoffeeDataSet() {

  $('.icon_blond').hide();
  $('.icon_medium').hide();
  $('.icon_dark').hide();

  $("dl.product_kind_tab > dt > a").each(function () {
    var idx = $("dl.product_kind_tab > dt > a").index($(this));
    var chk_stat = $(this).hasClass('selected');

    if (idx == 0 && chk_stat) {
      $('.product_select_wrap').eq(idx).find('input[type=checkbox]').each(function () {
        var idx2 = $('.product_select_wrap').eq(idx).find('input[type=checkbox]').index($(this));
        var chk_stat2 = $(this).is(':checked');

        if (idx2 == 0 && chk_stat2) {
          getCoffeeList('00', '30', '');
          getCoffeeList('00', '20', '');
          getCoffeeList('00', '10', '');
          getFlavorList('00');
        } else if (idx2 == 1 && chk_stat2) {
          getCoffeeList('00', '30', '');
        } else if (idx2 == 2 && chk_stat2) {
          getCoffeeList('00', '20', '');
        } else if (idx2 == 3 && chk_stat2) {
          getCoffeeList('00', '10', '');
        } else if (idx2 == 4 && chk_stat2) {
          getFlavorList('00');
        }
      });
    } else if (idx == 1 && chk_stat) {
      $('.product_select_wrap').eq(idx).find('input[type=checkbox]').each(function () {
        var idx2 = $('.product_select_wrap').eq(idx).find('input[type=checkbox]').index($(this));
        var chk_stat2 = $(this).is(':checked');

        if (idx2 == 0 && chk_stat2) {
          getCoffeeList('01', '30');
          getCoffeeList('01', '20');
          getCoffeeList('01', '10');
          getFlavorList('01');
        } else if (idx2 == 1 && chk_stat2) {
          getCoffeeList('01', '30');
        } else if (idx2 == 2 && chk_stat2) {
          getCoffeeList('01', '20');
        } else if (idx2 == 3 && chk_stat2) {
          getCoffeeList('01', '10');
        } else if (idx2 == 4 && chk_stat2) {
          getFlavorList('01');
        }
      });
    } else if (idx == 2 && chk_stat) {
      $('.product_select_wrap').eq(idx).find('input[type=checkbox]').each(function () {
        var idx2 = $('.product_select_wrap').eq(idx).find('input[type=checkbox]').index($(this));
        var chk_stat2 = $(this).is(':checked');

        if (idx2 == 0 && chk_stat2) {
          getCoffeeList('02', '30');
          getCoffeeList('02', '20');
          getCoffeeList('02', '10');
          getFlavorList('02');
        } else if (idx2 == 1 && chk_stat2) {
          getCoffeeList('02', '30');
        } else if (idx2 == 2 && chk_stat2) {
          getCoffeeList('02', '20');
        } else if (idx2 == 3 && chk_stat2) {
          getCoffeeList('02', '10');
        } else if (idx2 == 4 && chk_stat2) {
          getFlavorList('02');
        }
      });
    }
  });
})

$(function getCoffeeList(pac, kind) {
  var option = {
    'PACKAGE': pac
    , 'ROAST_KIND': kind
  };

  __ajaxCall('/coffee/getCoffeeList.do', option, true, "JSON", "POST",
    function (data) {
      if (data.list.length > 0) {
        var idx = "";
        var chk_stat = "";
        $("dl.product_kind_tab > dt > a").each(function () {
          idx = $("dl.product_kind_tab > dt > a").index($(this));
          chk_stat = $(this).hasClass('selected');

          if (chk_stat) {
            if (data.list[0].roast_KIND == '30') {
              $('.icon_blond').eq(idx).show();
              $('.icon_blond').eq(idx).next().find('ul').empty();
              $('#tpl_coffeeList').tmpl(data.list).appendTo($('.icon_blond').eq(idx).next().find('ul'));
            } else if (data.list[0].roast_KIND == '20') {
              $('.icon_medium').eq(idx).show();
              $('.icon_medium').eq(idx).next().find('ul').empty();
              $('#tpl_coffeeList').tmpl(data.list).appendTo($('.icon_medium').eq(idx).next().find('ul'));
            } else if (data.list[0].roast_KIND == '10') {
              $('.icon_dark').eq(idx).show();
              $('.icon_dark').eq(idx).next().find('ul').empty();
              $('#tpl_coffeeList').tmpl(data.list).appendTo($('.icon_dark').eq(idx).next().find('ul'));
            }
          }
        });

        $('.productDeImg').unbind('click').bind('click', function () {
          prCd = $(this).attr('prCd');

          if (prCd != "") {
            form = document.pForm;
            form.PRODUCT_CD.value = prCd;
            form.action = "/coffee/product_view.do";
            form.submit();
          }
        });
      }
    },
    function () {
    });
});
function getFlavorList(pac) {
  var option = {
    'PACKAGE': pac
  };
  __ajaxCall('/coffee/getFlavorList.do', option, true, "JSON", "POST",
    function (data) {
      if (data.list.length > 0) {
        var idx = "";
        var chk_stat = "";
        $("dl.product_kind_tab > dt > a").each(function () {
          idx = $("dl.product_kind_tab > dt > a").index($(this));
          chk_stat = $(this).hasClass('selected');

          if (chk_stat) {
            $('.icon_flavor').eq(idx).show();
            $('.icon_flavor').eq(idx).next().find('ul').empty();
            $('#tpl_coffeeList').tmpl(data.list).appendTo($('.icon_flavor').eq(idx).next().find('ul'));
          } else {
            $('.icon_flavor').eq(idx).hide();
          }
        });

        $('.productDeImg').unbind('click').bind('click', function () {
          prCd = $(this).attr('prCd');

          if (prCd != "") {
            form = document.pForm;
            form.PRODUCT_CD.value = prCd;
            form.action = "/coffee/product_view.do";
            form.submit();
          }
        });
      } else {
        $('.icon_flavor').hide();
      }
    },
    function () {
    });
}



function product_list() {

  // 분류 보기 위 & 아래 버튼
  var btnActive = false;
  $("div.product_kind_btn").bind("click", function () {
    if (btnActive == false) {
      $(this).find("img").attr("src", $(this).find("img").attr("src").replace("up", "down"));
      $("div.product_toggle_wrap").hide();
      btnActive = true;
    } else {
      $(this).find("img").attr("src", $(this).find("img").attr("src").replace("down", "up"));
      $("div.product_toggle_wrap").show();
      btnActive = false;
    }
  });

}

function showProductList() {

  $('.product_select_wrap:eq(' + aIndex + ') input[type=checkbox]').each(function () {
    chk_idx = $('.product_select_wrap:eq(' + aIndex + ') input[type=checkbox]').index($(this));
    cate_chk_stat = $(this).is(':checked');

    if (chk_idx == 0) {
      if (cate_chk_stat) {
        $('.product_list:eq(' + aIndex + ') > dl > dd').each(function () {
          var idx = $('.product_list:eq(' + aIndex + ') > dl > dd').index($(this));
          if ($.trim($(this).find('ul').html()) != "") {
            $('.product_list:eq(' + aIndex + ') > dl > dt').eq(idx).show();
            $('.product_list:eq(' + aIndex + ') > dl > dd').eq(idx).show();
          }
        });

        return false;
      } else {
        $('.product_list:eq(' + aIndex + ') > dl > dd > ul').each(function () {
          var idx = $('.product_list:eq(' + aIndex + ') > dl > dd > ul').index($(this));
          $('.product_list:eq(' + aIndex + ') > dl > dt').eq(idx).hide();
          $('.product_list:eq(' + aIndex + ') > dl > dd').eq(idx).hide();
        });
      }
    } else {
      if (cate_chk_stat) {
        if ($.trim($('.product_list:eq(' + aIndex + ') > dl > dd').eq(chk_idx - 1).find('ul').html()) != "") {
          $('.product_list:eq(' + aIndex + ') > dl > dt').eq(chk_idx - 1).show();
          $('.product_list:eq(' + aIndex + ') > dl > dd').eq(chk_idx - 1).show();
        }
      } else {
        $('.product_list:eq(' + aIndex + ') > dl > dt').eq(chk_idx - 1).hide();
        $('.product_list:eq(' + aIndex + ') > dl > dd').eq(chk_idx - 1).hide();
      }
    }
  });
}


function content_tabmenu() {
  $(".content_tabmenu > .tab").bind("click", function () {// 접근성_20171127 focusin 이벤트 삭제
    if (!$(this).hasClass("on")) {
      $(this).parent().children(".on").removeClass("on");
      var index = $(this).addClass("on").closest(".content_tabmenu").children(".tab").index(this);
      $(this).parent().children(".panel").hide().eq(index).show();
    }
  });
  // $("div.finder_list > dl > dd > ul > li").bind("click focusout", function () { // 접근성_20171127 삭제
  //   if (!$(this).hasClass("on")) {
  //     $(this).parent().children(".on").removeClass("on");
  //     var index = $(this).addClass("on").closest(".content_tabmenu").children(".tab").index(this);
  //     $(this).parent().children(".panel").hide().eq(index).show();
  //   }
  // });
}



function finder_list() {
  //finder_list 설정 (나와 어울리는 커피 찾기 리스트)

  // 제품 마우스 오버시 커버
  $("div.finder_list > dl > dd > ul > li").bind("mouseover focusin", function () {
    //$("div.finder_list_cover").remove();
    $(this).append("<div class='finder_list_cover'></div>");
  });
  $("div.finder_list > dl > dd > ul > li").bind("mouseleave focusout", function () {
    $("div.finder_list_cover").remove();
  });
  $("div.finder_list > dl > dd > ul > li").bind("click", function () {
    goUrl = $(this).find("a").attr("href");
    location.href = goUrl;
  });

}

function find_taste() {
  //find_taste (나와 어울리는 커피 찾기 질문)

  $("ul.find_taste01 li dl").animate({ 'opacity': 1, 'top': 0 }, 1500);

  $("ul.find_taste01 a").bind("click", function () {
    $("div.find_section1").stop().animate({ 'top': -700 }, 1500);
    $("div.find_section2").stop().animate({ 'top': 0 }, 1500);
    $("div.find_section3").stop().animate({ 'top': 700 }, 1500);
    $("ul.find_taste02 li > dl").stop().animate({ 'top': 0 }, 2500);
  });

  $("ul.find_taste02 a").bind("click", function () {
    $("div.find_section1").stop().animate({ 'top': -1400 }, 1500);
    $("div.find_section2").stop().animate({ 'top': -700 }, 1500);
    $("div.find_section3").stop().animate({ 'top': 0 }, 1500);
    $("ul.find_taste03 li > dl").stop().animate({ 'top': 0 }, 2500);
  });

}


function selectbox_init() {

  $(".select_box select").on("change", function () {
    $(this).prev().html($(this).find("option:selected").text());
  }).prev().html(function () {
    return $(this).next().find("option:selected").text();
  });

}

