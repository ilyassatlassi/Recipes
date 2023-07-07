<a name="readme-top"></a>

<div align="center">
  <h3><b>Recipe app</b></h3>
</div>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 \[Recipe app\] ](#-blog-app-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Run the project](#run-the-project)
    - [Run tests](#run-tests)
  - [👤 Author ](#-author-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 [Recipe app] <a name="about-project"></a>

**The Recipe app** The Recipe app keeps track of all your recipes, ingredients, and inventory. It will allow you to save ingredients, keep track of what you have, create recipes, and generate a shopping list based on what you have and what you are missing from a recipe. Also, since sharing recipes is an important part of cooking the app should allow you to make them public so anyone can access them.

## 🛠 Built With <a name="built-with-Ruby"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Technologies</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
    <li><a href="https://github.com/heartcombo/devise">Devise for authentication</a></li>
    <li><a href="https://github.com/rspec/rspec-rails">Rspec rails for unit tests</a></li>
  </ul>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Features -->

### Key Features <a name="key-features"></a>
- [x] The app will have some common interfaces, but depending on your team size it will have a couple of extra ones. These are some of the interfaces and some wireframes for some of them:
    - A login page.
    - A registration page.
    - A food list (with all CRUD implementation, except for 'update').
    - A recipes list (with all CRUD implementation, except for 'update').
    - A general shopping list view (all missing food for all your recipes and total price).
    - A list of all public recipes from other users with their names and total prices.
- [x] Login page and registration page:
    - Should be built with Devise.
- [x] Food list:
    - Should display a list of food added by the logged-in user as in the wireframe (display also quantity of a given food).
    - Should lead to a form that allows users to add new food.
- [x] Recipes list:
    - Should display a list of recipes created by the logged-in user as in the wireframe.
    - Should lead to recipe details.
    - If the user is the owner of the recipe, should allow the user to delete it.
- [x] Public recipe list:
    - Should display a list of all public recipes ordered by newest as in the wireframe.
    - Should lead to recipe details.
- [x] Recipe details:
    - Should display a toggle button that allows for a recipe to be made public or private.
    - If the recipe is public or the user is the owner of the recipe, should display the recipe details as in the wireframe.
    - If the user is the owner of the recipe, should lead to the form that allows the user to add new food.
- [x] General shopping list view:
    - Should show the list of food that is missing for all recipes of the logged-in user (compare the list of food for all recipes with the general food list of that user).
    - Should count the total food items and total price of the missing food.
- [x] Make sure there are no N+1 queries happening.
- [x] Create a navigation menu that allows users to open all of the pages you created.
- [x] Write unit and integration tests


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need to have the following in local computer:

- [ ] install Ruby
- [ ] install Ruby on Rails
- [ ] install PostgreSQL

### Setup

Clone this repository to your desired folder:

- [ ] Open terminal
- [ ] git clone https://github.com/ilyassatlassi/Recipes.git
- [ ] cd Recipes
  

### Install

Install this project with:

 - [ ] bundle install


### Run the project

To run the project, run the following command:

- [ ] rails server


### Run tests

To run tests, run the following command:

- [ ] Rspec spec

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **BB Simon**

- GitHub: [@githubhandle](https://github.com/BB-Simon) 
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/bb-simon/)
- Twitter: [@twitterhandle](https://twitter.com/bb_s_imon) 

👤 **Ilyass Atlassi**

- GitHub: [@githubhandle](https://github.com/ilyassatlassi)
- Twitter: [@twitterhandle](https://twitter.com/ilyass_atlassi)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/ilyassatlassi/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] Inventories list
    - Should display a list of inventories created by the logged-in user as in the wireframe.
    - Should lead to inventory details.
    - If the user is the owner of the inventory, should allow to delete it.
- [ ] Inventory details:
    - Should display the inventory details as in the wireframe.
    - Should lead to a form that allows users to add new food.
- [ ] Recipe details:
    - Should have a modal to choose an inventory to create a shopping list with, as in the wireframe.
- [ ] Inventory shopping list:
    - Should show the list of food that is missing by comparing the food in the recipe with the food in the inventory.
    - Should count the total food items and total price of the missing food.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ilyassatlassi/Recipes/issues).


<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

- Give a ⭐️ if you like this project!


<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

-  I would like to thank [Microverse](https://www.microverse.org/) for giving us this opportunity to learn and grow as a developer by providing me with Recipe app idea with it's wireframes.


<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT licensed](./LICENSE).

<p align="right">(<a href="#readme-top">back to top</a>)</p>
