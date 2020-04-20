// RELATORIO
$(document).ready(function(){
  $('#relatorio').click(function() {
    let selected = [];
    $('#users_checkbox input:checked').each(function() {
      selected.push($(this).attr('name'));
    });
    let start_date = $('#start_date').val()
    let end_date = $('#end_date').val()
    $.get("relatorio", {users: selected.join(), date1: start_date, date2: end_date});
  });


// GRAFICO
  $('#grafico').click(function() {
    let selected = [];
    $('#users_checkbox input:checked').each(function() {
      selected.push($(this).attr('name'));
    });
    let start_date = $('#start_date').val()
    let end_date = $('#end_date').val()
    $.get("grafico", {users: selected.join(), date1: start_date, date2: end_date}, function(data){
      
      var obj = data;
      var bgColor = ['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)'];
      var brColor = ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)','rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)'];
      var dataset = []
      
      for (let i = 0; i < obj.length; i++) { 
        var user = obj[i].user
        var report = obj[i].report
        var profitArr = []
        var monthsArr = []
        var bgColArr = []
        var brColArr = []
        
        for (let j = 0; j < report.length; j++) { 
          let profit = report[j].profit
          let month = report[j].month
          let bg = bgColor[j]
          let br = brColor[j]
          profitArr.push(profit);
          monthsArr.push(month);
          bgColArr.push(bg);
          brColArr.push(br); 
        }
        if(i < obj.length){
          dataset.push(
            { label: `${user} Profit`,
            data: profitArr, 
            backgroundColor: bgColArr, 
            borderColor: brColArr, 
            borderWidth: 1 
          },)
        } else {
          dataset.push(
            { label: `${user} Profit`,
            data: profitArr, 
            backgroundColor: bgColArr, 
            borderColor: brColArr, 
            borderWidth: 1 
          })
        }
        
      }
      
      $('#reports').html("<canvas id='myChart' width='400' height='400'></canvas>")
      var ctx = document.getElementById('myChart').getContext('2d');
      var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: monthsArr,
          datasets: dataset
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });
    });
  });

// PIZZA
  $('#pizza').click(function() {
    let selected = [];
    $('#users_checkbox input:checked').each(function() {
      selected.push($(this).attr('name'));
    });
    let start_date = $('#start_date').val()
    let end_date = $('#end_date').val()
    $.get("pizza", {users: selected.join(), date1: start_date, date2: end_date}, function(data){

      var obj = data;
      var bgColor = ['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)'];
      var brColor = ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)','rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)'];
      console.log(obj)

      var users = []
      var profits = []
      var bgColArr = []
      var brColArr = []
      
      for (let i = 0; i < obj.length; i++) { 
        var report = obj[i].report
        var profitArr = []
        
        for (let j = 0; j < report.length; j++) { 
          let profit = report[j].profit
          profitArr.push(profit);
        }
        profitArr = profitArr.reduce((a, b) => a + b, 0).toFixed(2)
        profits.push(profitArr);
        bgColArr.push(bgColor[i]);
        brColArr.push(brColor[i]);
        users.push(obj[i].user)
      }

      var pizza = { 
        datasets: [{
          data: profits,
          backgroundColor: bgColArr,
          borderColor: brColArr
        }],
        labels: users
      }
      console.log(pizza)

      $('#reports').html("<canvas id='myChart' width='400' height='400'></canvas>")
      var ctx = document.getElementById('myChart').getContext('2d');
      var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: pizza,
        options: {
          cutoutPercentage: 5
        }
      });
    } );
  });
})