const db = require('./db')

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  return db
    .query(
      `SELECT * FROM users
  WHERE email = $1;
  `,
      [email]
    )
    .then(res => {
      if (res.rows.length === 0) {
        return null;
      } else {
        return res.rows[0];
      }
    })
    .catch(err => console.error("Error", err.stack));
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return db
    .query(
      `SELECT * FROM users
  WHERE id = $1;
  `,
      [id]
    )
    .then(res => {
      if (res.rows.length === 0) {
        return null;
      } else {
        return res.rows[0];
      }
    })
    .catch(err => console.error("Error:", err.stack));
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  const values = [user.name, user.email, user.password];
  return db
    .query(
      `
  INSERT INTO users (name, email, password) VALUES ($1, $2, $3)
  RETURNING *;`,
      values
    )
    .then(res => res.rows[0]);
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  return db
    .query(
      `
      SELECT reservations.*, properties.*, AVG(property_reviews.rating) AS average_rating
      FROM reservations JOIN properties ON properties.id = reservations.property_id
      JOIN property_reviews ON properties.id = property_reviews.property_id
      WHERE end_date < now()::date AND reservations.guest_id = $1
      GROUP BY properties.id, reservations.id
      ORDER BY reservations.start_date
      LIMIT $2;`,
      [guest_id, limit]
    )
    .then(res => res.rows);
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) {
  const queryParams = [];
  let queryString = `
    SELECT properties.*, AVG(property_reviews.rating) AS average_rating
    FROM properties JOIN property_reviews ON properties.id = property_id
    WHERE 1=1
`;

  if (options.city) {

    queryParams.push(`%${options.city}%`);
    queryString += `AND city LIKE $${queryParams.length}`;
  }

  if (options.owner_id) {
    queryParams.push(options.owner_id);
    queryString += `AND owner_id = $${queryParams.length}`;
  }

  if (options.minimum_price_per_night && options.maximum_price_per_night) {
    queryParams.push(
      options.maximum_price_per_night,
      options.minimum_price_per_night
    );
    queryString += `AND cost_per_night < $${queryParams.length -
      1} AND cost_per_night > $${queryParams.length}`;
  }

  queryString += `\nGROUP BY properties.id\n`;

  if (options.minimum_rating) {
    queryParams.push(options.minimum_ratin);
    queryString += `HAVING AVG(property_reviews.rating) >= $${queryParams.length}`;
  }

  queryParams.push(limit);
  queryString += `
    ORDER BY cost_per_night
    LIMIT $${queryParams.length}
`;

  return db.query(queryString, queryParams).then(res => res.rows);
};
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const values = [
    property.title,
    property.description,
    property.number_of_bedrooms,
    property.number_of_bathrooms,
    property.parking_spaces,
    property.cost_per_night,
    property.thumbnail_photo_url,
    property.cover_photo_url,
    property.street,
    property.country,
    property.city,
    property.province,
    property.post_code,
    property.owner_id
  ];
  const queryString = `
  INSERT INTO properties(${Object.keys(property).join(
    ", "
  )}) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) RETURNING *;`;

  console.log(queryString, values);
  return db.query(queryString, values).then(res => res.rows[0]);
}
exports.addProperty = addProperty;
