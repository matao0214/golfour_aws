let map //変数の定義
let geocoder //変数の定義

function initMap(){ //コールバック関数
  geocoder = new google.maps.Geocoder() //GoogleMapsAPIジオコーディングサービスにアクセス
  if(document.getElementById('map')){ //'map'というidを取得できたら実行
    map = new google.maps.Map(document.getElementById('map'), { //'map'というidを取得してマップを表示
      center: {lat: 35.6594666, lng: 139.7005536}, //最初に表示する場所（今回は「渋谷スクランブル交差点」が初期値）
      zoom: 15, //拡大率（1〜21まで設定可能）
    });
  }else{ //'map'というidが無かった場合
    map = new google.maps.Map(document.getElementById('show_map'), { //'show_map'というidを取得してマップを表示
      center: {lat: gon.lat, lng: gon.lng}, //controllerで定義した変数を緯度・経度の値とする（値はDBに入っている）
      zoom: 15, //拡大率（1〜21まで設定可能）
    });

    marker = new google.maps.Marker({ //GoogleMapにマーカーを落とす
      position:  {lat: gon.lat, lng: gon.lng}, //マーカーを落とす位置を決める（値はDBに入っている）
      map: map //マーカーを落とすマップを指定
    });
  }
}

function codeAddress(){ //コールバック関数
  let inputAddress = document.getElementById('address').value; //'address'というidの値（value）を取得

  geocoder.geocode( {'address': inputAddress}, function(results, status) { //ジオコードしたい住所を引数として渡す
    if (status == 'OK') {
      let lat = results[0].geometry.location.lat(); //ジオコードした結果の緯度
      let lng = results[0].geometry.location.lng(); //ジオコードした結果の経度
      let mark = {
          lat: lat, //緯度
          lng: lng  //経度
      };
      map.setCenter(results[0].geometry.location); //最も近い、判読可能な住所を取得したい場所の緯度・経度
      let marker = new google.maps.Marker({
          map: map, //マーカーを落とすマップを指定
          position: results[0].geometry.location //マーカーを落とす位置を決める
      });
    } else {
      alert('該当する結果がありませんでした');
    }
  });   
}
