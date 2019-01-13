// Área total das plantações (é preciso atributo para saber se foi colhida)
db.plantacao.aggregate([{$group: {_id: null, Areatotal:{$sum: "$Area"}}}])



// Número de animais da espécie X
db.Animais.find({Especie : "Vaca minhota", Vida: "V"}).count()

// Que espécies consomem o recurso X (Onde tem _id: 1 substituir por valor)
db.Animais.distinct("Especie", {RecursosConsumidos: {$elemMatch: {_id: 1}}})