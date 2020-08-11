var el = document.getElementById("json_content");

fetch('./responses/recognize_result.json')
  .then(results => results.json())
  .then(data => {
    console.log(data)
    var results = data.return
    if (results != null) {
      for (index in results) {
        el.innerHTML = results[index].user_name
      }
    } else {
      el.innerHTML = "API DOWN"
    };
  });
