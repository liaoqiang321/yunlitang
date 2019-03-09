var url = 'http://47.106.225.32:1004/api/'
function getAjaxData(url,method,obj) {
  api.ajax({
      url: url,
      method: method,
      data: {
          values: obj,
      }
  },function(ret, err){
      if (ret) {
          alert( JSON.stringify( ret ) );
      } else {
          alert( JSON.stringify( err ) );
      }
  });

}
