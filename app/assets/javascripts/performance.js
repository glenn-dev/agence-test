$(document).ready(function(){

  var bgColor = ['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)','#ffff8d','#40c4ff','#69f0ae'];
  var brColor = ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)','rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)','#dfdf47','#0b98da','#1de786'];

  // FETCH DATA FROM DOM:
  function fetchData(){
    let selected = [];
    $('#users_checkbox input:checked').each(function() {
      selected.push($(this).attr('name'));
    });
    let users = selected.join()
    let start_date = $('#start_date').val()
    let end_date = $('#end_date').val()
    if(users && start_date && end_date){
      return {users: users, date1: start_date, date2: end_date}
    } else {
      alert("Debe ingresar al menos un consultor y el periodo a evaluar.")
    }
  }
  // GET DATA
  function getData() {
    let domData = fetchData()
    return $.get("get_data", domData, function(data){
      return data;
    });
  }

  // RELATORIO (RENDER AS PARTIAL)
  $('#relatorio').click(function() {
    let domData = fetchData()
    $.get("relatorio", domData);
  });

  // RANDOM COLOR FUNCTION:
  function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
      color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
  }

  // GRAFICO
  $('#grafico').click( async function() {
    let data = await getData()
    var obj = data;
    var dataset = []
    var monthsArr = []
    var fixed_cost = 0
    
    for (let i = 0; i < obj.length; i++) { 
      var user = obj[i].user
      var report = obj[i].report
      var profitArr = []

      for (let j = 0; j < report.length; j++) { 
        let profit = report[j].profit
        let month = report[j].month
        profitArr.push(profit);
        if( !monthsArr.includes(month) ) {
          monthsArr.push(month);
        }
      }

      fixed_cost += obj[i].report[0].fixed_cost;
      dataset.push(
        { label: `${user} Profit`,
        data: profitArr, 
        backgroundColor: bgColor[i],
        borderColor: brColor[i],
        borderWidth: 1 
      })            
    }

    fixed_cost = fixed_cost / obj.length

    dataset.push({
           label: 'Line Dataset',
           data: Array(monthsArr.length).fill(fixed_cost),
           backgroundColor: 'rgba(54, 162, 235, 0.2)',
           borderColor: 'rgba(54, 162, 235, 1',
           type: 'line'
       })
          
    $('#reports').html("<canvas id='myChart' width='400' height='400'></canvas>")
    var ctx = document.getElementById('myChart').getContext('2d');
    var mixedChart = new Chart(ctx, {
      type: 'bar',
      data: {
          datasets: dataset,
          labels: monthsArr
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

// PIZZA
  $('#pizza').click( async function() {
    let data = await getData()
    var obj = data;
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

    $('#reports').html("<canvas id='myChart' width='400' height='400'></canvas>")
    var ctx = document.getElementById('myChart').getContext('2d');
    var myPieChart = new Chart(ctx, {
      type: 'pie',
      data: pizza,
      options: {
        cutoutPercentage: 5
      }
    });
  });
})