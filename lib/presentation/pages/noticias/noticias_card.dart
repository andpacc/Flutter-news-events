import 'package:example/domain/entities/models/titular.dart';
import 'package:example/presentation/pages/noticias/bloc/noticias_bloc.dart';
import 'package:example/presentation/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticiaCard extends StatelessWidget {
  const NoticiaCard({
    super.key,
    required this.titular,
    required this.isFavourite,
    required this.onTap,
  });

  final Titular titular;
  final bool isFavourite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          child: SizedBox(
              width: 250,
              height: 250,
              child: Stack(children: [
                Positioned.fill(
                  child: Container(
                    color: Colors.transparent,
                    child: ClipRRect(
                      child: Image.network(
                        titular.foto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: const [0.5, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 12,
                  child: SizedBox(
                    width: 180,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            titular.descripcion,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 12,
                  child: SizedBox(
                    width: 180,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            titular.titulo,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () {
                      isFavourite == false
                          ? BlocProvider.of<NoticiaBloc>(context)
                              .add(AddFavNoticiaEvent(titular: titular))
                          : BlocProvider.of<NoticiaBloc>(context)
                              .add(ClearFavNoticiasEvent(titular));
                    },
                    icon: Icon(
                      color: tertiaryColor(context),
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ),
              ]))),
    );
  }
}
