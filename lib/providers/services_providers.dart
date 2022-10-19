import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/api/dio_service.dart';
import '../services/device_info/device_info_service.dart';
import '../services/logger/logger_service.dart';
import '../services/storage/hive_storage_service.dart';
import '../services/storage/storage_service.dart';

final loggerServiceProvider = Provider<LoggerService>((ref) => LoggerService());

final storageServiceProvider = Provider<StorageService>((_) => HiveStorageService());

final dioServiceProvider = Provider<DioService>((ref) => DioService(ref));

final deviceInfoServiceProvider = Provider<DeviceInfoService>((ref) => DeviceInfoService());
