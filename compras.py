lista_de_compras = ['biscoito oreo', 'mel', 'waffle', 'carne', 
	'frango', 'iogurte', 'waffle', 'mel',
	'guarana','biscoito bauducco','tomate','fandangos','cebolitos',
        'paes de queijo','chiclete'
                    ]

print("Compras:")
for compra, indice in zip(lista_de_compras, range(len(lista_de_compras))):
	print(f"Item {indice}:", compra)

print("\n")
print("Compras Set:")
lista_de_comprasSet = set(lista_de_compras)
for compra, indice in zip(lista_de_comprasSet, range(len(lista_de_comprasSet))):
        print(f"Item {indice}:", compra)
