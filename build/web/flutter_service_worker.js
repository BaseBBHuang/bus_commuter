'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "e0b73773a99f9c7a23798f8c73b0630c",
"index.html": "ed200e5242ee653aef3dd2c7fdf1da79",
"/": "ed200e5242ee653aef3dd2c7fdf1da79",
"main.dart.js": "e7bc3526932b655a820b1011d59a35f7",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "078e4d6f7134b3e4681215c22d380afd",
"assets/AssetManifest.json": "ecb986269f18f988cf5c524a1597034e",
"assets/NOTICES": "3d1236060470d01d191924cf9efa0341",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "7f68b6bf10230516f55238ed954a50db",
"assets/fonts/MaterialIcons-Regular.otf": "b5f84e0d446dedf8618d4bb010d4b393",
"assets/assets/json/bus_10_work_station.json": "ee88bb5ba3b2f12732f90f4b24768007",
"assets/assets/json/bus_44_off_work_station.json": "ff1b60a017d3606541f5b838a12fa5b3",
"assets/assets/json/bus_1_work_station.json": "0391e9a8d311a5a364deddca0948427a",
"assets/assets/json/bus_15_work_station.json": "4730ee5ea6090f66003d13ed092a0262",
"assets/assets/json/bus_34_off_work_station.json": "272e4a323c3e1ba0f30b70275fc1e266",
"assets/assets/json/bus_21_work_station.json": "45a94fbc709eaf426a7e4fb71b6b90c0",
"assets/assets/json/bus_4_work_station.json": "5a3e6dd23eb275bab35608ed75b239c7",
"assets/assets/json/bus_28_off_work_station.json": "3d5b097bd6d4eab3e5436c6f697905c1",
"assets/assets/json/bus_46_off_work_station.json": "e16bb3726a650ea74e9fa58a73c2e830",
"assets/assets/json/bus_5_holiday_off_work_station.json": "223bf76e64b1ef12d3c06a03ecc37cdc",
"assets/assets/json/bus_11_work_station.json": "68c5e6fe3025d13ec678f7ea7bb0475b",
"assets/assets/json/bus_36_off_work_station.json": "8487778bf6a59f4a86f87f49ddf23501",
"assets/assets/json/bus_14_work_station.json": "d05830541c4168f1ea28aa7076ba7910",
"assets/assets/json/bus_5_work_station.json": "3d4388ce65fd02894e06be7f6ff61fc1",
"assets/assets/json/bus_20_work_station.json": "9e00dc3e399629fa53e1fc0945e9f6fc",
"assets/assets/json/bus_12_work_station.json": "17f142bdf06e3d46efb2271f9d91b880",
"assets/assets/json/bus_30_off_work_station.json": "2d048a74a08598f3965d46d38379d2b3",
"assets/assets/json/bus_3_work_station.json": "76e1f4b7b0eb117fe6c02409fb08580d",
"assets/assets/json/bus_26_off_work_station.json": "8632de055dea925a2ebe1d5b31307343",
"assets/assets/json/bus_17_work_station.json": "0783abc7cd679251aa39390b439345b2",
"assets/assets/json/bus_1_holiday_work_station.json": "134c5badcce999cb23d95b87ee474e5a",
"assets/assets/json/bus_3_holiday_off_work_station.json": "4421454aa09cbb26da7bf3aef133e111",
"assets/assets/json/bus_40_off_work_station.json": "b3f9fd2afc3ecbd34059fa2b7efc5749",
"assets/assets/json/bus_38_off_work_station.json": "82de42e33dcdce0246eef4a0e803bef3",
"assets/assets/json/bus_6_work_station.json": "f97f43778cc0475e575834901ce8fdc8",
"assets/assets/json/bus_23_work_station.json": "74426d88b73d6bfd8b4cd75416d5294e",
"assets/assets/json/work_time.json": "b0001d2eaf89c0ef95561df3f4b97c83",
"assets/assets/json/bus_32_off_work_station.json": "68eca7f0882efb32ffa833c7fa2aa179",
"assets/assets/json/bus_13_work_station.json": "f9cb0a27c8f0156a722c9d0d819faf06",
"assets/assets/json/bus_24_off_work_station.json": "bbaf3a382f51325c711e0aa3b31bf09a",
"assets/assets/json/bus_6_holiday_work_station.json": "e2a78663eed6c247924bb8bd9827a003",
"assets/assets/json/bus_2_work_station.json": "0ec8e10cb7f80e9d40b457e504d262e3",
"assets/assets/json/bus_42_off_work_station.json": "97a3d651dbf558251e3690eabdb82b86",
"assets/assets/json/bus_16_work_station.json": "215bfdbcc13993f81bba1fe245cb0c9b",
"assets/assets/json/holiday_work_time.json": "68b1e1900e6ca479ed499b31d3cf6f56",
"assets/assets/json/bus_4_holiday_off_work_station.json": "be4a243a1d4039243a780823748385a1",
"assets/assets/json/bus_22_work_station.json": "74426d88b73d6bfd8b4cd75416d5294e",
"assets/assets/json/bus_7_work_station.json": "ce5cf0390f91a2009f07caf536c07326",
"assets/assets/json/bus_35_off_work_station.json": "284842752053df66526d6a94ad7cb24d",
"assets/assets/json/holiday_off_work_time.json": "3cd9bb9feb33e197a2a112072d1eb3d9",
"assets/assets/json/bus_45_off_work_station.json": "1edeb3e371fcb5ff06e7c2bba342e877",
"assets/assets/json/bus_37_off_work_station.json": "f6e61f1998fdca9f8ec5aeb33333a951",
"assets/assets/json/bus_29_off_work_station.json": "f9dd671f0f9dd6364a9e3b123c7d4913",
"assets/assets/json/bus_39_off_work_station.json": "842d43e9fc4da643c9fece5f10a49ff3",
"assets/assets/json/bus_41_off_work_station.json": "427f0784e118e97e41b0f82e4a91dcc3",
"assets/assets/json/bus_18_work_station.json": "5349386baf1ebc70e31394971874a71a",
"assets/assets/json/bus_9_work_station.json": "cf50130e23a43c086bc73a75cb5e0609",
"assets/assets/json/bus_27_off_work_station.json": "e662d846cf881b83aaa573059fc34d52",
"assets/assets/json/bus_31_off_work_station.json": "29724405d23be81d6673bf54fa769e31",
"assets/assets/json/bus_2_holiday_work_station.json": "bf55a29986541917fcc19175594e2c29",
"assets/assets/json/bus_43_off_work_station.json": "9b72a2c1b944af6518c0c570023afe35",
"assets/assets/json/bus_19_work_station.json": "b30daa488f71fa07a304eb56c912bb01",
"assets/assets/json/bus_25_off_work_station.json": "0aa4013d18cd26dd3218d0951a546b0f",
"assets/assets/json/bus_33_off_work_station.json": "f163c3db836958e03f941a2609424a22",
"assets/assets/json/bus_8_work_station.json": "c78b1b71931191090add131d8b2b9b47",
"assets/assets/json/off_work_time.json": "1cd5d5e6ddc9d84fb85fbe30cd9b1395",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
