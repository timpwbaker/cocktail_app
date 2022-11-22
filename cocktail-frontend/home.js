
window.addEventListener("load", () => {
  getFormOptions();
  getLastSearchDrinks();
  // Get the form element
  const form = document.getElementById("myForm");

  // Add 'submit' event handler
  form.addEventListener("submit", (event) => {
    event.preventDefault();

    requestDrink();
  });

});

function requestDrink() {
  let url = "http://localhost:3000/drinks/filter_by?"
  const params = getFormValues();

  fetch (url + new URLSearchParams(params))
 .then(resp => resp.json())
 .then(data => {
  console.log(data)
  displayRow(data, "#searched-cocktail-table")
 })
}

function getLastSearchDrinks(){
  let url = "http://localhost:3000/drinks"

  fetch (url)
 .then(resp => resp.json())
 .then(data => data.forEach((drink)=>{
    displayRow(drink, "#cocktail-table")
 }))
}



function displayRow(row, table_id){
  const table = document.querySelector(table_id)
  table.innerHTML +=
  `
  <tr>
    <td>${row.name}</td>
    <td><img src="${row.thumb_url}/preview"></img</td>
    <td>${row.api_id}</td>
  </tr>
  `
}

function getFormValues(){
const category = document.getElementById("selectcategory");
const categoryValue = category.options[category.selectedIndex].value;

const glass = document.getElementById("selectglass");
const glassValue = glass.options[glass.selectedIndex].value;

const ingredient = document.getElementById("selectingredient");
const ingredientValue = ingredient.options[ingredient.selectedIndex].value;

const alcoholicType = document.getElementById("selectalcoholic");
const alcoholicTypeValue = alcoholicType.options[alcoholicType.selectedIndex].value;

return {
  category: categoryValue,
  glass_type: glassValue,
  ingredients: ingredientValue,
  alcoholic_type: alcoholicTypeValue
  }
}


function setSelectOptions(options){
  for(const [key, values] of Object.entries(options)) {
    const selectElement = document.getElementById(`select${key}`);
    const categoryOptions = values;

    createOptions(selectElement, values);
  }
}

function getFormOptions(){
  let url = "http://localhost:3000/drinks/list_options";

  fetch (url)
  .then(resp => resp.json())
  .then(data => { setSelectOptions(data) }) 
}

function createOptions(select, options){
  for(var i = 0; i < options.length; i++) {
    var opt = options[i];

    var el = document.createElement("option");
    el.text = opt;
    el.value = opt;

    select.add(el);
}
}

