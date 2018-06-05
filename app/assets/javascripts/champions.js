$(document).on('turbolinks:load', function() {
  function buildHTML(champion){

    var url_init = "https://ddragon.leagueoflegends.com/cdn/8.10.1/img/champion/"
    var url_end = ".png"
    var image_url = url_init + champion.key + url_end
    var html = `<li>
                  <a href="/champions/${champion.key}" data-champion-id="${champion.id}">
                    <img src="${image_url}" alt="${champion.name}">
                    <p>${champion.name}</p>
                  </a>
                </li>`
    return html;
  }

  function buildskinHTML(skin){
    var url_init = "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/"
    var url_end = ".jpg"
    var image_url = url_init + skin.champion_key + "_" + skin.num + url_end
    skin.name === "default" ? skin.name = skin.champion_name : skin.name
    var html = `<li class="list">
                  <div class="list__meta" data-skin-num = "${skin.num}" data-champion-name = "${skin.champion_name}" data-champion-key = "${skin.champion_key}">
                    <p class="list__meta__name">
                      ${skin.name}
                    </p>
                  </div>
                  <div class="list__image">
                    <img src="${image_url}" alt="${skin.name}">
                  </div>
                </li>`
    return html;
  }

// skin-type実装時に追加
// <p class="list__meta__type">
// Skin Type
// </p>

  var obj = $('#search-field');
  obj.val('');
  obj.on("keyup", function() {
    var input = obj.val();
    if(input != ''){
      $.ajax({
        type: 'GET',
        url: '/champions',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(champions) {
        $("#search-result").empty();
        if (champions.length !== 0) {
          champions.forEach(function(champion){
            var html = buildHTML(champion);
            $(html).appendTo('#search-result');
          });
        }
      })
      .fail(function(){
        alert('チャンピオン検索に失敗しました。');
      })
    }else{
      $("#search-result").empty();
    }
  });

  // $(document).on("click", "#search-result li", function(e){
  //   e.preventDefault();
  //   var champion_id = $('a', this).data('championId');

  //   $.ajax({
  //     type: 'GET',
  //     url: '/search',
  //     data: {id: champion_id},
  //     dataType:'json'
  //   })
  //   .done(function(data) {
  //     $("#main .lists").empty();
  //     if(data.lenght !== 0){
  //       data.forEach(function(skin) {
  //         var html = buildskinHTML(skin);
  //         $(html).appendTo('#main .lists');
  //       });
  //     }
  //   })
  //   .fail(function(data) {
  //     alert('スキン検索に失敗しました');
  //   });
  // });

  // show popupボタンクリック時の処理
  // $(document).on("click", ".list",function(){
  //     $('#popup, #layer').show();
  //     $("#popup").empty();
  //     var url_init = "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/"
  //     var url_end = ".jpg"
  //     var champion_key = $('.list__meta', this).data('championKey');
  //     var skin_num = $('.list__meta', this).data('skinNum');
  //     var url = url_init + champion_key + "_" + skin_num + url_end
  //     $('#popup').append($("<img>").attr({"src":url}));
  //     $('#popup').append($("<i>").attr({"class":"fa fa-window-close close-icon-position"}));
  // });

  // レイヤー/ポップアップのcloseボタンクリック時の処理
  // $('#close, #layer, i').click(function(e) {
  //     $('#popup, #layer').hide();
  // });

});
