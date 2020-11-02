const db = require("../data/config");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where("id", id).first();
}

function findSteps(id) {
  return db("steps as st")
    .leftJoin("schemes as sc", "sc.id", "st.scheme_id")
    .where("st.scheme_id", id)
    .select([
      "st.id",
      "sc.scheme_name as SchemeName",
      "st.step_number as StepNumber",
      "st.instructions as Instructions",
    ])
    .orderBy("StepNumber");
}

function add(scheme) {
  return db.insert(scheme).into("schemes");
}

function update(changes, id) {
  return db("schemes").where("id", id).update(changes);
}

function remove(id) {
  return db("schemes").where("id", id).del();
}

function addStep(step, scheme_id) {
  return db("steps as st")
    .leftJoin("schemes as sc", "sc.id", "st.scheme_id")
    .where("st.scheme_id", scheme_id)
    .insert(step);
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
  addStep,
};
