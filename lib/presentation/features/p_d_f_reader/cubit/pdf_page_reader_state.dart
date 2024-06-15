part of 'pdf_page_reader_cubit.dart';

sealed class PdfPageReaderState extends Equatable {
  const PdfPageReaderState({
    this.swipeHorizontal = true,
    this.autoSpacing = true,
    this.nightMode = true,
  });

  final bool swipeHorizontal;
  final bool autoSpacing;
  final bool nightMode;

  PdfPageReaderState copyWith({
    bool? swipeHorizontal,
    bool? autoSpacing,
    bool? nightMode,
  }) {
    return PdfPageReaderChanged(
      swipeHorizontal: swipeHorizontal ?? this.swipeHorizontal,
      autoSpacing: autoSpacing ?? this.autoSpacing,
      nightMode: nightMode ?? this.nightMode,
    );
  }

  @override
  List<Object> get props => [swipeHorizontal, autoSpacing, nightMode];
}

final class PdfPageReaderInitial extends PdfPageReaderState {}

final class PdfPageReaderChanged extends PdfPageReaderState {
  const PdfPageReaderChanged({
    super.swipeHorizontal,
    super.autoSpacing,
    super.nightMode,
  });

  @override
  List<Object> get props => [swipeHorizontal, autoSpacing, nightMode];
}
