import instantsearch from 'instantsearch.js';
import { searchBox, hits } from 'instantsearch.js/es/widgets';

// 1. Instantiate the search

const searchForm = document.getElementById('search');
const search = instantsearch({
  appId: searchForm.dataset.algoliaAppId,
  apiKey: searchForm.dataset.algoliaApiKey,
  indexName: 'Movie',
  searchParameters: {
    hitsPerPage: 5
  }
});

const searchUser = instantsearch({
  appId: searchForm.dataset.algoliaAppId,
  apiKey: searchForm.dataset.algoliaApiKey,
  indexName: 'User',
  searchParameters: {
    hitsPerPage: 5
  }
});

const searchPlaylist = instantsearch({
  appId: searchForm.dataset.algoliaAppId,
  apiKey: searchForm.dataset.algoliaApiKey,
  indexName: 'Playlist',
  searchParameters: {
    hitsPerPage: 5
  }
});

// 2. Create an interactive search box
search.addWidget(
  searchBox({
    container: document.querySelector('#search-input'),
    placeholder: 'Search'
  })
);

searchUser.addWidget(
  searchBox({
    container: document.querySelector('#search-input'),
    placeholder: 'Search'
  })
);

searchPlaylist.addWidget(
  searchBox({
    container: document.querySelector('#search-input'),
    placeholder: 'Search'
  })
);

// 3. Plug the search results into the product container
const results = document.querySelector('#resultsMovie');
if (results) {
  search.addWidget(
    hits({
      container: document.querySelector('#resultsMovie'),
      templates: {
      item:
        `
          <div class="card-movie">
            <div class="poster-movie">
              <img class ="img-movie" src="{{{_highlightResult.poster_url.value}}}">
            </div>
            <div class="title-movie">
              <div class="title-movie-value"
                <p class="font-weight-bold">{{title}}</p>
              </div>
              <p class="text-truncate" style="max-width: 180px;">By {{director}}</p>
              <p class=" star-all star-{{rating}}"></p>
            </div>
            <a href="/movies/{{id}}" class="resultsalgolia"></a>
          </div>
        `,
      },
    })
  );

  searchUser.addWidget(
    hits({
      container: document.querySelector('#resultsUser'),
      templates: {
      item:
        `
          <div class="card-movie">
            <div class="poster-user">
              <img class ="img-user" src="{{avatar_url}}" height="180" width="180">
            </div>
            <div class="user-name">
              <p class="font-weight-bold">{{username}}</p>
            </div>
            <div>
              <p>Member since {{member_date}}</p>
              <p>Followers: {{nb_followers}}</p>
            </div>
            <a href="/users/{{id}}" class="resultsalgolia"></a>
          </div>
        `,
      },
    })
  );

  searchPlaylist.addWidget(
    hits({
      container: document.querySelector('#resultsPlaylist'),
      templates: {
      item:
        `
          <div class="card-movie">
            <div class="poster-movie">
              <img class ="img-playlist" src="{{picture_url}}">
            </div>
            <div class="user-name">
              <p class="font-weight-bold">{{name}}</p>
            </div>
            <div>
              <p> Created on {{creation_date}}</p>
              <p>Followers: {{nb_followers}}</p>
            </div>
            <a href="/playlists/{{id}}" class="resultsalgolia"></a>
          </div>
        `,
      },
    })
  );

search.on('render', function(){
  document.querySelectorAll(".star-all").forEach((star) => {
    if(star.classList.contains('star-0')) {
      star.innerHTML = '<i class="fas fa-star light-blue-star"></i><i class="fas fa-star light-blue-star"></i><i class="fas fa-star light-blue-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>'
    }
    if(star.classList.contains('star-1')) {
      star.innerHTML = '<i class="fas fa-star blue-star"></i><i class="fas fa-star light-blue-star"></i><i class="fas fa-star light-blue-star"></i><i class="fas fa-star light-blue-star"></i><i class="fas fa-star light-blue-star"></i>'
    }
    if(star.classList.contains('star-2')) {
      star.innerHTML = '<i class="fas fa-star blue-star"></i><i class="fas fa-star blue-star"></i><i class="fas fa-star light-blue-star"></i><i class="fas fa-star light-blue-star"></i><i class="fas fa-star light-blue-star"></i>'
    }
    if(star.classList.contains('star-3')) {
      star.innerHTML = '<i class="fas fa-star blue-star"></i><i class="fas fa-star blue-star"></i><i class="fas fa-star blue-star"></i><i class="fas fa-star light-blue-star"></i><i class="fas fa-star light-blue-star"></i>'
    }
    if(star.classList.contains('star-4')) {
      star.innerHTML = '<i class="fas fa-star blue-star"></i><i class="fas fa-star blue-star"></i><i class="fas fa-star blue-star"></i><i class="fas fa-star blue-star"></i><i class="fas fa-star light-blue-star"></i>'
    }
    if(star.classList.contains('star-5')) {
      star.innerHTML = '<i class="fas fa-star blue-star"></i><i class="fas fa-star blue-star"></i><i class="fas fa-star blue-star"></i><i class="fas fa-star blue-star"></i><i class="fas fa-star blue-star"></i>'
    }
  });
});

// 5. Start the search!
  search.start();
  searchUser.start();
  searchPlaylist.start();
}

